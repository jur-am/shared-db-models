export default (sequelize, Sequelize) => {
  const CourierToThirdPersonReasons = sequelize.define(
    "CourierToThirdPersonReasons",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      text: {
        type: Sequelize.STRING(200),
        allowNull: false,
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
