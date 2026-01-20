export default (sequelize, Sequelize) => {
  const PostponedOrders = sequelize.define(
    "PostponedOrders",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      deliveryDate: {
        type: Sequelize.DATE,
        field: "dateOfSend",
      },
      dayPart: {
        type: Sequelize.TIME,
      },
      teamNumber: {
        type: Sequelize.INTEGER,
      },
      courierId: {
        type: Sequelize.INTEGER,
      },
      driverCourierId: {
        type: Sequelize.INTEGER,
      },
      reasonId: {
        type: Sequelize.INTEGER,
      },
      orderId: {
        type: Sequelize.INTEGER,
      },
      carId: {
        type: Sequelize.INTEGER,
      },
      user: {
        type: Sequelize.STRING(50),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "postponed_orders",
    },
  );

  return PostponedOrders;
};
