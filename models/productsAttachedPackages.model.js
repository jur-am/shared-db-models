export default (sequelize, Sequelize) => {
  const ProductsAttachedPackages = sequelize.define(
    "ProductsAttachedPackages",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      parentProdId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "parent_prod_id",
      },
      prodId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "prod_id",
      },
      qty: {
        type: Sequelize.DECIMAL(8, 2),
        allowNull: true,
        defaultValue: 1,
      },
      price: {
        type: Sequelize.DECIMAL(12, 2),
        allowNull: true,
      },
      percent: {
        type: Sequelize.DECIMAL(5, 2),
        allowNull: true,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "attached_packages",
    },
  );

  return ProductsAttachedPackages;
};
