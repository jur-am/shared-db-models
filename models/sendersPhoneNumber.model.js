export default (sequelize, Sequelize) => {
  const SendersPhoneNumbers = sequelize.define(
    "SendersPhoneNumbers",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        field: "id",
      },
      carNumber: {
        type: Sequelize.INTEGER,
        field: "car_number",
      },
      teamId: {
        type: Sequelize.INTEGER,
        field: "team_id",
      },
      dayPart: {
        type: Sequelize.ENUM("first_half", "second_half", "third_half", "fourth_half"),
        field: "day_part",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "senders_phone_number",
    },
  );

  return SendersPhoneNumbers;
};
