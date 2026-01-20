export default (sequelize, Sequelize) => {
  const OrderedProducts = sequelize.define(
    "OrderedProducts",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      orderId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "IdOrder",
      },
      prodId: {
        type: Sequelize.INTEGER,
        field: "IdProduct",
      },
      count: {
        type: Sequelize.INTEGER,
        field: "Quantiti",
      },
      price: {
        type: Sequelize.DOUBLE,
        field: "Cost",
      },
      points: {
        type: Sequelize.INTEGER,
      },
      promoId: {
        type: Sequelize.INTEGER,
        field: "promoid",
      },
      percent: {
        type: Sequelize.DOUBLE,
        field: "Percent",
      },
      state: {
        type: Sequelize.INTEGER,
        defaultValue: "1",
      },
      custId: {
        type: Sequelize.INTEGER,
        field: "IdCustomers",
      },
      soldByBlock: {
        type: Sequelize.ENUM("0", "1"),
        defaultValue: "0",
      },
      blockPrice: {
        type: Sequelize.DOUBLE,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "ordered_products",
    },
  );

  return OrderedProducts;
};
