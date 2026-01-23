export default (sequelize, Sequelize) => {
  const CollectedProducts = sequelize.define(
    "CollectedProducts",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      orderId: {
        type: Sequelize.INTEGER,
      },
      carId: {
        type: Sequelize.INTEGER, // Seem that this is redundant
      },
      prodId: {
        type: Sequelize.INTEGER,
      },
      collectedCount: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "collected_products",
    },
  );

  return CollectedProducts;
};
