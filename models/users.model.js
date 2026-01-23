export default (sequelize, Sequelize) => {
  const Users = sequelize.define(
    "Users",
    {
      id: {
        type: Sequelize.INTEGER.UNSIGNED,
        primaryKey: true,
        autoIncrement: true,
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
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "admin_users",
    },
  );

  return Users;
};
