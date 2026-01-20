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
      firstHalf: {
        type: Sequelize.ENUM("0", "1"),
        field: "first_half",
      },
      secondHalf: {
        type: Sequelize.ENUM("0", "1"),
        field: "second_half",
      },
      thirdHalf: {
        type: Sequelize.ENUM("0", "1"),
        field: "third_half",
      },
      fourthHalf: {
        type: Sequelize.ENUM("0", "1"),
        field: "fourth_half",
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
