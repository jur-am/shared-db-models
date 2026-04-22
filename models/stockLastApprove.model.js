export default (sequelize, Sequelize) => {
  const Stocklastapprove = sequelize.define(
    "Stocklastapprove",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      lastCheckData: {
        type: Sequelize.STRING(50),
        field: "last_check_date",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "stocklastapprove",
    },
  );

  return Stocklastapprove;
};
