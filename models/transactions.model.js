export default (sequelize, Sequelize) => {
  const Transactions = sequelize.define(
    "Transactions",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
      },
      transact_date: {
        type: Sequelize.DATE,
      },
      sourceStock: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: "source_stock",
      },
      stockId: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: "dest_stock",
      },
      notes: {
        type: Sequelize.TEXT,
      },
      user: {
        type: Sequelize.STRING(30),
      },
      status: {
        type: Sequelize.INTEGER,
      },
      date: {
        type: Sequelize.DATEONLY,
        field: "action_date",
      },
      approver: {
        type: Sequelize.STRING(30),
      },
      orderid: {
        type: Sequelize.INTEGER,
      },
      creatorRole: {
        type: Sequelize.INTEGER,
      },
      day_part: {
        type: Sequelize.STRING(10),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "transactions",
    },
  );

  return Transactions;
};
