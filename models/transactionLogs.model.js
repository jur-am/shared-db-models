export default (sequelize, Sequelize) => {
  const TransactionLogs = sequelize.define(
    "TransactionLogs",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      transactId: {
        type: Sequelize.INTEGER,
        field: "transact_id",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "transaction_logs",
    },
  );

  return TransactionLogs;
};
