export default (sequelize, Sequelize) => {
  const PrgThresholds = sequelize.define(
    "PrgThresholds",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      programId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "program_id",
      },
      vehicleType: {
        type: Sequelize.STRING(45),
        field: "vehicle_type",
        allowNull: false,
      },
      thresholdMin: {
        type: Sequelize.INTEGER,
        field: "threshold_min",
        allowNull: false,
      },
      thresholdMax: {
        type: Sequelize.INTEGER,
        field: "threshold_max",
      },
      bonusAmount: {
        type: Sequelize.DECIMAL(10, 2),
        field: "bonus_amount",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "prg_thresholds",
    },
  );

  return PrgThresholds;
};
