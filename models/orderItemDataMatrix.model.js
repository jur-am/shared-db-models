export default (sequelize, Sequelize) => {
  const orderItemDataMatrix = sequelize.define(
    "orderItemDataMatrix",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      orderId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "order_id",
      },
      prodId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "prod_id",
      },
      dataMatrix: {
        type: Sequelize.STRING(200),
        allowNull: false,
        field: "data_matrix",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "order_item_data_matrix",
      indexes: [
        {
          name: "data_matrix_UNIQUE",
          unique: true,
          fields: ["data_matrix"],
        },
        {
          name: "fk_order_item_data_matrix_1_idx",
          fields: ["order_id"],
        },
        {
          name: "fk_order_item_data_matrix_2_idx",
          fields: ["prod_id"],
        },
      ],
    },
  );

  return orderItemDataMatrix;
};
