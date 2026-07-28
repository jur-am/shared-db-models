export default (sequelize, Sequelize) => {
  const OrderPrintResult = sequelize.define(
    "OrderPrintResult",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      orderId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "order_id",
      },
      code: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      message: {
        type: Sequelize.STRING(200),
      },
      errorMessage: {
        type: Sequelize.STRING(200),
        field: "error_message",
      },
      receiptId: {
        type: Sequelize.BIGINT,
        field: "receipt_id",
      },
      sn: {
        type: Sequelize.STRING(20),
      },
      time: {
        type: Sequelize.DATE,
      },
      fiscal: {
        type: Sequelize.STRING(20),
      },
      qr: {
        type: Sequelize.TEXT,
      },
      total: {
        type: Sequelize.DOUBLE,
      },
      change: {
        type: Sequelize.DOUBLE,
      },
      emarkCount: {
        type: Sequelize.INTEGER,
        field: "emark_count",
      },
      emarkVerificationCode: {
        type: Sequelize.STRING(45),
        field: "emark_verification_code",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "order_print_result",
    },
  );

  return OrderPrintResult;
};
