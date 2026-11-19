#!/usr/bin/env bash
# Regenerates schema/water.sql after CRM migrations are added.
#
# Loads the current schema/water.sql into a throwaway MariaDB, applies the CRM's pending migrations with its own
# `yiic migrate`, checks that every CRM migration is recorded, and writes the resulting structure back. Nothing runs
# against a real database; the containers and network are removed on exit.
#
# Usage: scripts/update-water-schema.sh <path-to-crm-repo>
#
# Needs Docker, a CRM checkout with `composer install` done (water2/vendor), and the CRM PHP image from
# `docker compose build app` in crm/water2 (override with CRM_IMAGE).
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <path-to-crm-repo>" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SCHEMA="$ROOT/schema/water.sql"
CRM_DIR="$(cd "$1" && pwd)/water2"
CRM_IMAGE="${CRM_IMAGE:-jur-crm-app}"
MARIADB_IMAGE="${MARIADB_IMAGE:-mariadb:11.4}"
NAME="water-schema-$$"
PASSWORD="schema"

[ -f "$CRM_DIR/vendor/autoload.php" ] || { echo "Run composer install in $CRM_DIR first." >&2; exit 1; }
[ -f "$CRM_DIR/.env.example" ] || { echo "$CRM_DIR/.env.example not found." >&2; exit 1; }
docker image inspect "$CRM_IMAGE" >/dev/null 2>&1 || { echo "Docker image $CRM_IMAGE not found. Build it with docker compose build app in $CRM_DIR." >&2; exit 1; }

TMP="$(mktemp -d)"
cleanup() {
  docker rm -f "$NAME-db" "$NAME-redis" >/dev/null 2>&1 || true
  docker network rm "$NAME" >/dev/null 2>&1 || true
  rm -rf "$TMP"
}
trap cleanup EXIT

sql() { docker exec -i "$NAME-db" mariadb -uroot -p"$PASSWORD" "$@"; }

docker network create "$NAME" >/dev/null
# Same sql_mode and server character set as production (crm/mariadb/my.cnf)
docker run -d --name "$NAME-db" --network "$NAME" --network-alias mariadb -e MARIADB_ROOT_PASSWORD="$PASSWORD" \
  "$MARIADB_IMAGE" --sql-mode= --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci >/dev/null
# yiic caches the database schema in Redis
docker run -d --name "$NAME-redis" --network "$NAME" --network-alias redis redis:alpine \
  redis-server --requirepass "$PASSWORD" >/dev/null

for _ in $(seq 1 60); do
  docker exec "$NAME-db" healthcheck.sh --connect --innodb_initialized >/dev/null 2>&1 && break
  sleep 1
done

sql -e "CREATE DATABASE water"
sql water < "$SCHEMA"

grep -vE '^(DB_HOST|DB_DATABASE|DB_USER|DB_PASSWORD|REDIS_HOST|REDIS_PORT|REDIS_PASSWORD)=' "$CRM_DIR/.env.example" > "$TMP/.env"
cat >> "$TMP/.env" <<EOF
DB_HOST=mariadb
DB_DATABASE=water
DB_USER=root
DB_PASSWORD=$PASSWORD
REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=$PASSWORD
EOF

docker run --rm --network "$NAME" --user "$(id -u):$(id -g)" \
  -v "$CRM_DIR:/var/www/html/crm/water2" -v "$TMP/.env:/var/www/html/crm/water2/.env:ro" \
  -w /var/www/html/crm/water2 "$CRM_IMAGE" php admin/protected/yiic.php migrate --interactive=0

ls "$CRM_DIR/admin/protected/migrations" | sed -n 's/\.php$//p' | LC_ALL=C sort > "$TMP/files.txt"
sql water -N -e "SELECT version FROM tbl_migration WHERE version <> 'm000000_000000_base'" | LC_ALL=C sort > "$TMP/recorded.txt"
missing="$(LC_ALL=C comm -23 "$TMP/files.txt" "$TMP/recorded.txt")"
if [ -n "$missing" ]; then
  echo "These CRM migrations are not recorded in tbl_migration:" >&2
  echo "$missing" >&2
  exit 1
fi

{
  cat <<'EOF'
-- Structure of the CRM `water` database shared by the CRM, delivery-app-api, proxy-server and wms-nodejs-backend.
-- Contains no data except tbl_migration, which lists the CRM migrations included.
-- Based on the stage CRM database; later CRM migrations are applied by scripts/update-water-schema.sh.
-- Regenerate with that script after CRM migrations are added. Do not edit by hand.

EOF
  docker exec "$NAME-db" mariadb-dump -uroot -p"$PASSWORD" --no-data --skip-comments --skip-dump-date \
    --routines --triggers --events water
  echo
  docker exec "$NAME-db" mariadb-dump -uroot -p"$PASSWORD" --no-create-info --skip-extended-insert --skip-comments \
    --compact water tbl_migration
} | sed -E -e '/enable the sandbox mode/d' -e 's/ AUTO_INCREMENT=[0-9]+//' > "$TMP/water.sql"

mv "$TMP/water.sql" "$SCHEMA"
echo "Updated $SCHEMA ($(grep -c '^CREATE TABLE' "$SCHEMA") tables, $(wc -l < "$TMP/recorded.txt") migrations)."
