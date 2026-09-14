export default (sequelize, Sequelize) => {
  const CarType = sequelize.define(
    "CarType",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING(50),
        allowNull: false,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "car_type",
    },
  );

  return CarType;
};
