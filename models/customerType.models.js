export default (sequelize, Sequelize) => {
  const CustomerType = sequelize.define(
    "CustomerType",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      type: {
        type: Sequelize.STRING(100),
        allowNull: false,
      },
      status: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "customer_type",
    },
  );

  return CustomerType;
};
