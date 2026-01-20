export default (sequelize, Sequelize) => {
  const Customers = sequelize.define(
    "Customers",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        field: "IdCustomers_IF",
      },
      customerType: {
        type: Sequelize.INTEGER,
        field: "ChekPrivat",
      },
      companyName: {
        type: Sequelize.STRING(250),
        field: "NameCompany_I",
      },
      contactName: {
        type: Sequelize.STRING(100),
        field: "ContName1_IF",
      },
      firstActivity: {
        type: Sequelize.DATEONLY,
        field: "first_activity",
      },
      vat: {
        type: Sequelize.TINYINT(1),
      },
      email: {
        type: Sequelize.STRING(90),
        field: "Mail_IF",
      },
      ha: {
        type: Sequelize.STRING(10),
        field: "HA_IF",
      },
      sdAgreement: {
        type: Sequelize.STRING(5),
        field: "sd_agreement",
      },
      iuAgreement: {
        type: Sequelize.STRING(5),
        field: "iu_agreement",
      },
      lAgreement: {
        type: Sequelize.STRING(5),
        field: "l_agreement",
      },
      region: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: "Region_IF",
      },
      user: {
        type: Sequelize.STRING(50),
      },
      address: {
        type: Sequelize.STRING(255),
        field: "Address_IF",
      },
      siteId: {
        type: Sequelize.INTEGER,
        field: "siteid",
      },
      addressId: {
        type: Sequelize.INTEGER,
        unique: true,
        field: "addressid",
      },
      main: {
        type: Sequelize.TINYINT,
      },
      redeemableBonusPoints: {
        type: Sequelize.INTEGER,
      },
      lastUnusedBonusDate: {
        type: Sequelize.DATEONLY,
      },
      cred1: {
        type: Sequelize.INTEGER,
      },
      cred2: {
        type: Sequelize.INTEGER,
      },
      cred3: {
        type: Sequelize.INTEGER,
      },
      cred4: {
        type: Sequelize.INTEGER,
      },
      points: {
        type: Sequelize.DOUBLE,
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
      tableName: "t_customers",
    },
  );

  return Customers;
};
