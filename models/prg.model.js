export default (sequelize, Sequelize) => {
  const Prg = sequelize.define(
    "Prg",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING(45),
        allowNull: false,
      },
      status: {
        type: Sequelize.ENUM("0", "1"),
        defaultValue: "1",
      },
      amount: {
        type: Sequelize.DECIMAL(10, 2),
        allowNull: false,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "prg",
    },
  );

  return Prg;
};
