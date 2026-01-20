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
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "t_car",
    },
  );

  return Cars;
};
