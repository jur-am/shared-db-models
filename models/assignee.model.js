export default (sequelize, Sequelize) => {
  const Assignee = sequelize.define(
    "Assignee",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      name: {
        type: Sequelize.STRING(100),
      },
      birthday: {
        type: Sequelize.DATE(),
      },
      workStartYear: {
        type: Sequelize.STRING(4),
      },
      email: {
        type: Sequelize.STRING(60),
      },
      imagePath: {
        type: Sequelize.STRING(255),
      },
      status: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      trialPeriod: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      isDeleted: {
        type: Sequelize.INTEGER,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "assignee",
    },
  );

  return Assignee;
};
