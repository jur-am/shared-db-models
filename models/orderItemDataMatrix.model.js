export default (sequelize, Sequelize) => {
  const orderItemDataMatrix = sequelize.define(
    "orderItemDataMatrix",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      orderItemId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "order_item_id",
      },
      dataMatrix: {
        type: Sequelize.STRING(200),
        allowNull: false,
        unique: true,
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
          fields: ["data_matrix"],
        },
        {
          name: "fk_order_item_data_matrix_1_idx",
          fields: ["order_item_id"],
        },
      ],
    },
  );

  return orderItemDataMatrix;
};
