# @jur.am/shared-models

Sequelize models for the CRM `water` database, shared by the Node.js services that read and write it: `delivery-app-api`, `proxy-server` and `wms-nodejs-backend`. Each service pins a release tag in its `package.json`.

The CRM (PHP/Yii) owns the database and its migrations. This package only describes tables the Node.js services use, and `schema/water.sql` holds the full structure for tests.

## Usage

Install from GitHub at a release tag:

```json
"dependencies": {
  "@jur.am/shared-models": "github:jur-am/shared-db-models#1.3.8",
  "sequelize": "^6.37.7"
}
```

Create the Sequelize connection in the service and pass it in. The package returns every model with its associations, plus `sequelize` and `Sequelize`:

```javascript
import Sequelize from "sequelize";
import initModels from "@jur.am/shared-models";

const sequelize = new Sequelize(dbName, dbUser, dbPassword, { host: dbHost, dialect: "mysql", timezone: "+04:00" });
const db = initModels(sequelize, Sequelize);

const order = await db.orders.findByPk(501, { include: [db.orderedProducts] });
```

## Structure

```
index.js               # Imports every model, defines the associations, returns the db object
models/*.js            # One file per table: (sequelize, Sequelize) => sequelize.define(...)
schema/water.sql       # Structure of the whole water database, for tests
scripts/               # update-water-schema.sh
```

## Changing a model

1. Change the database first, with a CRM migration in `crm/water2/admin/protected/migrations`. Models must match real columns; Sequelize does not create or alter tables here.
2. Add or update the model in `models/`. New models also need an import, a `db.<name> = ...` line and any associations in `index.js`.
3. Update `schema/water.sql` (see below) in the same pull request.
4. After merging into `main`, tag a release and bump the tag in each service that needs the change.

## Releases

Work merges into `main`. A release is a git tag on `main`, such as `1.3.9`, and services pin that tag in `package.json`. The `version` field in this repo's `package.json` is not used for releases.

To try unreleased changes in a service locally, point the dependency at your checkout and reinstall:

```json
"@jur.am/shared-models": "file:../shared-db-models"
```

Do not commit that change in the service.

## Database schema for tests

`schema/water.sql` contains the structure of the `water` database: every table, column, index and foreign key, with no data except `tbl_migration`, which lists the CRM migrations included. Integration tests load it into an empty test database. It is based on the stage CRM database and loads on MariaDB 10.11 and later.

Services read it from the installed package:

```
node_modules/@jur.am/shared-models/schema/water.sql
```

### Updating it after CRM migrations

Run from this repo, passing the path to a CRM checkout:

```bash
./scripts/update-water-schema.sh ../crm
```

The script loads the current `schema/water.sql` into a throwaway MariaDB container, applies the CRM's pending migrations with its own `yiic migrate`, fails if any CRM migration is not recorded, and writes the result back. It never connects to a real database, and it removes its containers when it finishes.

It needs Docker, `composer install` in `crm/water2`, and the CRM PHP image from `docker compose build app` in `crm/water2` (set `CRM_IMAGE` to use another image name).

Review the diff before committing: it should only contain the changes from the new migrations.

If a migration fails because its change already exists in the schema (for example an index someone added by hand), compare the existing definition with the migration. If they match, add the migration's row to the `tbl_migration` inserts at the end of `schema/water.sql`, in the same format as the others, and run the script again. It then skips that migration instead of applying it twice.

### Checking against a real server

To confirm the file still matches stage or production, export the structure there (no customer data is included):

```bash
mariadb-dump -u <user> -p --no-data --skip-comments --skip-dump-date --routines --triggers --events water > water-structure.sql
mariadb-dump -u <user> -p --no-create-info --skip-extended-insert --skip-comments --compact water tbl_migration > water-migrations.sql
```

Then compare table definitions with those in `schema/water.sql`, ignoring `AUTO_INCREMENT=` counters.
