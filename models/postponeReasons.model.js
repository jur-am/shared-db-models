export default (sequelize, Sequelize) => {
  const PostponeReasones = sequelize.define(
    "PostponeReasones",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: Sequelize.STRING(45),
      },
      description: {
        type: Sequelize.STRING(200),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "postpone_reasons",
    },
  );

  return PostponeReasones;
};
