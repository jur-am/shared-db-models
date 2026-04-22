export default (sequelize, Sequelize) => {
  const DayPartWorkPeriod = sequelize.define(
    "DayPartWorkPeriod",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      carId: {
        type: Sequelize.INTEGER,
        field: "car_id",
      },
      teamId: {
        type: Sequelize.INTEGER,
        field: "team_id",
      },
      courierId: {
        type: Sequelize.INTEGER,
        field: "courier_id",
      },
      driverId: {
        type: Sequelize.INTEGER,
        field: "driver_courier_id",
      },
      date: {
        type: Sequelize.DATE,
      },
      dayPart: {
        type: Sequelize.STRING(9),
        field: "day_part",
      },
      workStart: {
        type: Sequelize.DATE,
        field: "work_start",
      },
      workEnd: {
        type: Sequelize.DATE,
        field: "work_end",
      },
      ordersCount: {
        type: Sequelize.INTEGER,
        field: "orders_count",
      },
      duration: {
        type: Sequelize.DOUBLE(10, 2),
      },
      averageDuration: {
        type: Sequelize.DOUBLE(10, 2),
        field: "average_duration",
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "day_part_work_period",
    },
  );

  return DayPartWorkPeriod;
};
