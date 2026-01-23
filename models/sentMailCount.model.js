export default (sequelize, Sequelize) => {
  const SentMailCount = sequelize.define(
    "SentMailCount",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      mail1: {
        type: Sequelize.INTEGER,
      },
      mail2: {
        type: Sequelize.INTEGER,
      },
      date: {
        type: Sequelize.DATE,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "sent_mail_count",
    },
  );

  return SentMailCount;
};
