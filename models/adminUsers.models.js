export default (sequelize, Sequelize) => {
  const AdminUsers = sequelize.define(
    "AdminUsers",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      sendEmail: {
        type: Sequelize.INTEGER,
        field: "send_email",
      },
      email: {
        type: Sequelize.STRING(45),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "admin_users",
    },
  );

  return AdminUsers;
};
