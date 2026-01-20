import customers from "./customers.models.js";
import notifications from "./notifications.models.js";
import orders from "./orders.models.js";
import orderedProducts from "./orderedProducts.model.js";
import cars from "./cars.model.js";
import creditReturn from "./creditReturn.model.js";
import products from "./products.model.js";
import sendersPhoneNumbers from "./sendersPhoneNumber.model.js";
import teamDevices from "./teamDevices.model.js";
import assignees from "./assignee.model.js";
import teamData from "./teamData.model.js";
import phones from "./phones.model.js";
import adminusers from "./adminUsers.models.js";
import customerOff from "./customerOff.models.js";
import customerType from "./customerType.models.js";
import regions from "./regions.model.js";
import deliveryReplies from "./deliveryReplies.model.js";
import postponeOrdersModel from "./postponeOrders.model.js";
import postponeReasonsModel from "./postponeReasons.model.js";

export default (sequelize, Sequelize) => {
  const db = {};

  db.customers = customers(sequelize, Sequelize);
  db.notifications = notifications(sequelize, Sequelize);
  db.orders = orders(sequelize, Sequelize);
  db.orderedProducts = orderedProducts(sequelize, Sequelize);
  db.cars = cars(sequelize, Sequelize);
  db.creditReturn = creditReturn(sequelize, Sequelize);
  db.products = products(sequelize, Sequelize);
  db.sendersPhoneNumbers = sendersPhoneNumbers(sequelize, Sequelize);
  db.teamDevices = teamDevices(sequelize, Sequelize);
  db.assignees = assignees(sequelize, Sequelize);
  db.teamData = teamData(sequelize, Sequelize);
  db.phones = phones(sequelize, Sequelize);
  db.adminusers = adminusers(sequelize, Sequelize);
  db.customerOff = customerOff(sequelize, Sequelize);
  db.customerType = customerType(sequelize, Sequelize);
  db.regions = regions(sequelize, Sequelize);
  db.deliveryReplies = deliveryReplies(sequelize, Sequelize);
  db.postponeOrders = postponeOrdersModel(sequelize, Sequelize);
  db.postponeReasons = postponeReasonsModel(sequelize, Sequelize);

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

  db.creditReturn.belongsTo(db.orders, {
    foreignKey: "orderid",
    targetKey: "id",
  });
  db.orders.hasMany(db.creditReturn, {
    foreignKey: "orderid",
    sourceKey: "id",
  });

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

  db.sequelize = sequelize;
  db.Sequelize = Sequelize;

  return db;
};
