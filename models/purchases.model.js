export default (sequelize, Sequelize) => {
  const Purchases = sequelize.define(
    "Purchases",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
      },
      product_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false,
      },
      quantity_of_product: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false,
        defaultValue: 0,
      },
      balance: {
        type: Sequelize.INTEGER,
      },
      vat: {
        type: Sequelize.ENUM("1", "0"),
        defaultValue: 1,
      },
      recorder: {
        type: Sequelize.STRING(255),
        defaultValue: "",
      },
      date: {
        type: Sequelize.DATEONLY,
      },
      acquisition_price: {
        type: Sequelize.STRING(255), // Need to change datatype in database
        defaultValue: 0,
      },
      note: {
        type: Sequelize.STRING(255),
        defaultValue: "",
      },
      transItemId: {
        type: Sequelize.INTEGER.UNSIGNED,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "order_for_sale",
    },
  );

  return Purchases;
};
