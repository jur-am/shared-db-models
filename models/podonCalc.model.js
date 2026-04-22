export default (sequelize, Sequelize) => {
  const PodonCalc = sequelize.define(
    "PodonCalc",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        field: "id",
      },
      deliveryDate: {
        type: Sequelize.DATEONLY,
        field: "date",
      },
      dayPart: {
        type: Sequelize.TIME,
        field: "day_part",
      },
      carId: {
        type: Sequelize.INTEGER,
        field: "id_car",
      },
      byuregh19: {
        type: Sequelize.INTEGER,
      },
      makurJur19: {
        type: Sequelize.INTEGER,
      },
      permissibleAmount: {
        type: Sequelize.INTEGER,
        field: "permissible_amount",
      },
      status: {
        type: Sequelize.TINYINT,
        field: "status",
      },
      collectionDate: {
        type: Sequelize.DATE,
        defaultValue: null,
        field: "collection_date",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "podon_calc",
    },
  );

  return PodonCalc;
};
