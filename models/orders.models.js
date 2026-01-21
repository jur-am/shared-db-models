export default (sequelize, Sequelize) => {
  const Orders = sequelize.define(
    "Orders",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        field: "IdOrder",
      },
      customerId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        field: "IdCustomers",
      },
      deliveryDate: {
        type: Sequelize.DATEONLY,
        field: "DateOfSend",
      },
      dateOfOrder: {
        type: Sequelize.DATEONLY,
        field: "DateOfOrder",
      },
      magentoOrderID: {
        type: Sequelize.BIGINT,
      },
      timeOfOrder: {
        type: Sequelize.TIME,
        field: "TimeOfOrder",
      },
      dayPart: {
        type: Sequelize.TIME,
        field: "Time1",
      },
      carId: {
        type: Sequelize.INTEGER,
        field: "IdCar",
      },
      deliveryByBox: {
        type: Sequelize.ENUM("1", "0"),
        defaultValue: 0,
      },
      notes: {
        type: Sequelize.STRING(400),
        field: "Notes",
      },
      notesEtc: {
        type: Sequelize.STRING(2000),
        field: "Notes_etc",
      },
      creator: {
        type: Sequelize.STRING(50),
      },
      state: {
        type: Sequelize.INTEGER,
      },
      vat: {
        type: Sequelize.TINYINT(1),
      },
      isReady: {
        type: Sequelize.ENUM("1", "0"),
        defaultValue: "0",
      },
      deliveryStatus: {
        type: Sequelize.INTEGER,
        field: "deliverystatus",
        defaultValue: 0,
      },
      points: {
        type: Sequelize.INTEGER,
        field: "points",
        defaultValue: 0,
      },
      realised: {
        type: Sequelize.TINYINT,
        field: "Realised",
        defaultValue: null,
      },
      payType: {
        type: Sequelize.STRING(100),
        field: "PayType",
        defaultValue: null,
      },
      notes: {
        type: Sequelize.STRING(1000),
        field: "Notes",
        defaultValue: null,
      },
      authCode: {
        type: Sequelize.STRING(10),
        field: "authcode",
      },
      control: {
        type: Sequelize.TINYINT(1),
      },
      hasDoc: {
        type: Sequelize.ENUM("0", "1"),
        defaultValue: "0",
      },
      idCall: {
        type: Sequelize.STRING(128),
        field: "idcall",
      },
      timeStamp: {
        type: Sequelize.INTEGER,
        field: "starred",
      },
      important: {
        type: Sequelize.INTEGER,
      },
      deliveryQuality: {
        type: Sequelize.STRING(200),
        field: "delivery_quality",
      },
      expDelTime: {
        type: Sequelize.STRING(11),
        field: "ExpDelTime",
      },
      expDelTimeSite: {
        type: Sequelize.STRING(11),
        field: "ExpDelTimeSite",
      },
      expDelTimeChanges: {
        type: Sequelize.INTEGER,
        field: "ExpDelTimeChanges",
      },
      sortOrder: {
        type: Sequelize.SMALLINT,
        field: "sortorder",
      },
      dayPartChanged: {
        type: Sequelize.ENUM("0", "1"),
      },
      dayPartChangeTime: {
        type: Sequelize.DATE,
      },
      invoice: {
        type: Sequelize.TINYINT(1),
      },
      docReturn: {
        type: Sequelize.ENUM("0", "1", "0.5"),
      },
      user: {
        type: Sequelize.ENUM("0", "1", "0.5"),
      },
      returningBottlesReason: {
        type: Sequelize.INTEGER,
      },
      actualDeliveryTime: {
        type: Sequelize.TIME,
        field: "actual_delivery_time",
      },
      rating: {
        type: Sequelize.INTEGER,
        field: "rating",
      },
      collectionDate: {
        type: Sequelize.DATE,
        defaultValue: null,
        get: function () {
          if (this.getDataValue("collectionDate")) {
            return this.getDataValue("collectionDate").toISOString().split("T")[0] + " " + this.getDataValue("collectionDate").toTimeString().split(" ")[0];
          }
        },
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "torder",
    },
  );

  return Orders;
};
