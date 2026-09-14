export default (sequelize, Sequelize) => {
  const Cars = sequelize.define(
    "Cars",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        field: "IdCar",
      },
      carNumber: {
        type: Sequelize.TINYINT,
        field: "NCar",
      },
      productCountLimit: {
        type: Sequelize.FLOAT(7, 2),
        field: "ProductCountLimit",
      },
      mainStock: {
        type: Sequelize.TINYINT,
        defaultValue: "0",
        field: "MainStock",
      },
      carTypeId: {
        type: Sequelize.INTEGER,
        field: "carTypeId",
      },
      plate: {
        type: Sequelize.STRING(200),
        field: "Notes",
      },
      situation: {
        type: Sequelize.ENUM('new', 'old'),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "t_car",
    },
  );

  return Cars;
};
