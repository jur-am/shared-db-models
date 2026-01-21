export default (sequelize, Sequelize) => {
  const TeamData = sequelize.define(
    "TeamData",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      teamNumber: {
        type: Sequelize.STRING(3),
        field: "team_number",
      },
      phoneNumber: {
        type: Sequelize.STRING(255),
        field: "phone_number",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "team_data",
    },
  );

  return TeamData;
};
