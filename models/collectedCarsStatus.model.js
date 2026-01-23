export default (sequelize, Sequelize) => {
  const CollectedCarsStatus = sequelize.define(
    "CollectedCarsStatus",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        defaultValue: null,
        field: "id",
      },
      deliveryDate: {
        type: Sequelize.DATEONLY,
        field: "date",
      },
      dayPart: {
        type: Sequelize.TIME,
        field: "day_part",
      },
      carId: {
        type: Sequelize.INTEGER,
        field: "id_car",
      },
      collectionDate: {
        type: Sequelize.DATE,
        defaultValue: null,
        field: "collection_date",
        get: function () {
          if (this.getDataValue("collectionDate")) {
            const date = new Date(this.getDataValue("collectionDate"));
            const year = date.getFullYear();
            const month = ("0" + (date.getMonth() + 1)).slice(-2);
            const day = ("0" + date.getDate()).slice(-2);
            const hours = ("0" + date.getHours()).slice(-2);
            const minutes = ("0" + date.getMinutes()).slice(-2);
            const seconds = ("0" + date.getSeconds()).slice(-2);
            return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
          }
        },
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "collected_cars_status",
    },
  );

  return CollectedCarsStatus;
};
