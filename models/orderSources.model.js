export default (sequelize, Sequelize) => {
  const OrderSources = sequelize.define(
    "OrderSources",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.ENUM("Call", "Website", "App"),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "order_sources",
    },
  );

  return OrderSources;
};
