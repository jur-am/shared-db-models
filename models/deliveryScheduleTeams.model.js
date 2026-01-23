export default (sequelize, Sequelize) => {
  const DeliveryScheduleTeams = sequelize.define(
    "DeliveryScheduleTeams",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowsNull: false,
      },
      deliveryScheduleId: {
        type: Sequelize.INTEGER,
      },
      dayPartId: {
        type: Sequelize.INTEGER.UNSIGNED,
      },
      teamDeviceId: {
        type: Sequelize.INTEGER.UNSIGNED,
      },
      courierId: {
        type: Sequelize.INTEGER,
      },
      driverCourierId: {
        type: Sequelize.INTEGER,
      },
      internId: {
        type: Sequelize.INTEGER,
      },
      carId: {
        type: Sequelize.INTEGER,
      },
      carStatusId: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: "carStatus",
      },
      lastUpdate: {
        type: Sequelize.DATE,
      },
      user: {
        type: Sequelize.STRING(45),
      },
      sendToCourierDate: {
        type: Sequelize.DATE,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "delivery_schedule_teams",
    },
  );

  return DeliveryScheduleTeams;
};
