export default (sequelize, Sequelize) => {
  const TransactionItems = sequelize.define(
    "TransactionItems",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
      },
      transId: {
        type: Sequelize.INTEGER,
        field: "transact_id",
      },
      prodId: {
        type: Sequelize.INTEGER,
        field: "product_id",
      },
      count: {
        type: Sequelize.INTEGER,
      },
      price: {
        type: Sequelize.DOUBLE,
      },
      vat: {
        type: Sequelize.ENUM("1", "0"),
        defaultValue: 1,
      },
      note: {
        type: Sequelize.STRING(255),
        defaultValue: "",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "transaction_items",
    },
  );

  return TransactionItems;
};
