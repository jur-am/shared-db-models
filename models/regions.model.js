export default (sequelize, Sequelize) => {
  const Regions = sequelize.define(
    "Regions",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        field: "IdRegion",
      },
      name: {
        field: "NameRegion",
        type: Sequelize.STRING(50),
      },
      carNumber: {
        field: "NCar",
        type: Sequelize.STRING(15),
      },
      status: {
        type: Sequelize.TINYINT.UNSIGNED,
      },
      mon: {
        type: Sequelize.TINYINT,
      },
      tue: {
        type: Sequelize.TINYINT,
      },
      wed: {
        type: Sequelize.TINYINT,
      },
      thu: {
        type: Sequelize.TINYINT,
      },
      fri: {
        type: Sequelize.TINYINT,
      },
      sat: {
        type: Sequelize.TINYINT,
      },
      sun: {
        type: Sequelize.TINYINT,
      },
      firstPart: {
        field: "first_part",
        type: Sequelize.TINYINT,
      },
      secondPart: {
        field: "second_part",
        type: Sequelize.TINYINT,
      },
      thirdPart: {
        field: "third_part",
        type: Sequelize.TINYINT,
      },
      forthPart: {
        field: "forth_part",
        type: Sequelize.TINYINT,
      },
      scheduleStart: {
        field: "schedule_start",
        type: Sequelize.DATEONLY,
      },
      deviationOption: {
        field: "deviation_option",
        type: Sequelize.TINYINT,
      },
      interval: {
        type: Sequelize.INTEGER,
        defaultValue: 0,
      },
      intervalType: {
        field: "interval_type",
        type: Sequelize.ENUM("day", "week", "month", "year"),
        defaultValue: "week",
      },
      deviationFirstPart: {
        field: "deviation_first_part",
        type: Sequelize.TINYINT,
      },
      deviationSecondPart: {
        field: "deviation_second_part",
        type: Sequelize.TINYINT,
      },
      deviationThirdPart: {
        field: "deviation_third_part",
        type: Sequelize.TINYINT,
      },
      deviationForthPart: {
        field: "deviation_forth_part",
        type: Sequelize.TINYINT,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "t_region",
    },
  );

  return Regions;
};
