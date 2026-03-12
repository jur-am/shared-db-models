export default (sequelize, Sequelize) => {
  const DeliveryReplies = sequelize.define(
    "DeliveryReplies",
    {
      id: {
        type: Sequelize.SMALLINT.UNSIGNED,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      textAM: {
        type: Sequelize.STRING(150),
        allowNull: false,
        field: "text_am",
      },
      textEN: {
        type: Sequelize.STRING(150),
        allowNull: false,
        field: "text_en",
      },
      textRU: {
        type: Sequelize.STRING(150),
        allowNull: false,
        field: "text_ru",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "delivery_replies",
    },
  );

  return DeliveryReplies;
};
