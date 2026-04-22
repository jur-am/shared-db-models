export default (sequelize, Sequelize) => {
  const Emails = sequelize.define(
    "Emails",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      custId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "customer_id",
      },
      email: {
        type: Sequelize.STRING(60),
      },
      manager: {
        type: Sequelize.STRING(45),
      },
      status: {
        type: Sequelize.ENUM("1", "0"),
        defaultValue: "0",
      },
      sex: {
        type: Sequelize.ENUM("M", "F"),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "emails",
    },
  );

  return Emails;
};
