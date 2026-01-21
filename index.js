import customers from "./models/customers.models.js";
import notifications from "./models/notifications.models.js";
import orders from "./models/orders.models.js";
import orderedProducts from "./models/orderedProducts.model.js";
import cars from "./models/cars.model.js";
import creditReturn from "./models/creditReturn.model.js";
import products from "./models/products.model.js";
import sendersPhoneNumbers from "./models/sendersPhoneNumber.model.js";
import teamDevices from "./models/teamDevices.model.js";
import assignees from "./models/assignee.model.js";
import teamData from "./models/teamData.model.js";
import phones from "./models/phones.model.js";
import adminusers from "./models/adminUsers.models.js";
import customerOff from "./models/customerOff.models.js";
import customerType from "./models/customerType.models.js";
import regions from "./models/regions.model.js";
import deliveryReplies from "./models/deliveryReplies.model.js";
import postponeOrdersModel from "./models/postponeOrders.model.js";
import postponeReasonsModel from "./models/postponeReasons.model.js";
import purchases from "./models/purchases.model.js";
import suppliers from "./models/suppliers.model.js";
import zones from "./models/zones.model.js";
import stocks from "./models/stocks.model.js";
import transactions from "./models/transactions.model.js";
import transactionItems from "./models/transactionItems.model.js";
import collectedProducts from "./models/collectedProducts.model.js";
import collectedProductsParts from "./models/collectedProductsParts.model.js";
import packs from "./models/packs.model.js";
import shippedProds from "./models/shippedProds.model.js";
import creditTypes from "./models/creditTypes.model.js";
import deliverySchedule from "./models/deliverySchedule.model.js";
import deliveryScheduleTeams from "./models/deliveryScheduleTeams.model.js";
import deliveryScheduleDayParts from "./models/deliveryScheduleDayParts.model.js";
import carStatus from "./models/carStatus.model.js";
import dayPartWorkPeriod from "./models/dayPartWorkPeriod.model.js";
import deliveryTimeManagement from "./models/deliveryTimeManagement.model.js";
import emails from "./models/emails.models.js";
import sentMailCount from "./models/sentMailCount.model.js";
import stockLastApprove from "./models/stockLastApprove.model.js";

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
  db.purchases = purchases(sequelize, Sequelize);
  db.suppliers = suppliers(sequelize, Sequelize);
  db.zones = zones(sequelize, Sequelize);
  db.stocks = stocks(sequelize, Sequelize);
  db.transactions = transactions(sequelize, Sequelize);
  db.transactionItems = transactionItems(sequelize, Sequelize);
  db.collectedProducts = collectedProducts(sequelize, Sequelize);
  db.collectedProductsParts = collectedProductsParts(sequelize, Sequelize);
  db.packs = packs(sequelize, Sequelize);
  db.shippedProds = shippedProds(sequelize, Sequelize);
  db.creditTypes = creditTypes(sequelize, Sequelize);
  db.deliverySchedule = deliverySchedule(sequelize, Sequelize);
  db.deliveryScheduleTeams = deliveryScheduleTeams(sequelize, Sequelize);
  db.deliveryScheduleDayParts = deliveryScheduleDayParts(sequelize, Sequelize);
  db.carStatus = carStatus(sequelize, Sequelize);
  db.dayPartWorkPeriod = dayPartWorkPeriod(sequelize, Sequelize);
  db.deliveryTimeManagement = deliveryTimeManagement(sequelize, Sequelize);
  db.emails = emails(sequelize, Sequelize);
  db.sentMailCount = sentMailCount(sequelize, Sequelize);
  db.stockLastApprove = stockLastApprove(sequelize, Sequelize);

  db.purchases.belongsTo(db.products);

  // Products
  db.suppliers.hasMany(db.products, {
    foreignKey: "product_suppliers_id",
  });
  db.products.belongsTo(db.suppliers, {
    foreignKey: "product_suppliers_id",
  });

  db.zones.hasMany(db.products, {
    foreignKey: "zone_id",
  });
  db.products.belongsTo(db.zones, {
    foreignKey: "zone_id",
  });

  // Transactions
  db.stocks.hasMany(db.transactions, {
    foreignKey: "source_stock",
  });
  db.transactions.belongsTo(db.stocks, {
    foreignKey: "source_stock",
  });

  db.stocks.hasMany(db.transactions, {
    foreignKey: "dest_stock",
  });
  db.transactions.belongsTo(db.stocks, {
    foreignKey: "dest_stock",
  });

  // TransactionItems
  db.transactions.hasMany(db.transactionItems, {
    as: "items",
    foreignKey: "transact_id",
  });
  db.transactionItems.belongsTo(db.transactions, {
    foreignKey: "transact_id",
  });

  db.products.hasMany(db.transactionItems, {
    foreignKey: "product_id",
  });
  db.transactionItems.belongsTo(db.products, {
    foreignKey: "product_id",
  });

  // Purchases
  db.transactionItems.hasOne(db.purchases, {
    as: "purchases",
    foreignKey: "transItemId",
  });
  db.purchases.belongsTo(db.transactionItems, {
    foreignKey: "transItemId",
  });

  db.products.hasMany(db.purchases, {
    foreignKey: "product_id",
  });
  db.purchases.belongsTo(db.products, {
    foreignKey: "product_id",
  });

  db.orders.hasMany(db.collectedProducts, {
    foreignKey: "orderId",
  });

  db.collectedProducts.belongsTo(db.orders, {
    foreignKey: "orderId",
  });

  // Orders
  db.orders.hasMany(db.orderedProducts, {
    foreignKey: "orderId",
  });
  db.orderedProducts.belongsTo(db.orders, {
    foreignKey: "orderId",
  });

  // db.orders.hasOne(db.customers, {
  //   foreignKey: 'id'
  // });

  db.orders.hasOne(db.cars, {
    foreignKey: "carNumber",
  });

  db.customers.hasMany(db.orders, {
    foreignKey: "customerId",
  });

  db.orders.belongsTo(db.customers, {
    foreignKey: "customerId",
  });

  db.products.hasMany(db.orderedProducts, {
    foreignKey: "prodId",
  });

  db.orderedProducts.belongsTo(db.products, {
    foreignKey: "prodId",
  });

  db.products.hasMany(db.collectedProducts, {
    foreignKey: "prodId",
  });

  db.collectedProducts.belongsTo(db.products, {
    foreignKey: "prodId",
  });

  db.collectedProducts.hasMany(db.collectedProductsParts, {
    foreignKey: "collectedProductId",
  });

  db.collectedProductsParts.belongsTo(db.collectedProducts, {
    foreignKey: "collectedProductId",
  });

  db.packs.hasMany(db.collectedProductsParts, {
    foreignKey: "packId",
  });

  db.collectedProductsParts.belongsTo(db.packs, {
    foreignKey: "packId",
  });

  db.collectedProducts.belongsTo(db.orderedProducts, {
    foreignKey: "orderId",
  });

  db.orderedProducts.hasMany(db.collectedProducts, {
    foreignKey: "orderId",
  });

  db.orders.hasMany(db.creditReturn, {
    foreignKey: "orderId",
  });

  db.customers.belongsTo(db.regions, {
    foreignKey: "region",
  });

  db.customers.hasMany(db.phones, {
    foreignKey: "customerId",
  });

  db.phones.belongsTo(db.customers, {
    foreignKey: "id",
  });

  db.creditReturn.belongsTo(db.orders, {
    foreignKey: "orderId",
  });

  db.postponedOrders.belongsTo(db.postponeReasones, {
    foreignKey: "reasonId",
  });

  db.postponedOrders.belongsTo(db.orders, { foreignKey: "orderId" });

  db.orders.hasMany(db.postponedOrders, {
    foreignKey: "orderId",
  });

  db.teamDevices.belongsTo(db.assignees, {
    foreignKey: "courierId",
    as: "courier",
  });

  db.teamDevices.belongsTo(db.assignees, {
    foreignKey: "driverCourierId",
    as: "driverCourier",
  });
  db.deliveryScheduleTeams.belongsTo(db.assignees, {
    foreignKey: "courierId",
    as: "courier",
  });

  db.deliveryScheduleTeams.belongsTo(db.assignees, {
    foreignKey: "driverCourierId",
    as: "driverCourier",
  });

  db.teamDevices.belongsTo(db.teamData, {
    foreignKey: "teamId",
    targetKey: "id",
    as: "teamData",
  });

  db.creditReturn.belongsTo(db.creditTypes, {
    foreignKey: "creditType",
  });

  db.emails.belongsTo(db.customers, {
    foreignKey: "custId",
  });

  db.customers.hasMany(db.emails, {
    foreignKey: "custId",
  });

  db.deliveryScheduleTeams.belongsTo(db.teamDevices, {
    foreignKey: "teamDeviceId",
  });

  db.deliveryScheduleTeams.belongsTo(db.cars, {
    foreignKey: "carId",
  });

  db.deliveryScheduleTeams.belongsTo(db.deliveryScheduleParts, {
    foreignKey: "dayPartId",
  });
  db.deliveryScheduleTeams.belongsTo(db.deliverySchedule, {
    foreignKey: "deliveryScheduleId",
  });

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
  db.emails.belongsTo(db.customers, {
    foreignKey: "custId",
  });

  db.customers.hasMany(db.emails, {
    foreignKey: "custId",
  });

  db.products.hasMany(db.purchases, {
    foreignKey: "product_id",
  });

  db.suppliers.hasMany(db.products, {
    foreignKey: "product_suppliers_id",
  });
  db.products.belongsTo(db.suppliers, {
    foreignKey: "product_suppliers_id",
  });

  db.zones.hasMany(db.products, {
    foreignKey: "zone_id",
  });
  db.products.belongsTo(db.zones, {
    foreignKey: "zone_id",
  });

  db.stocks.hasMany(db.transactions, {
    foreignKey: "source_stock",
  });
  db.transactions.belongsTo(db.stocks, {
    foreignKey: "source_stock",
  });

  db.stocks.hasMany(db.transactions, {
    foreignKey: "dest_stock",
  });
  db.transactions.belongsTo(db.stocks, {
    foreignKey: "dest_stock",
  });

  // TransactionItems
  db.transactions.hasMany(db.transactionItems, {
    as: "items",
    foreignKey: "transact_id",
  });
  db.transactionItems.belongsTo(db.transactions, {
    foreignKey: "transact_id",
  });

  db.products.hasMany(db.transactionItems, {
    foreignKey: "product_id",
  });
  db.transactionItems.belongsTo(db.products, {
    foreignKey: "product_id",
  });

  // Purchases
  db.transactionItems.hasOne(db.purchases, {
    as: "purchases",
    foreignKey: "transItemId",
  });
  db.purchases.belongsTo(db.transactionItems, {
    foreignKey: "transItemId",
  });

  db.purchases.belongsTo(db.products, {
    foreignKey: "product_id",
  });

  db.orders.hasMany(db.collectedProducts, {
    foreignKey: "orderId",
  });

  db.collectedProducts.belongsTo(db.orders, {
    foreignKey: "orderId",
  });

  // Orders
  db.orders.hasMany(db.orderedProducts, {
    foreignKey: "orderId",
  });
  db.orderedProducts.belongsTo(db.orders, {
    foreignKey: "orderId",
  });

  db.teamDevices.belongsTo(db.teamData, {
    foreignKey: "teamId",
    as: "TeamData", // Specify the key name
  });

  // db.orders.hasOne(db.customers, {
  //   foreignKey: 'id'
  // });

  db.orders.hasOne(db.cars, {
    foreignKey: "carNumber",
    sourceKey: "carId",
  });

  db.cars.hasMany(db.orders, {
    foreignKey: "carId",
    sourceKey: "carNumber",
  });

  db.customers.hasMany(db.orders, {
    foreignKey: "customerId",
  });

  db.orders.belongsTo(db.customers, {
    foreignKey: "customerId",
  });

  db.products.hasMany(db.collectedProducts, {
    foreignKey: "prodId",
  });

  db.collectedProducts.belongsTo(db.products, {
    foreignKey: "prodId",
  });

  db.collectedProducts.hasMany(db.collectedProductsParts, {
    foreignKey: "collectedProductId",
  });

  db.collectedProductsParts.belongsTo(db.collectedProducts, {
    foreignKey: "collectedProductId",
  });

  db.packs.hasMany(db.collectedProductsParts, {
    foreignKey: "packId",
  });

  db.collectedProductsParts.belongsTo(db.packs, {
    foreignKey: "packId",
  });

  db.shippedProds.belongsTo(db.products, {
    targetKey: "id",
    foreignKey: "prodId",
  });

  db.products.hasMany(db.shippedProds, {
    foreignKey: "prodId",
    sourceKey: "id",
  });

  db.creditReturn.belongsTo(db.creditTypes, { foreignKey: "credit_type", targetKey: "id" });
  db.creditTypes.hasMany(db.creditReturn, { foreignKey: "credit_type", sourceKey: "id" });

  db.deliverySchedule.hasMany(db.deliveryScheduleTeams, { sourceKey: "id", targetKey: "deliveryScheduleId" });
  db.deliveryScheduleTeams.belongsTo(db.deliverySchedule, { foreignKey: "deliveryScheduleId", targetKey: "id" });

  db.deliverySchedule.hasMany(db.deliveryScheduleDayParts, { sourceKey: "id", targetKey: "deliveryScheduleId" });
  db.deliveryScheduleDayParts.belongsTo(db.deliverySchedule, { foreignKey: "deliveryScheduleId", targetKey: "id" });

  db.deliveryScheduleDayParts.hasMany(db.deliveryScheduleTeams, { foreignKey: "dayPartId" });
  db.deliveryScheduleTeams.belongsTo(db.deliveryScheduleDayParts, { foreignKey: "dayPartId" });

  db.deliveryScheduleTeams.belongsTo(db.teamDevices, { foreignKey: "teamDeviceId" });
  db.deliveryScheduleTeams.belongsTo(db.cars, { foreignKey: "carId" });
  db.deliveryScheduleTeams.belongsTo(db.carStatus, { foreignKey: "carStatusId" });

  db.teamDevices.hasMany(db.deliveryScheduleTeams, { foreignKey: "teamDeviceId" });

  db.sequelize = sequelize;
  db.Sequelize = Sequelize;

  return db;
};
