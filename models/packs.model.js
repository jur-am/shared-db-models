export default (sequelize, Sequelize) => {
  const Packs = sequelize.define(
    "Packs",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: Sequelize.STRING(20),
      },
      type: {
        type: Sequelize.STRING(10),
      },
      prodId: {
        type: Sequelize.INTEGER,
      },
      sort: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "packs",
    },
  );

  return Packs;
};
