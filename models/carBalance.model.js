export default (sequelize, Sequelize) => {
  const CarBalance = sequelize.define(
    "CarBalance",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
        unique: true,
        allowsNull: false,
      },
      carId: {
        type: Sequelize.INTEGER,
      },
      prodId: {
        type: Sequelize.INTEGER,
      },
      balance: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "car_balance",
    },
  );

  return CarBalance;
};
