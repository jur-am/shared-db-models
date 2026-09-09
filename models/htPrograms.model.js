export default (sequelize, Sequelize) => {
  const HtPrograms = sequelize.define(
    "HtPrograms",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      carGroupId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        unique: true,
        field: "car_group_id",
      },
      workedDays100: {
        type: Sequelize.INTEGER,
        field: "worked_days_100",
      },
      orderCount: {
        type: Sequelize.INTEGER,
        field: "order_count",
      },
      waterCount: {
        type: Sequelize.INTEGER,
        field: "water_count",
      },
      ht100Count: {
        type: Sequelize.INTEGER,
        field: "ht_100_count",
      },
      workedDaysHt: {
        type: Sequelize.INTEGER,
        field: "worked_days_ht",
      },
      htMonthly: {
        type: Sequelize.DECIMAL(8, 2),
        field: "ht_monthly",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "ht_programs",
    },
  );

  return HtPrograms;
};
