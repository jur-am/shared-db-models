export default (sequelize, Sequelize) => {
  const DeliverySchedule = sequelize.define(
    "DeliverySchedule",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowsNull: false,
      },
      deliveryDate: {
        type: Sequelize.DATEONLY,
        field: "delivery_date",
      },
      isFilled: {
        type: Sequelize.ENUM("0", "1"),
        field: "is_filled",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "delivery_schedule",
    },
  );

  return DeliverySchedule;
};
