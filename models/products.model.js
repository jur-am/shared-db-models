export default (sequelize, Sequelize) => {
  const Products = sequelize.define(
    "Products",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
        field: "IdProduct",
      },
      prodName: {
        type: Sequelize.STRING(50),
        field: "NameProduct",
      },
      prodType: {
        type: Sequelize.STRING(50), // NOTE: Seem that need to change db type to be integer
        field: "TypeProduct",
      },
      zone_id: {
        type: Sequelize.INTEGER.UNSIGNED,
      },
      product_suppliers_id: {
        type: Sequelize.INTEGER.UNSIGNED,
      },
      barcode: {
        type: Sequelize.STRING(16),
      },
      NotUse: {
        type: Sequelize.TINYINT(1),
      },
      blockCount: {
        type: Sequelize.INTEGER,
        field: "block_quantity",
      },
      stockId: {
        type: Sequelize.INTEGER,
        field: "stock_id",
      },
      stockId1: {
        type: Sequelize.TINYINT,
        field: "stock_id_1",
      },
      stockId2: {
        type: Sequelize.TINYINT,
        field: "stock_id_2",
      },
      costofUnit: {
        type: Sequelize.DOUBLE(15, 2),
        field: "CostofUnit",
      },
      blockPrice: {
        type: Sequelize.DOUBLE(15, 2),
      },
      isBlockPriceActive: {
        type: Sequelize.ENUM("1", "0"),
        defaultValue: "0",
      },
      legalPrice: {
        type: Sequelize.DOUBLE(10, 2),
        field: "legal_price",
        defaultValue: "0.00",
      },
      specialPrice: {
        type: Sequelize.DOUBLE(10, 2),
        field: "special_price",
        defaultValue: "0.00",
      },
      bonusType: {
        type: Sequelize.INTEGER,
        field: "bonus_type",
        defaultValue: "1",
      },
      minSalesCount: {
        type: Sequelize.INTEGER,
      },
      minSalesCountBarcode: {
        type: Sequelize.STRING(16),
      },
      blockBarcode: {
        type: Sequelize.STRING(16),
      },
      weight: {
        type: Sequelize.FLOAT(7, 2),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "t_product",
    },
  );

  return Products;
};
