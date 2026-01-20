export default (sequelize, Sequelize) => {
  const CreditReturn = sequelize.define(
    "CreditReturn",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowsNull: false,
      },
      creditType: {
        type: Sequelize.INTEGER,
        field: "credit_type",
      },
      orderId: {
        type: Sequelize.INTEGER,
        field: "orderid",
      },
      count: {
        type: Sequelize.INTEGER,
      },
      updatedCount: {
        type: Sequelize.INTEGER,
        field: "updatedcount",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "credit_return",
    },
  );

  return CreditReturn;
};
