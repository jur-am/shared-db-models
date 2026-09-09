export default (sequelize, Sequelize) => {
  const CarGroupThresholds = sequelize.define(
    "CarGroupThresholds",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      prgId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        unique: "car_group_thresholds_prg_id_car_group_id",
        field: "prg_id",
      },
      carGroupId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        unique: "car_group_thresholds_prg_id_car_group_id",
        field: "car_group_id",
      },
      status: {
        type: Sequelize.ENUM("0", "1"),
        defaultValue: "1",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "car_group_thresholds",
    },
  );

  return CarGroupThresholds;
};
