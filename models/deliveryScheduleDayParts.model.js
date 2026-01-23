export default (sequelize, Sequelize) => {
  const DeliveryScheduleDayParts = sequelize.define(
    "DeliveryScheduleDayParts",
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
      dayPart: {
        type: Sequelize.ENUM("09:00:00", "14:00:00", "17:30:00", "21:00:00"),
      },
      lastUpdate: {
        type: Sequelize.DATE,
      },
      user: {
        type: Sequelize.STRING(45),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "delivery_schedule_day_parts",
    },
  );

  return DeliveryScheduleDayParts;
};
