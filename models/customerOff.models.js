export default (sequelize, Sequelize) => {
  const Customeroff = sequelize.define(
    "Customeroff",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      custOff: {
        type: Sequelize.DOUBLE,
        field: "custoff",
      },
      custId: {
        type: Sequelize.INTEGER,
        field: "customerid",
      },
      prodId: {
        type: Sequelize.INTEGER,
        field: "prodid",
      },
      custPerPriceId: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "customeroff",
    },
  );

  return Customeroff;
};
