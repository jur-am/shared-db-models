export default (sequelize, Sequelize) => {
  const Stocks = sequelize.define(
    "Stocks",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      stockname: {
        type: Sequelize.STRING(100),
      },
      carId: {
        type: Sequelize.INTEGER,
        field: "carid",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "stocks",
    },
  );

  return Stocks;
};
