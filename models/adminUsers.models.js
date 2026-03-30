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
      username: {
        type: Sequelize.STRING(45),
      },
      password: {
        type: Sequelize.STRING(45),
      },
      role: {
        type: Sequelize.INTEGER.UNSIGNED,
      },
      phoneIp: {
        type: Sequelize.STRING(15),
        field: "phone_ip",
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
