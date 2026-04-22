export default (sequelize, Sequelize) => {
  const Suppliers = sequelize.define(
    "Suppliers",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
      },
      supplier_name: {
        type: Sequelize.STRING(255),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "product_suppliers",
    },
  );

  return Suppliers;
};
