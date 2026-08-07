export default (sequelize, Sequelize) => {
  const SerialNumberResponse = sequelize.define(
    "SerialNumberResponse",
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
        type: Sequelize.STRING(200),
      },
      failure: {
        type: Sequelize.TEXT,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
        field: "created_at",
      },
    },
    {
      timestamps: true,
      updatedAt: false,
      freezeTableName: true,
      tableName: "SerialNumberResponse",
    },
  );

  return SerialNumberResponse;
};
