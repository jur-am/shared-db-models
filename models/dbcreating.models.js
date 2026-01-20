import dataBase from "./index.js";

const db = dataBase;

db.notifications.belongsTo(db.orders, {
  foreignKey: "orderId",
});

db.customers.belongsTo(db.regions, {
  foreignKey: "region",
  targetKey: "id",
});

db.customers.hasMany(db.orders, {
  foreignKey: "customerId",
});

db.orders.belongsTo(db.customers, {
  foreignKey: "customerId",
});

db.orders.hasMany(db.orderedProducts, {
  foreignKey: "orderId",
});
db.orderedProducts.belongsTo(db.orders, {
  foreignKey: "orderId",
});

db.orders.hasMany(db.cars, {
  sourceKey: "carId", // <-- torder.IdCar
  foreignKey: "carNumber",
});

db.creditReturn.belongsTo(db.orders, { foreignKey: "orderid", targetKey: "id" });
db.orders.hasMany(db.creditReturn, { foreignKey: "orderid", sourceKey: "id" });

db.products.hasMany(db.orderedProducts, {
  foreignKey: "prodId",
});

db.orderedProducts.belongsTo(db.products, {
  foreignKey: "prodId",
});

db.sendersPhoneNumbers.belongsTo(db.cars, {
  sourceKey: "carNumber",
  foreignKey: "carNumber",
});

db.cars.hasMany(db.sendersPhoneNumbers, {
  foreignKey: "carNumber",
});

db.sendersPhoneNumbers.belongsTo(db.teamData, {
  sourceKey: "carNumber",
  foreignKey: "teamId",
  as: "teamData",
});

db.teamData.hasOne(db.teamDevices, { foreignKey: "teamId" });
db.teamDevices.belongsTo(db.teamData, { foreignKey: "teamId" });

db.sendersPhoneNumbers.belongsTo(db.teamDevices, {
  foreignKey: "teamId",
  targetKey: "teamId",
});

db.teamDevices.belongsTo(db.assignees, {
  foreignKey: "courierId",
  as: "courier",
});

db.teamDevices.belongsTo(db.assignees, {
  foreignKey: "driverCourierId",
  as: "driverCourier",
});

db.phones.hasOne(db.customers, { foreignKey: "id" });
db.customers.hasMany(db.phones, { foreignKey: "customerId" });

db.customers.belongsTo(db.customerType, {
  foreignKey: "customerType",
});

db.customerOff.belongsTo(db.customers, {
  foreignKey: "custId",
});

db.postponeOrders.belongsTo(db.postponeReasons, {
  foreignKey: "reasonId",
});

db.postponeOrders.belongsTo(db.orders, { foreignKey: "orderId" });

db.postponeOrders.belongsTo(db.assignees, {
  foreignKey: "courierId",
  as: "courier",
});

db.postponeOrders.belongsTo(db.assignees, {
  foreignKey: "driverCourierId",
  as: "driverCourier",
});

db.orders.hasMany(db.postponeOrders, {
  foreignKey: "orderId",
});

export default db;
