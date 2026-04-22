export default (sequelize, Sequelize) => {
  const CollectedProductsParts = sequelize.define(
    "CollectedProductsParts",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      collectedProductId: {
        type: Sequelize.INTEGER,
      },
      name: {
        type: Sequelize.STRING(25),
      },
      packId: {
        type: Sequelize.INTEGER,
      },
      count: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "collected_products_parts",
    },
  );

  return CollectedProductsParts;
};
