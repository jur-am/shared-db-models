export default (sequelize, Sequelize) => {
  const Zones = sequelize.define(
    "Zones",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: Sequelize.STRING(5),
        allowNull: false,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "zone",
    },
  );

  return Zones;
};
