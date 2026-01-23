export default (sequelize, Sequelize) => {
  const CreditTypes = sequelize.define(
    "CreditTypes",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowsNull: false,
      },
      creditName: {
        type: Sequelize.INTEGER,
        field: "credit_name",
      },
      productId: {
        type: Sequelize.INTEGER,
        field: "product_id",
      },
      bvPoint: {
        type: Sequelize.INTEGER,
        field: "bv_point",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "credit_types",
    },
  );

  return CreditTypes;
};
