export default (sequelize, Sequelize) => {
  const CarStatus = sequelize.define(
    "CarStatus",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowsNull: false,
      },
      status: {
        type: Sequelize.STRING(100),
        allowsNull: false,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "car_status",
    },
  );

  return CarStatus;
};
