export default (sequelize, Sequelize) => {
  const TeamDevices = sequelize.define(
    "TeamDevices",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      teamId: {
        type: Sequelize.INTEGER,
        field: "team_id",
      },
      deviceKey: {
        type: Sequelize.STRING(255),
        unique: true,
        field: "device_key",
      },
      uuid: {
        type: Sequelize.STRING(255),
      },
      courierId: {
        type: Sequelize.INTEGER,
        field: "courier_id",
      },
      driverCourierId: {
        type: Sequelize.INTEGER,
        field: "driver_courier_id",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "team_devices",
    },
  );

  return TeamDevices;
};
