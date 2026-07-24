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
      invoiceCode: {
        type: Sequelize.STRING(8),
        field: "InvoiceCode",
      },
      codNalog: {
        type: Sequelize.STRING(15),
        field: "Cod_Nalog_I",
      },
      region: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: "Region_IF",
      },
      region1: {
        type: Sequelize.INTEGER,
        field: "region_1",
      },
      permanentNote: {
        type: Sequelize.STRING(250),
        field: "Permanentnote",
      },
      addressDescription: {
        type: Sequelize.STRING(400),
        field: "AddressDescripIF",
      },
      addressDescriptionDraft: {
        type: Sequelize.STRING(400),
        field: "AddressDescriptionDraft",
      },
      lastActivity: {
        type: Sequelize.DATE,
        field: "last_activity",
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
      activCustomer: {
        type: Sequelize.TINYINT,
        field: "aktiv_customer",
      },
      checkForNotif: {
        type: Sequelize.TINYINT,
        field: "check_for_notif",
      },
      typeUpdatedAt: {
        type: Sequelize.DATE,
        field: "type_updated_at",
      },
      redeemableBonusPoints: {
        type: Sequelize.INTEGER,
      },
      lastUnusedBonusDate: {
        type: Sequelize.DATEONLY,
      },
      state: {
        type: Sequelize.INTEGER,
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
      cred5: {
        type: Sequelize.INTEGER,
      },
      cred6: {
        type: Sequelize.INTEGER,
      },
      points: {
        type: Sequelize.DOUBLE,
      },
      lat: {
        type: Sequelize.STRING(10),
      },
      lng: {
        type: Sequelize.STRING(10),
      },
      imagePath: {
        type: Sequelize.STRING(250),
        field: "image_path",
      },
      phoneNumber: {
        type: Sequelize.STRING(112),
        field: "Phone_IF",
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
