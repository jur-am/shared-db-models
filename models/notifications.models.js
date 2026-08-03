export default (sequelize, Sequelize) => {
  const Notification = sequelize.define(
    "Notification",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      title: {
        type: Sequelize.STRING(255),
      },
      titleEn: {
        type: Sequelize.STRING(255),
        field: "title_en",
      },
      titleRu: {
        type: Sequelize.STRING(255),
        field: "title_ru",
      },
      body: {
        type: Sequelize.STRING(300),
      },
      bodyEn: {
        type: Sequelize.STRING(300),
        field: "body_en",
      },
      bodyRu: {
        type: Sequelize.STRING(300),
        field: "body_ru",
      },
      date: {
        type: Sequelize.DATE,
      },
      type: {
        type: Sequelize.STRING(255),
      },
      status: {
        type: Sequelize.STRING(255),
      },
      custId: {
        type: Sequelize.INTEGER,
        field: "customer_id",
      },
      hasRead: {
        type: Sequelize.ENUM("0", "1"),
        defaultValue: "0",
        field: "has_read",
      },
      orderId: {
        type: Sequelize.INTEGER,
        field: "order_id",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "notification",
    },
  );
  return Notification;
};
