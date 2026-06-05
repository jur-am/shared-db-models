export default (sequelize, Sequelize) => {
  const PrgPrograms = sequelize.define(
    "PrgPrograms",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING(100),
      },
      description: {
        type: Sequelize.STRING(400),
      },
      status: {
        type: Sequelize.ENUM("active", "inactive"),
        defaultValue: "active",
      },
      startDate: {
        type: Sequelize.DATEONLY,
        field: "start_date",
      },
      endDate: {
        type: Sequelize.DATEONLY,
        field: "end_date",
      },
      createdAt: {
        type: Sequelize.DATE,
        field: "created_at",
      },
      updatedAt: {
        type: Sequelize.DATE,
        field: "updated_at",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "prg_programs",
    },
  );

  return PrgPrograms;
};
