export default (sequelize, Sequelize) => {
  const DeliveryTimeManagement = sequelize.define(
    "DeliveryTimeManagement",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      dayPart: {
        type: Sequelize.STRING(10),
        field: "partOfDay",
      },
      timeRange1: {
        type: Sequelize.STRING(11),
      },
      timeRange2: {
        type: Sequelize.STRING(11),
      },
      timeRange3: {
        type: Sequelize.STRING(11),
      },
      timeRange4: {
        type: Sequelize.STRING(11),
      },
      siteTimeRange1: {
        type: Sequelize.STRING(11),
      },
      siteTimeRange2: {
        type: Sequelize.STRING(11),
      },
      siteTimeRange3: {
        type: Sequelize.STRING(11),
      },
      siteTimeRange4: {
        type: Sequelize.STRING(11),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "deliverytimemanagement",
    },
  );

  return DeliveryTimeManagement;
};
