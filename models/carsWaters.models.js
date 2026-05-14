export default (sequelize, Sequelize) => {
  const CarsWaters = sequelize.define(
    "CarsWaters",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
        unique: true,
      },
      day: {
        type: Sequelize.DATEONLY,
      },
      part: {
        type: Sequelize.ENUM("09:00:00", "14:00:00", "17:30:00", "21:00:00"),
      },
      car: {
        type: Sequelize.INTEGER,
      },
      byuregh: {
        type: Sequelize.SMALLINT,
      },
      maqurJur19: {
        type: Sequelize.SMALLINT,
        field: "maqur_jur_19",
      },
      byureghStatic: {
        type: Sequelize.SMALLINT,
        field: "byuregh_static",
      },
      maqurJur19Static: {
        type: Sequelize.SMALLINT,
        field: "maqur_jur_19_static",
      },
      orderCount: {
        type: Sequelize.SMALLINT,
        field: "order_count",
      },
      roadOrders: {
        type: Sequelize.SMALLINT,
        field: "road_orders",
      },
      actualLoaded: {
        type: Sequelize.SMALLINT,
        field: "actual_loaded",
      },
      teamNumber: {
        type: Sequelize.STRING(3),
        field: "team_number",
      },
      roadDeliveredWaters: {
        type: Sequelize.SMALLINT,
        field: "road_delivered_waters",
      },
      additionalWaters: {
        type: Sequelize.SMALLINT,
        field: "additional_waters",
      },
      deliveredWaters: {
        type: Sequelize.SMALLINT,
        field: "delivered_waters",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "cars_waters",
    },
  );

  return CarsWaters;
};
