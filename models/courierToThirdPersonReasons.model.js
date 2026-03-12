export default (sequelize, Sequelize) => {
  const CourierToThirdPersonReasons = sequelize.define(
    "CourierToThirdPersonReasons",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
        un
      },
      textAM: {
        type: Sequelize.STRING(200),
        allowNull: false,
        field: "text",
      },
      textEN: {
        type: Sequelize.STRING(200),
        allowNull: false,
        field: "text_en",
      },
      textRU: {
        type: Sequelize.STRING(200),
        allowNull: false,
        field: "text_ru",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "courier_to_third_person_reasons",
    },
  );

  return CourierToThirdPersonReasons;
};
