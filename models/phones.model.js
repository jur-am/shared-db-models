export default (sequelize, Sequelize) => {
  const Phones = sequelize.define(
    "Phones",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        unique: true,
      },
      customerId: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      phone: {
        type: Sequelize.STRING(45),
      },
      name: {
        type: Sequelize.STRING(100),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "phones",
    },
  );

  return Phones;
};
