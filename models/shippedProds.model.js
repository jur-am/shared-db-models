export default (sequelize, Sequelize) => {
  const ShippedProds = sequelize.define(
    "ShippedProds",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        unsigned: true,
        allowNull: false,
        field: "id",
      },
      deliveryDate: {
        type: Sequelize.DATEONLY,
      },
      dayPart: {
        type: Sequelize.TIME,
      },
      carId: {
        type: Sequelize.INTEGER,
      },
      prodId: {
        type: Sequelize.INTEGER,
      },
      actualQtyLoaded: {
        type: Sequelize.INTEGER,
      },
      vehicleLoadBalance: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "shipped_products",
    },
  );

  return ShippedProds;
};
