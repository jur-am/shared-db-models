export default (sequelize, Sequelize) => {
  const CarGroup = sequelize.define(
    "CarGroup",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING(45),
      },
      status: {
        type: Sequelize.ENUM("0", "1"),
        defaultValue: "1",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "car_groups",
    },
  );

  return CarGroup;
};
