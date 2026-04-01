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
      reasonExplanation: {
        type: Sequelize.STRING(200),
      },
      reasonId: {
        type: Sequelize.INTEGER,
        field: "thirdPersonReasonId",
      },
      reasonCreatedAt: {
        type: Sequelize.DATE,
        field: "thirdPersonReasonCreatedAt",
      },
      sendToCourierDate: {
        type: Sequelize.DATE,
      },
      documentsReadyDate: {
        type: Sequelize.DATE,
      },
      teamApproval: {
        type: Sequelize.TINYINT(1),
      },
      attachedStorage: {
        type: Sequelize.TINYINT(1),
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
