-- Structure of the CRM `water` database shared by the CRM, delivery-app-api, proxy-server and wms-nodejs-backend.
-- Contains no data except tbl_migration, which lists the CRM migrations included.
-- Based on the stage CRM database; later CRM migrations are applied by scripts/update-water-schema.sh.
-- Regenerate with that script after CRM migrations are added. Do not edit by hand.


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;
DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `send_email` int(10) DEFAULT NULL,
  `ext` varchar(3) DEFAULT NULL,
  `phone_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_admin_users_1` (`role`),
  KEY `fk_admin_users_status` (`status`),
  CONSTRAINT `FK_admin_users_1` FOREIGN KEY (`role`) REFERENCES `admin_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_users_status` FOREIGN KEY (`status`) REFERENCES `admin_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `asa_last_order_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asa_last_order_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `last_activity_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('returned','notified','unnotified') NOT NULL DEFAULT 'unnotified',
  `notif_type` enum('email','call','notification') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asa_last_order_notice_1_idx` (`cust_id`),
  CONSTRAINT `fk_asa_last_order_notice_1` FOREIGN KEY (`cust_id`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `workStartYear` varchar(4) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `isdeleted` int(11) DEFAULT 1,
  `trialPeriod` int(11) DEFAULT 0,
  `bonusCarType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`isdeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `attached_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attached_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_prod_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` decimal(8,2) DEFAULT 1.00,
  `price` double DEFAULT NULL,
  `percent` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attached_packages_1_idx` (`parent_prod_id`),
  KEY `fk_attached_packages_2_idx` (`prod_id`),
  CONSTRAINT `fk_attached_packages_1` FOREIGN KEY (`parent_prod_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attached_packages_2` FOREIGN KEY (`prod_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bonuslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonuslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `actiondate` date DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `bval` float(15,2) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `bonus` float(15,2) DEFAULT NULL,
  `assistant` int(11) DEFAULT NULL,
  `carid` int(11) DEFAULT NULL,
  `wtime` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex2` (`orderid`),
  KEY `NewIndex3` (`memberid`),
  KEY `NewIndex4` (`roleid`),
  KEY `NewIndex5` (`carid`),
  KEY `NewIndex6` (`assistant`),
  KEY `idx_bonuslist_car_date_time` (`carid`,`actiondate`,`wtime`),
  KEY `idx_bonuslist_date_member_time` (`actiondate`,`memberid`,`wtime`),
  CONSTRAINT `fk_bonuslist_1` FOREIGN KEY (`orderid`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bonuslist_2` FOREIGN KEY (`memberid`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bonuslist_3` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_balance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `carId` int(10) NOT NULL,
  `prodId` int(10) NOT NULL,
  `balance` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car_balance_1_idx` (`carId`),
  KEY `fk_car_balance_2` (`prodId`),
  CONSTRAINT `fk_car_balance_1` FOREIGN KEY (`carId`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_balance_2` FOREIGN KEY (`prodId`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_group_thresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_group_thresholds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prg_id` int(11) NOT NULL,
  `car_group_id` int(11) NOT NULL,
  `status` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_car_group_thresholds_1_idx` (`prg_id`),
  KEY `fk_car_group_thresholds_2_idx` (`car_group_id`),
  CONSTRAINT `fk_car_group_thresholds_1` FOREIGN KEY (`prg_id`) REFERENCES `prg` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_group_thresholds_2` FOREIGN KEY (`car_group_id`) REFERENCES `car_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_day` enum('0','1','2','3','4','5','6') DEFAULT '1',
  `regions_id` varchar(200) DEFAULT NULL,
  `version` tinyint(3) unsigned DEFAULT 0,
  `state` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `car_id` int(11) NOT NULL,
  `order_count_id_1` int(11) DEFAULT NULL,
  `order_count_id_2` int(11) DEFAULT NULL,
  `order_count_id_3` int(11) DEFAULT NULL,
  `order_count_id_4` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car_regions_1_idx` (`car_id`),
  KEY `fk_car_regions_2_idx` (`order_count_id_1`),
  KEY `fk_car_regions_3_idx` (`order_count_id_2`),
  KEY `fk_car_regions_4_idx` (`order_count_id_3`),
  KEY `fk_car_regions_5_idx` (`order_count_id_4`),
  CONSTRAINT `fk_car_regions_1` FOREIGN KEY (`car_id`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_regions_2` FOREIGN KEY (`order_count_id_1`) REFERENCES `order_limit_count` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_regions_3` FOREIGN KEY (`order_count_id_2`) REFERENCES `order_limit_count` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_regions_4` FOREIGN KEY (`order_count_id_3`) REFERENCES `order_limit_count` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_regions_5` FOREIGN KEY (`order_count_id_4`) REFERENCES `order_limit_count` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense` decimal(8,1) NOT NULL,
  `car_id` int(11) NOT NULL,
  `effective_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car_standards_1_idx` (`car_id`),
  CONSTRAINT `fk_car_standards_1` FOREIGN KEY (`car_id`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cars_waters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_waters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `part` time DEFAULT NULL,
  `car` int(11) DEFAULT NULL,
  `byuregh_static` smallint(6) DEFAULT NULL,
  `maqur_jur_19_static` smallint(6) DEFAULT NULL,
  `byuregh` smallint(6) DEFAULT NULL,
  `maqur_jur_19` smallint(6) DEFAULT NULL,
  `maqur_4090_19` smallint(6) DEFAULT NULL,
  `maqur_4090_19_static` smallint(6) DEFAULT NULL,
  `order_count` smallint(6) DEFAULT NULL,
  `road_orders` smallint(6) DEFAULT NULL,
  `actual_loaded` smallint(6) DEFAULT NULL,
  `team_number` varchar(3) DEFAULT NULL,
  `road_delivered_waters` smallint(6) DEFAULT NULL,
  `additional_waters` smallint(6) DEFAULT NULL,
  `delivered_waters` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cars_waters_1_idx` (`car`),
  CONSTRAINT `fk_cars_waters_1` FOREIGN KEY (`car`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `collected_cars_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collected_cars_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_part` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `id_car` int(11) DEFAULT NULL,
  `collection_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collected_cars_status_1` (`id_car`),
  CONSTRAINT `fk_collected_cars_status_1` FOREIGN KEY (`id_car`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `collected_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collected_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `carId` int(11) DEFAULT NULL,
  `prodId` int(11) DEFAULT NULL,
  `collectedCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collected_products_1_idx` (`orderId`),
  KEY `fk_collected_products_2_idx` (`carId`),
  KEY `fk_collected_products_3_idx` (`prodId`),
  CONSTRAINT `fk_collected_products_1` FOREIGN KEY (`orderId`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_collected_products_2` FOREIGN KEY (`carId`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_collected_products_3` FOREIGN KEY (`prodId`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `collected_products_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collected_products_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectedProductId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT 0,
  `packId` int(11) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_new_table_1_idx` (`collectedProductId`),
  KEY `fk_collected_products_parts_2_idx` (`packId`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`collectedProductId`) REFERENCES `collected_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_table_2` FOREIGN KEY (`packId`) REFERENCES `packs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courier_to_third_person_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_to_third_person_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `credit_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `credit_type` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `updatedcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_3` (`orderid`),
  KEY `NewIndex1` (`credit_type`),
  CONSTRAINT `fk_credit_return_1` FOREIGN KEY (`orderid`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_credit_return_2` FOREIGN KEY (`credit_type`) REFERENCES `credit_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `credit_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_name` varchar(100) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `bv_point` float(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`product_id`),
  CONSTRAINT `fk_credit_types_1` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `credit_type` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`cust_id`),
  KEY `NewIndex2` (`credit_type`),
  CONSTRAINT `fk_credits_1` FOREIGN KEY (`cust_id`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_credits_2` FOREIGN KEY (`credit_type`) REFERENCES `credit_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cust_debt_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_debt_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `notice_date` datetime NOT NULL,
  `debt` int(11) NOT NULL,
  `debt_status` enum('0','1') NOT NULL DEFAULT '0',
  `unpaid` float(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cust_debt_history_1_idx` (`cust_id`),
  CONSTRAINT `fk_cust_debt_history_1` FOREIGN KEY (`cust_id`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customer_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customer_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customercredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customercredits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT 0,
  `credittype1` int(11) DEFAULT NULL,
  `credittype2` int(11) DEFAULT NULL,
  `credittype3` int(11) DEFAULT NULL,
  `gendate` varchar(20) DEFAULT NULL,
  `latestprod1` int(11) DEFAULT 0,
  `latestprod2` int(11) DEFAULT 0,
  `latestprod3` int(11) DEFAULT 0,
  `credittype4` int(11) DEFAULT NULL,
  `latestprod4` int(11) DEFAULT 0,
  `credittype5` int(11) DEFAULT NULL,
  `credittype6` int(11) DEFAULT NULL,
  `latestprod5` int(11) DEFAULT 0,
  `latestprod6` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `custid` (`custid`),
  CONSTRAINT `fk_customercredits_1` FOREIGN KEY (`custid`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customeroff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customeroff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `prodid` int(11) DEFAULT NULL,
  `custoff` double DEFAULT NULL,
  `custPerPriceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customeroff_1` (`customerid`),
  KEY `FK_customeroff_2` (`prodid`),
  CONSTRAINT `FK_customeroff_1` FOREIGN KEY (`customerid`) REFERENCES `t_customers` (`IdCustomers_IF`),
  CONSTRAINT `FK_customeroff_2` FOREIGN KEY (`prodid`) REFERENCES `t_product` (`IdProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customers_personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_personal_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `ident_number` varchar(200) DEFAULT NULL,
  `given_date` date DEFAULT NULL,
  `by_whom` varchar(5) DEFAULT NULL,
  `registration_address` varchar(100) DEFAULT NULL,
  `ident_doc_type` enum('1','2') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customers_personal_data_1_idx` (`cust_id`),
  CONSTRAINT `fk_customers_personal_data_1` FOREIGN KEY (`cust_id`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `day_part_work_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_part_work_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `driver_courier_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `day_part` varchar(9) DEFAULT NULL,
  `work_start` datetime DEFAULT NULL,
  `work_end` datetime DEFAULT NULL,
  `orders_count` int(11) DEFAULT NULL,
  `duration` double(10,2) DEFAULT NULL,
  `average_duration` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_day_part_work_period_1_idx` (`courier_id`),
  KEY `fk_day_part_work_period_2_idx` (`driver_courier_id`),
  KEY `fk_day_part_work_period_3_idx` (`car_id`),
  KEY `fk_day_part_work_period_4_idx` (`team_id`),
  CONSTRAINT `fk_day_part_work_period_1` FOREIGN KEY (`courier_id`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_day_part_work_period_2` FOREIGN KEY (`driver_courier_id`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_day_part_work_period_3` FOREIGN KEY (`car_id`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_day_part_work_period_4` FOREIGN KEY (`team_id`) REFERENCES `team_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `delivery_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_replies` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `text_am` varchar(150) NOT NULL,
  `text_en` varchar(150) NOT NULL,
  `text_ru` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `delivery_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_date` date DEFAULT NULL,
  `is_filled` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `delivery_schedule_day_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_schedule_day_parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deliveryScheduleId` int(11) DEFAULT NULL,
  `dayPart` varchar(9) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_schedule_day_parts_1_idx` (`deliveryScheduleId`),
  CONSTRAINT `fk_delivery_schedule_day_parts_1` FOREIGN KEY (`deliveryScheduleId`) REFERENCES `delivery_schedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `delivery_schedule_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_schedule_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryScheduleId` int(11) DEFAULT NULL,
  `dayPartId` int(10) unsigned DEFAULT NULL,
  `teamDeviceId` int(10) unsigned DEFAULT NULL,
  `courierId` int(11) DEFAULT NULL,
  `driverCourierId` int(11) DEFAULT NULL,
  `internId` int(11) DEFAULT NULL,
  `carId` int(11) DEFAULT NULL,
  `attachedStorage` tinyint(1) DEFAULT NULL,
  `carStatus` int(10) unsigned DEFAULT 1,
  `lastUpdate` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `sendToCourierDate` datetime DEFAULT NULL,
  `documentsReadyDate` datetime DEFAULT NULL,
  `teamApproval` tinyint(1) DEFAULT NULL,
  `thirdPersonReasonCreatedAt` datetime DEFAULT NULL,
  `thirdPersonReasonId` int(11) DEFAULT NULL,
  `orderQtyLimit` int(11) DEFAULT NULL,
  `orderLimitNote` varchar(250) DEFAULT NULL,
  `waterQtyLimit` smallint(6) DEFAULT NULL,
  `reasonExplanation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deliveryScheduleIdFk_idx` (`deliveryScheduleId`),
  KEY `teamDeviceIdFk_idx` (`teamDeviceId`),
  KEY `fk_delivery_schedule_teams_1_idx` (`courierId`),
  KEY `fk_delivery_schedule_teams_2_idx` (`driverCourierId`),
  KEY `dayPartIdFk_1_idx` (`dayPartId`),
  KEY `fk_t_car_idx` (`carId`),
  KEY `fk_car_status_idx` (`carStatus`),
  KEY `fk_delivery_schedule_teams_3_idx` (`internId`),
  KEY `fk_delivery_schedule_teams_4_idx` (`thirdPersonReasonId`),
  CONSTRAINT `dayPartIdFk_2` FOREIGN KEY (`dayPartId`) REFERENCES `delivery_schedule_day_parts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deliveryScheduleIdTeamFk` FOREIGN KEY (`deliveryScheduleId`) REFERENCES `delivery_schedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_status` FOREIGN KEY (`carStatus`) REFERENCES `car_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_schedule_teams_1` FOREIGN KEY (`courierId`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_schedule_teams_2` FOREIGN KEY (`driverCourierId`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_schedule_teams_3` FOREIGN KEY (`internId`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_schedule_teams_4` FOREIGN KEY (`thirdPersonReasonId`) REFERENCES `courier_to_third_person_reasons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_car` FOREIGN KEY (`carId`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamDeviceIdFk` FOREIGN KEY (`teamDeviceId`) REFERENCES `team_devices` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deliverytimemanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverytimemanagement` (
  `partOfDay` varchar(10) NOT NULL,
  `timeRange1` varchar(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeRange2` varchar(11) DEFAULT NULL,
  `timeRange3` varchar(11) DEFAULT NULL,
  `timeRange4` varchar(11) DEFAULT NULL,
  `siteTimeRange1` varchar(11) DEFAULT NULL,
  `siteTimeRange2` varchar(11) DEFAULT NULL,
  `siteTimeRange3` varchar(11) DEFAULT NULL,
  `siteTimeRange4` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partOfDay` (`partOfDay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `manager` varchar(45) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0',
  `sex` enum('M','F') DEFAULT NULL,
  `aver_coff_email_status` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_emails_1_idx` (`customer_id`),
  CONSTRAINT `fk_emails_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `fuel_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuel_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(8,1) NOT NULL,
  `effective_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fuel_price_effective_date` (`effective_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ht_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_group_id` int(11) NOT NULL,
  `worked_days_100` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `water_count` int(11) DEFAULT NULL,
  `ht_100_count` int(11) DEFAULT NULL,
  `worked_days_ht` int(11) DEFAULT NULL,
  `ht_monthly` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ht_programs_1_idx` (`car_group_id`),
  CONSTRAINT `fk_ht_programs_1` FOREIGN KEY (`car_group_id`) REFERENCES `car_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `actionTime` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `logtext` longtext DEFAULT NULL,
  `entityType` enum('normal','auto_monthly','auto_weekly') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_log_orderid` (`orderId`),
  KEY `idx_log_actiontime` (`actionTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `merged_inv_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `merged_inv_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `inv_orders` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_merged_inv_orders_1_idx` (`order_id`),
  CONSTRAINT `fk_merged_inv_orders_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `title_ru` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `body` varchar(300) DEFAULT NULL,
  `body_en` varchar(300) DEFAULT NULL,
  `body_ru` varchar(300) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `has_read` enum('0','1') DEFAULT '0',
  `extra_fields` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_coefficient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_coefficient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_group` enum('not_waters','waters') NOT NULL,
  `coefficient` decimal(3,1) unsigned NOT NULL DEFAULT 1.0,
  `effective_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `idx_order_coefficient_prod_group` (`prod_group`),
  KEY `idx_order_coefficient_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `grouped_orders` varchar(300) DEFAULT NULL,
  `order_coefficient_id` int(11) NOT NULL,
  `value` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_expense_1_idx` (`order_id`),
  KEY `fk_order_expense_2_idx` (`order_coefficient_id`),
  CONSTRAINT `fk_order_expense_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_expense_2` FOREIGN KEY (`order_coefficient_id`) REFERENCES `order_coefficient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_for_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_for_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity_of_product` int(11) NOT NULL DEFAULT 0,
  `balance` int(11) DEFAULT NULL,
  `vat` enum('1','0') DEFAULT '1',
  `recorder` varchar(255) DEFAULT '',
  `date` date DEFAULT NULL,
  `acquisition_price` varchar(255) DEFAULT '0',
  `note` varchar(255) DEFAULT '',
  `product_name` varchar(255) DEFAULT NULL,
  `transItemId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `transItemId_fk_idx` (`transItemId`),
  KEY `fk_order_for_sale_1` (`product_id`),
  CONSTRAINT `fk_order_for_sale_1` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transItemId_fk` FOREIGN KEY (`transItemId`) REFERENCES `transaction_items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_item_data_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_data_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `data_matrix` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_matrix_UNIQUE` (`data_matrix`),
  KEY `fk_order_item_data_matrix_1_idx` (`order_id`),
  KEY `fk_order_item_data_matrix_2_idx` (`prod_id`),
  CONSTRAINT `fk_order_item_data_matrix_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_data_matrix_2` FOREIGN KEY (`prod_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_limit_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_limit_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` smallint(6) NOT NULL,
  `col_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_limit_product_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_limit_product_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `order_limit_count_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_limit_product_promo_3_idx` (`order_limit_count_id`),
  KEY `fk_order_limit_product_promo_1_idx` (`prod_id`),
  KEY `fk_order_limit_product_promo_2_idx` (`promo_id`),
  CONSTRAINT `fk_order_limit_product_promo_1` FOREIGN KEY (`prod_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_limit_product_promo_2` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_limit_product_promo_3` FOREIGN KEY (`order_limit_count_id`) REFERENCES `order_limit_count` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_print_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_print_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `error_message` varchar(200) DEFAULT NULL,
  `receipt_id` bigint(20) DEFAULT NULL,
  `sn` varchar(20) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `fiscal` varchar(20) DEFAULT NULL,
  `qr` text DEFAULT NULL,
  `total` double DEFAULT NULL,
  `change` double DEFAULT NULL,
  `emark_count` int(11) DEFAULT NULL,
  `emark_verification_code` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_print_result_1_idx` (`order_id`),
  CONSTRAINT `fk_order_print_result_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` enum('Call','Website','App') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `IdOrder` int(10) DEFAULT NULL,
  `IdCustomers` int(10) DEFAULT NULL,
  `IdProduct` int(5) DEFAULT NULL,
  `Quantiti` int(11) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `Percent` double DEFAULT NULL,
  `promoid` int(10) DEFAULT NULL,
  `state` int(1) DEFAULT 1,
  `points` int(11) DEFAULT 0,
  `bv_point` float(15,2) DEFAULT 0.00,
  `vat` enum('1','0') DEFAULT '1',
  `weighted_average_acquisition_price` float(15,2) DEFAULT NULL,
  `profitability` float(15,2) DEFAULT NULL,
  `soldByBlock` enum('0','1') DEFAULT '0',
  `blockPrice` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ordered_products` (`IdProduct`),
  KEY `NewIndex1` (`IdOrder`,`IdCustomers`),
  KEY `IdCustomers` (`IdCustomers`),
  KEY `NewIndex3` (`state`),
  KEY `fk_ordered_products_3` (`promoid`),
  KEY `idx_ordered_products_id_order` (`IdOrder`),
  CONSTRAINT `FK_ordered_products` FOREIGN KEY (`IdProduct`) REFERENCES `t_product` (`IdProduct`),
  CONSTRAINT `fk_ordered_products_1` FOREIGN KEY (`IdOrder`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_products_2` FOREIGN KEY (`IdCustomers`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_products_3` FOREIGN KEY (`promoid`) REFERENCES `promo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ordered_products_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_products_invoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `IdOrder` int(10) DEFAULT NULL,
  `IdCustomers` int(10) DEFAULT NULL,
  `IdProduct` int(5) DEFAULT NULL,
  `Quantiti` int(11) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `Percent` double DEFAULT NULL,
  `DateOfOrder` datetime DEFAULT NULL,
  `TimeOfOrder` time DEFAULT NULL,
  `DateOfSend` datetime DEFAULT NULL,
  `IdCar` int(10) DEFAULT NULL,
  `Time1` datetime DEFAULT NULL,
  `Realised` tinyint(1) DEFAULT NULL,
  `PayType` varchar(100) DEFAULT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `control` tinyint(1) DEFAULT NULL,
  `Car_return_bottul` int(10) DEFAULT NULL,
  `state` int(1) DEFAULT 1,
  `creator` varchar(50) DEFAULT NULL,
  `haNew` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ordered_products` (`IdProduct`),
  KEY `NewIndex1` (`IdOrder`,`IdCustomers`),
  KEY `fk_ordered_products_invoice_IdCustomer` (`IdCustomers`),
  CONSTRAINT `fk_ordered_products_invoice_IdCustomer` FOREIGN KEY (`IdCustomers`) REFERENCES `t_customers` (`IdCustomers_IF`),
  CONSTRAINT `fk_ordered_products_invoice_IdOrder` FOREIGN KEY (`IdOrder`) REFERENCES `torder` (`IdOrder`),
  CONSTRAINT `fk_ordered_products_invoice_IdProduct` FOREIGN KEY (`IdProduct`) REFERENCES `t_product` (`IdProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `packs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `prodId` int(11) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_new_table_1_idx` (`prodId`),
  CONSTRAINT `fk_packs_1` FOREIGN KEY (`prodId`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phones_1_idx` (`customerId`),
  CONSTRAINT `fk_phones_1` FOREIGN KEY (`customerId`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `podon_calc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `podon_calc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `day_part` time DEFAULT NULL,
  `additional_podon` int(11) DEFAULT NULL,
  `id_car` int(11) DEFAULT NULL,
  `permissible_amount` int(11) DEFAULT NULL,
  `byuregh19` int(11) DEFAULT NULL,
  `makurJur19` int(11) DEFAULT NULL,
  `collection_date` datetime DEFAULT NULL,
  `makurJur4090_19` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `pog_value` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_podon_calc_1` (`id_car`),
  CONSTRAINT `fk_podon_calc_1` FOREIGN KEY (`id_car`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `postpone_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `postpone_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `postponed_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `postponed_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateOfSend` date DEFAULT NULL,
  `dayPart` time DEFAULT NULL,
  `teamNumber` int(11) DEFAULT NULL,
  `courierId` int(11) DEFAULT NULL,
  `driverCourierId` int(11) DEFAULT NULL,
  `reasonId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `carId` int(11) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_postponed_orders_2_idx` (`courierId`),
  KEY `fk_postponed_orders_3_idx` (`driverCourierId`),
  KEY `fk_postponed_orders_1_idx` (`orderId`),
  KEY `fk_postponed_orders_4_idx` (`carId`),
  KEY `fk_postponed_orders_5_idx` (`reasonId`),
  CONSTRAINT `fk_postponed_orders_1` FOREIGN KEY (`orderId`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_postponed_orders_2` FOREIGN KEY (`courierId`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_postponed_orders_3` FOREIGN KEY (`driverCourierId`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_postponed_orders_4` FOREIGN KEY (`carId`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_postponed_orders_5` FOREIGN KEY (`reasonId`) REFERENCES `postpone_reasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `prg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('0','1') DEFAULT '1',
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `prg_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prg_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `prg_thresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prg_thresholds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `vehicle_type` varchar(45) NOT NULL,
  `threshold_min` int(11) NOT NULL,
  `threshold_max` int(11) DEFAULT NULL,
  `bonus_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prg_thresholds_1_idx` (`program_id`),
  CONSTRAINT `fk_prg_thresholds_1` FOREIGN KEY (`program_id`) REFERENCES `prg_programs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_balance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_balance_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `acquisition_price` float(15,2) DEFAULT NULL,
  `order_for_sale_id` int(11) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id_idx` (`product_id`),
  KEY `date_idx` (`date`),
  KEY `order_id_idx` (`order_id`),
  KEY `fk_product_balance_info_1` (`order_for_sale_id`),
  CONSTRAINT `fk_product_balance_info_1` FOREIGN KEY (`order_for_sale_id`) REFERENCES `order_for_sale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_balance_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `torder` (`IdOrder`),
  CONSTRAINT `fk_product_balance_info_product_id` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_cost_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cost_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_cost_price_1_idx` (`prod_id`),
  CONSTRAINT `fk_product_cost_price_1` FOREIGN KEY (`prod_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(45) DEFAULT NULL,
  `credit_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_Id` (`credit_Id`),
  CONSTRAINT `fk_product_types_1` FOREIGN KEY (`credit_Id`) REFERENCES `credit_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `promo_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `promoid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `percent` float(15,2) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_promo_products_productid` (`productid`),
  KEY `fk_promo_products_promoid` (`promoid`),
  CONSTRAINT `fk_promo_products_productid` FOREIGN KEY (`productid`) REFERENCES `t_product` (`IdProduct`),
  CONSTRAINT `fk_promo_products_promoid` FOREIGN KEY (`promoid`) REFERENCES `promo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `real_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `real_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `returned_bottles_prg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `returned_bottles_prg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_group_id` int(11) NOT NULL,
  `bottle_limit_max` decimal(8,2) DEFAULT NULL,
  `worked_days_min` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_returned_bottles_prg_1_idx` (`car_group_id`),
  CONSTRAINT `fk_returned_bottles_prg_1` FOREIGN KEY (`car_group_id`) REFERENCES `car_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `bonus` float(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sent_mail_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sent_mail_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail1` int(4) DEFAULT NULL,
  `mail2` int(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `serial_number_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `serial_number_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `failure` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_serial_number_response_1_idx` (`order_id`),
  CONSTRAINT `fk_serial_number_response_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `shipped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipped_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deliveryDate` date DEFAULT NULL,
  `dayPart` time DEFAULT NULL,
  `carId` int(10) NOT NULL,
  `prodId` int(10) NOT NULL,
  `actualQtyLoaded` int(10) NOT NULL,
  `vehicleLoadBalance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shipped_products_1_idx` (`prodId`),
  KEY `fk_shipped_products_2` (`carId`),
  CONSTRAINT `fk_shipped_products_1` FOREIGN KEY (`prodId`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipped_products_2` FOREIGN KEY (`carId`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `shipping_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_date` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `dayPart` time NOT NULL,
  `regionIds` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT 1,
  `carIds` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sorder` (
  `IdOrder` int(10) NOT NULL AUTO_INCREMENT,
  `IdCustomers` int(11) NOT NULL,
  `DateOfOrder` date DEFAULT NULL,
  `TimeOfOrder` time DEFAULT NULL,
  `DateOfSend` date DEFAULT NULL,
  `Realised` tinyint(1) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `PayType` varchar(100) DEFAULT NULL,
  `control` tinyint(1) DEFAULT NULL,
  `IdCar` int(10) DEFAULT NULL,
  `Time1` time DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `period_end` date DEFAULT NULL,
  `period` int(10) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `weekday` int(11) DEFAULT NULL,
  `last_order_date` date DEFAULT NULL,
  `notesForAccounting` varchar(2000) DEFAULT NULL,
  `Notes_etc` varchar(2000) DEFAULT NULL,
  `is_monthly_period` tinyint(4) DEFAULT 0,
  `next_order_date` date DEFAULT NULL,
  `billing_type` enum('postpaid','prepaid') DEFAULT NULL,
  PRIMARY KEY (`IdOrder`),
  KEY `Index_3` (`IdCustomers`),
  KEY `fk_sorder_cars` (`IdCar`),
  CONSTRAINT `fk_sorder_IdCustomers` FOREIGN KEY (`IdCustomers`) REFERENCES `t_customers` (`IdCustomers_IF`),
  CONSTRAINT `fk_sorder_cars` FOREIGN KEY (`IdCar`) REFERENCES `t_car` (`IdCar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sordered_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdOrder` int(10) DEFAULT NULL,
  `IdCustomers` int(10) DEFAULT NULL,
  `IdProduct` int(11) DEFAULT NULL,
  `Quantiti` int(11) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `Percent` double DEFAULT NULL,
  `DateOfOrder` datetime DEFAULT NULL,
  `TimeOfOrder` datetime DEFAULT NULL,
  `DateOfSend` datetime DEFAULT NULL,
  `Realised` tinyint(1) DEFAULT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `PayType` varchar(100) DEFAULT NULL,
  `control` tinyint(1) DEFAULT NULL,
  `IdCar` int(10) DEFAULT NULL,
  `Time1` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`IdOrder`),
  KEY `Index_3` (`IdCustomers`),
  KEY `FK_ordered_products_1` (`IdProduct`),
  KEY `fk_sordered_products_3` (`IdCar`),
  CONSTRAINT `fk_sordered_products_1` FOREIGN KEY (`IdProduct`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sordered_products_2` FOREIGN KEY (`IdCustomers`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sordered_products_3` FOREIGN KEY (`IdCar`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sordered_products_4` FOREIGN KEY (`IdOrder`) REFERENCES `sorder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `min_prod_count` int(10) unsigned DEFAULT NULL,
  `min_order_count` int(10) unsigned DEFAULT NULL,
  `need_to_order` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stock_items` (`stock_id`,`product_id`),
  KEY `fk_stock_items_2` (`product_id`),
  CONSTRAINT `fk_stock_items_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_items_2` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stockcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockcheck` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `checkdate` date DEFAULT NULL,
  `stock_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stockcheck_1` (`product_id`),
  KEY `fk_stockcheck_2` (`stock_id`),
  CONSTRAINT `fk_stockcheck_1` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stockcheck_2` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stocklastapprove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocklastapprove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_check_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `owner` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_approve` datetime DEFAULT NULL,
  `carid` int(11) DEFAULT NULL,
  `list_order` int(10) DEFAULT NULL,
  `MainStock` tinyint(1) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_stock_active` (`active`),
  KEY `fk_stocks_1` (`carid`),
  CONSTRAINT `fk_stocks_1` FOREIGN KEY (`carid`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `t_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_car` (
  `IdCar` int(10) NOT NULL AUTO_INCREMENT,
  `NCar` tinyint(4) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  `active` varchar(80) DEFAULT NULL,
  `driver` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrderCountLimit` int(10) DEFAULT NULL,
  `ProductCountLimit` float(7,2) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `uuid` varchar(200) DEFAULT NULL,
  `MainStock` tinyint(1) DEFAULT 0,
  `JoinedStock` varchar(12) DEFAULT NULL,
  `autoTransaction` tinyint(1) DEFAULT 1,
  `pe16` smallint(6) DEFAULT NULL,
  `pe8` smallint(6) DEFAULT NULL,
  `pe32` smallint(6) DEFAULT NULL,
  `pe24` smallint(6) DEFAULT NULL,
  `carTypeId` int(11) DEFAULT NULL,
  `situation` enum('new','old') DEFAULT NULL,
  PRIMARY KEY (`IdCar`),
  KEY `NewIndex1` (`NCar`),
  KEY `NewIndex2` (`active`),
  KEY `fk_t_car_1_idx` (`carTypeId`),
  CONSTRAINT `fk_t_car_1` FOREIGN KEY (`carTypeId`) REFERENCES `car_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `t_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customers` (
  `IdCustomers_IF` int(10) NOT NULL AUTO_INCREMENT,
  `ChekPrivat` int(10) DEFAULT NULL,
  `NameCompany_I` varchar(250) DEFAULT NULL,
  `ContName1_IF` varchar(100) DEFAULT NULL,
  `ContName2_IF` varchar(50) DEFAULT NULL,
  `Pashton` varchar(100) DEFAULT NULL,
  `Priorety_IF` int(10) unsigned DEFAULT 5,
  `Region_IF` int(11) DEFAULT NULL,
  `region_1` int(11) DEFAULT NULL,
  `Address_IF` varchar(255) DEFAULT NULL,
  `AddressDescripIF` varchar(400) DEFAULT NULL,
  `AddressDescriptionDraft` varchar(400) DEFAULT NULL,
  `Adress_home_N` varchar(50) DEFAULT NULL,
  `Fax_IF` varchar(15) DEFAULT NULL,
  `vat` tinyint(1) DEFAULT NULL,
  `Mail_IF` varchar(90) DEFAULT NULL,
  `Members_IF` int(10) DEFAULT NULL,
  `HA_IF` varchar(10) DEFAULT NULL,
  `Cod_Nalog_I` varchar(15) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `N_schet_I` varchar(50) DEFAULT NULL,
  `Sex_F` varchar(6) DEFAULT NULL,
  `Id_Age_Group_F` int(10) DEFAULT NULL,
  `Notes` varchar(250) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `aktiv_customer` tinyint(1) DEFAULT NULL,
  `Old_Name` varchar(50) DEFAULT NULL,
  `last_activity` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `InvoiceCode` varchar(8) DEFAULT NULL,
  `Permanentnote` varchar(250) DEFAULT NULL,
  `permanent_note_for_accounting` varchar(250) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  `site_status` varchar(3) DEFAULT '-',
  `lat` varchar(10) DEFAULT '40.177644',
  `lng` varchar(10) DEFAULT '44.512443',
  `isadjusted` int(1) DEFAULT 0,
  `rate` float(10,2) DEFAULT NULL,
  `rate_updated` datetime DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `cred1` int(10) DEFAULT 0,
  `cred2` int(10) DEFAULT 0,
  `cred3` int(10) DEFAULT 0,
  `points` double DEFAULT 0,
  `amount_creator` varchar(50) DEFAULT 'auto',
  `amountVerifyDate` datetime DEFAULT NULL,
  `amountVerifySum` varchar(8) DEFAULT NULL,
  `amountVerifySum2` varchar(8) DEFAULT NULL,
  `DefaultPayType` varchar(15) DEFAULT NULL,
  `difficulty` tinyint(1) DEFAULT 0,
  `mj` varchar(1) DEFAULT NULL,
  `cred4` int(10) DEFAULT 0,
  `building_type` tinyint(1) unsigned DEFAULT NULL,
  `allowed_limit_bottle` decimal(6,1) DEFAULT 1.5,
  `dispenser_count` int(10) unsigned DEFAULT 0,
  `dispenser_count_rent` int(11) DEFAULT NULL,
  `sd_agreement` varchar(5) DEFAULT NULL,
  `iu_agreement` varchar(5) DEFAULT NULL,
  `l_agreement` varchar(5) DEFAULT NULL,
  `first_activity` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `folder_path` varchar(100) DEFAULT NULL,
  `difficultyDraft` tinyint(1) DEFAULT 0,
  `lastUnusedBonusDate` date DEFAULT NULL,
  `average_cofficient` float DEFAULT NULL,
  `cofficient_date` date DEFAULT NULL,
  `redeemableBonusPoints` int(11) DEFAULT NULL,
  `points_to_reduce` decimal(8,2) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  `main` tinyint(4) DEFAULT 0,
  `last_activity_with_water` date DEFAULT NULL,
  `last_activity_with_bonus_2` date DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `check_for_notif` tinyint(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `debt_email_status` enum('0','1') DEFAULT '0',
  `floor` tinyint(4) DEFAULT NULL,
  `entrance` varchar(100) DEFAULT NULL,
  `section_addition` varchar(100) DEFAULT NULL,
  `amountVerifySum3` varchar(8) DEFAULT NULL,
  `cred5` int(11) DEFAULT 0,
  `cred6` int(11) DEFAULT 0,
  PRIMARY KEY (`IdCustomers_IF`),
  UNIQUE KEY `addressid_UNIQUE` (`addressid`),
  KEY `Index_2` (`Priorety_IF`),
  KEY `Index_3` (`Region_IF`),
  KEY `NewIndex1` (`state`),
  KEY `NewIndex2` (`siteid`),
  KEY `NewIndex4` (`ContName1_IF`),
  KEY `NewIndex5` (`ContName2_IF`),
  KEY `NewIndex6` (`ChekPrivat`),
  KEY `NewIndex7` (`Address_IF`),
  KEY `NewIndex9` (`aktiv_customer`),
  KEY `InvoiceCode_idx` (`InvoiceCode`),
  KEY `NameCompany_I_idx` (`NameCompany_I`),
  KEY `fk_t_customers_1_idx` (`brand_id`),
  KEY `fk_t_customers_4` (`region_1`),
  KEY `fk_t_customers_5` (`id_order`),
  CONSTRAINT `FK_t_customers` FOREIGN KEY (`Priorety_IF`) REFERENCES `customer_grades` (`id`),
  CONSTRAINT `fk_t_customers_1` FOREIGN KEY (`brand_id`) REFERENCES `customer_brand` (`id`),
  CONSTRAINT `fk_t_customers_2` FOREIGN KEY (`ChekPrivat`) REFERENCES `customer_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_customers_3` FOREIGN KEY (`Region_IF`) REFERENCES `t_region` (`IdRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_customers_4` FOREIGN KEY (`region_1`) REFERENCES `t_region` (`IdRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_customers_5` FOREIGN KEY (`id_order`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `t_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product` (
  `IdProduct` int(10) NOT NULL AUTO_INCREMENT,
  `NameProduct` varchar(50) DEFAULT NULL,
  `TypeProduct` varchar(50) DEFAULT NULL,
  `CostofUnit` double(15,2) DEFAULT NULL,
  `DescripProduct` varchar(150) DEFAULT NULL,
  `NotUse` tinyint(1) DEFAULT NULL,
  `InvoiceCode` varchar(8) DEFAULT NULL,
  `Pahest_code` varchar(8) DEFAULT NULL,
  `Expense_account` varchar(8) DEFAULT NULL,
  `Revenue_account` varchar(8) DEFAULT NULL,
  `child_prod_id` int(10) DEFAULT NULL,
  `stock_id` int(10) DEFAULT NULL,
  `bv_point` float(15,2) DEFAULT NULL,
  `bonus_type` int(10) DEFAULT 1,
  `points` int(11) DEFAULT 0,
  `special_price` double(10,2) DEFAULT NULL,
  `weight` float(7,2) DEFAULT 0.00,
  `capacity` float(7,2) DEFAULT 0.00,
  `lead_time` smallint(5) unsigned DEFAULT NULL,
  `buffer` decimal(6,2) unsigned DEFAULT NULL,
  `avg_balance_calc` smallint(5) unsigned DEFAULT NULL,
  `min_balance_cfct` decimal(6,2) unsigned DEFAULT NULL,
  `stock_id_1` int(11) DEFAULT NULL,
  `block_quantity` int(3) DEFAULT NULL,
  `product_suppliers_id` int(11) DEFAULT NULL,
  `legal_price` double(10,2) DEFAULT 0.00,
  `zone_id` int(11) DEFAULT NULL,
  `deliveryByBox` enum('0','1') DEFAULT '1',
  `barcode` varchar(16) DEFAULT NULL,
  `minSalesCount` int(11) DEFAULT NULL,
  `minSalesCountBarcode` varchar(16) DEFAULT NULL,
  `blockBarcode` varchar(16) DEFAULT NULL,
  `outOfStock` enum('0','1') DEFAULT '0',
  `disabled` enum('0','1') DEFAULT '0',
  `blockPrice` double(15,2) DEFAULT NULL,
  `isBlockPriceActive` enum('0','1') DEFAULT '0',
  `stock_id_2` int(11) DEFAULT NULL,
  `lead_time_branch1` smallint(5) unsigned DEFAULT NULL,
  `lead_time_branch2` smallint(5) unsigned DEFAULT NULL,
  `buffer_branch1` decimal(6,2) unsigned DEFAULT NULL,
  `buffer_branch2` decimal(6,2) unsigned DEFAULT NULL,
  `min_balance_cfct_branch1` decimal(6,2) unsigned DEFAULT NULL,
  `min_balance_cfct_branch2` decimal(6,2) unsigned DEFAULT NULL,
  `avg_balance_calc_branch1` smallint(5) unsigned DEFAULT NULL,
  `avg_balance_calc_branch2` smallint(5) unsigned DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `term` enum('0','1') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `new_start_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `for_acquisition_cost` enum('0','1') DEFAULT NULL,
  `acquisition_date` date DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `atgcode` varchar(10) DEFAULT NULL,
  `qr_data_matrix` enum('1','0') DEFAULT '0',
  `GTIN` varchar(100) DEFAULT NULL,
  `GTIN_min` varchar(14) DEFAULT NULL,
  `GTIN_block` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdProduct`),
  KEY `NewIndex1` (`NotUse`),
  KEY `NewIndex2` (`child_prod_id`),
  KEY `NewIndex3` (`stock_id`),
  KEY `NewIndex4` (`bonus_type`),
  KEY `zoneId` (`zone_id`),
  KEY `NameProduct_idx` (`NameProduct`),
  KEY `fk_t_product_1` (`brand_id`),
  KEY `fk_t_product_4` (`stock_id_1`),
  KEY `fk_t_product_5` (`stock_id_2`),
  KEY `fk_t_product_product_suppliers_id` (`product_suppliers_id`),
  KEY `index12` (`for_acquisition_cost`),
  CONSTRAINT `fk_t_product_1` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_product_2` FOREIGN KEY (`child_prod_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_product_3` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_product_4` FOREIGN KEY (`stock_id_1`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_product_5` FOREIGN KEY (`stock_id_2`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_product_product_suppliers_id` FOREIGN KEY (`product_suppliers_id`) REFERENCES `product_suppliers` (`id`),
  CONSTRAINT `zone_id` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `t_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_region` (
  `IdRegion` int(10) NOT NULL AUTO_INCREMENT,
  `NameRegion` varchar(50) NOT NULL,
  `NCar` int(11) DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `mon` tinyint(1) DEFAULT NULL,
  `tue` tinyint(1) DEFAULT NULL,
  `wed` tinyint(1) DEFAULT NULL,
  `thu` tinyint(1) DEFAULT NULL,
  `fri` tinyint(1) DEFAULT NULL,
  `sat` tinyint(1) DEFAULT NULL,
  `sun` tinyint(1) DEFAULT NULL,
  `first_part` tinyint(1) DEFAULT NULL,
  `second_part` tinyint(1) DEFAULT NULL,
  `third_part` tinyint(1) DEFAULT NULL,
  `forth_part` tinyint(1) DEFAULT NULL,
  `schedule_start` date DEFAULT NULL,
  `deviation_option` tinyint(1) DEFAULT NULL,
  `interval` int(11) DEFAULT 0,
  `interval_type` enum('day','week','month','year') DEFAULT 'week',
  `deviation_first_part` tinyint(1) DEFAULT NULL,
  `deviation_second_part` tinyint(1) DEFAULT NULL,
  `deviation_third_part` tinyint(1) DEFAULT NULL,
  `deviation_forth_part` tinyint(1) DEFAULT NULL,
  `community_1` int(11) DEFAULT NULL,
  `community_2` int(11) DEFAULT NULL,
  `trip_distance` decimal(8,2) DEFAULT NULL,
  `trip_fuel_liters` decimal(8,2) DEFAULT NULL,
  `trip_effective_date` date DEFAULT NULL,
  `trip_created_at` datetime DEFAULT NULL,
  `trip_updated_at` datetime DEFAULT NULL,
  `transport_zone_id` int(11) DEFAULT NULL,
  `real_region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdRegion`),
  KEY `NewIndex1` (`NCar`),
  KEY `NewIndex2` (`status`),
  KEY `fk_t_region_1_idx` (`community_1`),
  KEY `fk_t_region_2_idx` (`community_2`),
  KEY `fk_t_region_3_idx` (`real_region_id`),
  KEY `fk_t_region_4_idx` (`transport_zone_id`),
  CONSTRAINT `fk_t_region_1` FOREIGN KEY (`community_1`) REFERENCES `t_region` (`IdRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_region_2` FOREIGN KEY (`community_2`) REFERENCES `t_region` (`IdRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_region_3` FOREIGN KEY (`NCar`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_region_real_region` FOREIGN KEY (`real_region_id`) REFERENCES `real_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_region_transport_zone` FOREIGN KEY (`transport_zone_id`) REFERENCES `transport_zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) DEFAULT NULL,
  `type_id` enum('Ծանուցում','Task','Հարցում','Մնացորդ') DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `task_date` datetime DEFAULT current_timestamp(),
  `closed_by` varchar(30) DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`cust_id`),
  KEY `NewIndex2` (`type_id`),
  KEY `NewIndex3` (`user_id`),
  KEY `NewIndex4` (`status`),
  CONSTRAINT `fk_tasks_1` FOREIGN KEY (`cust_id`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tbl_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `team_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_number` varchar(3) DEFAULT '',
  `phone_number` varchar(255) DEFAULT NULL,
  `first_half` enum('0','1') DEFAULT '0',
  `second_half` enum('0','1') DEFAULT '0',
  `third_half` enum('0','1') DEFAULT '0',
  `fourth_half` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`,`team_number`),
  UNIQUE KEY `team_number_2` (`team_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `team_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `driver_courier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `team_devices_team_id_unique` (`device_key`),
  KEY `team_devices_team_id_foreign` (`team_id`) USING BTREE,
  KEY `_idx` (`courier_id`),
  KEY `team_devices_courier_id_foreign_idx` (`driver_courier_id`),
  CONSTRAINT `team_devices_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `team_devices_driver_courier_id_foreign` FOREIGN KEY (`driver_courier_id`) REFERENCES `assignee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `team_devices_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `team_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `teamid_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamid_parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `part` varchar(20) NOT NULL,
  `team_id` int(11) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teamid_parts_1_idx` (`team_id`),
  KEY `fk_teamid_parts_2_idx` (`car_id`),
  CONSTRAINT `fk_teamid_parts_1` FOREIGN KEY (`team_id`) REFERENCES `team_data` (`id`),
  CONSTRAINT `fk_teamid_parts_2` FOREIGN KEY (`car_id`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `torder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `torder` (
  `IdOrder` int(10) NOT NULL AUTO_INCREMENT,
  `IdCustomers` int(11) DEFAULT NULL,
  `DateOfOrder` date DEFAULT NULL,
  `TimeOfOrder` time DEFAULT NULL,
  `DateOfSend` date DEFAULT NULL,
  `IdCar` int(10) DEFAULT NULL,
  `Time1` time DEFAULT NULL,
  `Realised` tinyint(1) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `PayType` varchar(100) DEFAULT NULL,
  `control` tinyint(1) DEFAULT NULL,
  `SorderId` int(10) DEFAULT NULL,
  `state` int(1) DEFAULT 1,
  `creator` varchar(50) DEFAULT NULL,
  `stockcontrol` int(10) DEFAULT 0,
  `bval` float(15,2) DEFAULT NULL,
  `deliverystatus` int(11) DEFAULT 0,
  `starred` int(11) DEFAULT 0,
  `points` int(11) DEFAULT 0,
  `actual_delivery_time` time DEFAULT NULL,
  `invoice` tinyint(1) NOT NULL DEFAULT 0,
  `Notes_etc` varchar(2000) DEFAULT NULL,
  `ExpDelTime` varchar(11) DEFAULT NULL,
  `ExpDelTimeSite` varchar(11) NOT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `important` tinyint(1) DEFAULT NULL,
  `idcall` varchar(128) DEFAULT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `delivery_quality` varchar(200) DEFAULT NULL,
  `vat` tinyint(1) DEFAULT 1,
  `ExpDelTimeChanges` int(11) NOT NULL DEFAULT 0,
  `authcode` varchar(36) DEFAULT NULL,
  `magentoOrderID` bigint(15) DEFAULT NULL,
  `deliveryByBox` enum('0','1') DEFAULT '0',
  `dayPartChanged` enum('0','1','2') DEFAULT '0',
  `dayPartChangeTime` datetime DEFAULT NULL,
  `showBoxMsg` enum('0','1') DEFAULT '0',
  `fiscalNumber` int(10) DEFAULT NULL,
  `delDevComment` varchar(255) DEFAULT NULL,
  `delDevUser` varchar(45) DEFAULT NULL,
  `returningBottlesReason` int(11) DEFAULT NULL,
  `isReady` enum('0','1') DEFAULT '0',
  `hasDoc` enum('0','1') DEFAULT '0',
  `docReturn` enum('0','1','0.5') DEFAULT '0',
  `collectionDate` datetime DEFAULT NULL,
  `notesForAccounting` varchar(2000) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `serial_number` varchar(45) DEFAULT NULL,
  `check_serial_nu` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`IdOrder`),
  KEY `DateOfOrder` (`DateOfOrder`),
  KEY `NewIndex1` (`Realised`),
  KEY `NewIndex2` (`Time1`),
  KEY `idx_torder_IdCustomers_state_control` (`IdCustomers`,`state`,`control`),
  KEY `idx_torder_date_state_car` (`DateOfSend`,`state`,`IdCar`,`IdOrder`),
  KEY `SorderId` (`SorderId`),
  KEY `fk_torder_1_idx` (`source_id`),
  KEY `idx_torder_customer_send` (`IdCustomers`,`DateOfSend`),
  KEY `fk_torder_3` (`IdCar`),
  KEY `idx_torder_magentoOrderID` (`magentoOrderID`),
  KEY `idx_torder_serial_number` (`serial_number`),
  KEY `idx_torder_realised_state` (`Realised`,`state`),
  CONSTRAINT `fk_torder_1` FOREIGN KEY (`source_id`) REFERENCES `order_sources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torder_2` FOREIGN KEY (`IdCustomers`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torder_3` FOREIGN KEY (`IdCar`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torder_4` FOREIGN KEY (`SorderId`) REFERENCES `sorder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `torderinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `torderinvoice` (
  `IdOrder` int(10) NOT NULL,
  `IdCustomers` int(10) NOT NULL,
  `DateOfOrder` datetime DEFAULT NULL,
  `TimeOfOrder` time DEFAULT NULL,
  `DateOfSend` date DEFAULT NULL,
  `IdCar` int(10) DEFAULT NULL,
  `Time1` time DEFAULT NULL,
  `Realised` tinyint(1) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `Notes_etc` varchar(2000) DEFAULT NULL,
  `notesForAccounting` varchar(2000) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `PayType` varchar(100) DEFAULT NULL,
  `control` tinyint(1) DEFAULT NULL,
  `SorderId` int(10) DEFAULT NULL,
  `state` int(1) DEFAULT 1,
  `creator` varchar(50) DEFAULT NULL,
  `invoice` tinyint(1) DEFAULT 0,
  `haNew` tinyint(1) DEFAULT NULL,
  `toDelete` enum('0','1') DEFAULT '0',
  `fiscalNumber` int(10) DEFAULT NULL,
  `payXResponse` varchar(100) DEFAULT NULL,
  `deliverystatus` enum('0','1') DEFAULT '0',
  `hdmStatus` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`IdOrder`),
  KEY `fk_torderinvoice_1` (`IdCustomers`),
  KEY `fk_torderinvoice_2` (`IdCar`),
  KEY `fk_torderinvoice_3` (`SorderId`),
  CONSTRAINT `fk_torderinvoice_1` FOREIGN KEY (`IdCustomers`) REFERENCES `t_customers` (`IdCustomers_IF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torderinvoice_2` FOREIGN KEY (`IdCar`) REFERENCES `t_car` (`IdCar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torderinvoice_3` FOREIGN KEY (`SorderId`) REFERENCES `sorder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transaction_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transact_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `vat` enum('1','0') DEFAULT '1',
  `price` double DEFAULT NULL,
  `note` varchar(255) DEFAULT '',
  `unit_price` double DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `transact_id` (`transact_id`),
  KEY `NewIndex1` (`product_id`),
  CONSTRAINT `fk_transaction_items_1` FOREIGN KEY (`transact_id`) REFERENCES `transactions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_items_product_id` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) DEFAULT NULL,
  `transact_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `before_transact` int(11) DEFAULT NULL,
  `count_item` int(11) DEFAULT NULL,
  `after_transact` int(11) DEFAULT NULL,
  `action_transact` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`,`transact_id`),
  KEY `NewIndex1` (`product_id`),
  KEY `fk_transaction_logs_1` (`transact_id`),
  CONSTRAINT `fk_transaction_logs_1` FOREIGN KEY (`transact_id`) REFERENCES `transactions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_logs_2` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_logs_3` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transact_date` datetime DEFAULT NULL,
  `source_stock` int(11) DEFAULT NULL,
  `dest_stock` int(11) DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `approver` varchar(30) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `creatorRole` int(11) DEFAULT NULL,
  `day_part` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_transaction_1` (`source_stock`),
  KEY `FK_transactions_2` (`dest_stock`),
  KEY `orderid` (`orderid`),
  KEY `idx_transact_date` (`transact_date`),
  KEY `idx_action_date` (`action_date`),
  KEY `fk_transactions_3` (`creatorRole`),
  KEY `idx_transactions_status_dest` (`status`,`dest_stock`),
  KEY `idx_transactions_status_source` (`status`,`source_stock`),
  CONSTRAINT `fk_transactions_1` FOREIGN KEY (`source_stock`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_2` FOREIGN KEY (`dest_stock`) REFERENCES `stocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_3` FOREIGN KEY (`creatorRole`) REFERENCES `admin_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_orderid` FOREIGN KEY (`orderid`) REFERENCES `torder` (`IdOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transport_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `vehicle_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense` decimal(8,1) DEFAULT NULL,
  `price` decimal(8,1) DEFAULT NULL,
  `distance` decimal(8,2) DEFAULT NULL,
  `schedule_team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehicle_cost_1_idx` (`schedule_team_id`),
  CONSTRAINT `fk_vehicle_cost_1` FOREIGN KEY (`schedule_team_id`) REFERENCES `delivery_schedule_teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;


INSERT INTO `tbl_migration` VALUES ('m000000_000000_base',1784900609);
INSERT INTO `tbl_migration` VALUES ('m260716_155158_t_product_add_qr_data_matrix',1784873436);
INSERT INTO `tbl_migration` VALUES ('m260716_160000_order_item_data_matrix',1784873436);
INSERT INTO `tbl_migration` VALUES ('m260717_142635_t_product_add_gtin',1784873436);
INSERT INTO `tbl_migration` VALUES ('m260722_120000_order_print_result',1784901208);
INSERT INTO `tbl_migration` VALUES ('m260723_124500_add_cred5_cred6_to_t_customers',1784901117);
INSERT INTO `tbl_migration` VALUES ('m260724_120000_add_maqur_4090_19_to_cars_waters',1784873436);
INSERT INTO `tbl_migration` VALUES ('m260724_130000_add_makur_jur_4090_19_to_podon_calc',1784873436);
INSERT INTO `tbl_migration` VALUES ('m260729_120000_add_last_activity_with_bonus_2_to_t_customers',1785317823);
INSERT INTO `tbl_migration` VALUES ('m260729_130000_t_product_add_gtin_min_block',1785317825);
INSERT INTO `tbl_migration` VALUES ('m260803_085501_create_merged_inv_orders',1785734295);
INSERT INTO `tbl_migration` VALUES ('m260803_100000_add_serial_number_to_torder',1785748112);
INSERT INTO `tbl_migration` VALUES ('m260804_092433_add_has_read_to_notification',1785821988);
INSERT INTO `tbl_migration` VALUES ('m260804_104157_add_check_serial_nu_to_torder',1785932059);
INSERT INTO `tbl_migration` VALUES ('m260807_134600_serial_number_response',1786343920);
INSERT INTO `tbl_migration` VALUES ('m260817_141751_add_production_pulse_indexes_to_transactions',1786963500);
INSERT INTO `tbl_migration` VALUES ('m260825_120000_drop_phone_if_from_t_customers',1791442414);
INSERT INTO `tbl_migration` VALUES ('m260909_141138_create_car_groups_table',1789046754);
INSERT INTO `tbl_migration` VALUES ('m260909_150000_create_prg_table',1789046754);
INSERT INTO `tbl_migration` VALUES ('m260909_150100_create_car_group_thresholds_table',1789046757);
INSERT INTO `tbl_migration` VALUES ('m260909_150200_create_ht_programs_table',1789046759);
INSERT INTO `tbl_migration` VALUES ('m260911_120000_create_product_cost_price_table',1789374464);
INSERT INTO `tbl_migration` VALUES ('m260914_120000_add_trip_fields_to_t_region',1789448488);
INSERT INTO `tbl_migration` VALUES ('m260914_130000_create_fuel_price_table',1789448489);
INSERT INTO `tbl_migration` VALUES ('m260914_140000_create_car_type_table',1789448489);
INSERT INTO `tbl_migration` VALUES ('m260914_140100_add_car_type_id_to_t_car',1789448492);
INSERT INTO `tbl_migration` VALUES ('m260914_150000_create_car_standards_table',1789448494);
INSERT INTO `tbl_migration` VALUES ('m260917_170000_add_serial_number_index_to_torder',1789733100);
INSERT INTO `tbl_migration` VALUES ('m260918_120000_add_trip_fuel_cost_to_t_region',1789733102);
INSERT INTO `tbl_migration` VALUES ('m260929_120000_add_new_period_to_t_product',1790665603);
INSERT INTO `tbl_migration` VALUES ('m260930_120000_create_asa_last_order_notice_table',1790839407);
INSERT INTO `tbl_migration` VALUES ('m261002_120000_create_attached_packages_table',1790936062);
INSERT INTO `tbl_migration` VALUES ('m261008_120000_create_transport_zone_table',1791438648);
INSERT INTO `tbl_migration` VALUES ('m261008_120100_create_real_region_table',1791438648);
INSERT INTO `tbl_migration` VALUES ('m261008_120200_add_zone_and_real_region_to_t_region',1791440330);
INSERT INTO `tbl_migration` VALUES ('m261008_140000_change_attached_packages_price_percent_to_double',1791467987);
INSERT INTO `tbl_migration` VALUES ('m261013_120000_create_vehicle_cost_table',1791963345);
INSERT INTO `tbl_migration` VALUES ('m261020_120000_create_returned_bottles_prg_table',1792477347);
INSERT INTO `tbl_migration` VALUES ('m261021_120000_create_cust_debt_history_table',1792582931);
INSERT INTO `tbl_migration` VALUES ('m261023_120100_add_ordered_products_id_order_index',1793256514);
INSERT INTO `tbl_migration` VALUES ('m261028_120000_add_bonuslist_car_date_time_index',1793256526);
INSERT INTO `tbl_migration` VALUES ('m261029_120000_add_bonuslist_date_member_time_index',1793864567);
INSERT INTO `tbl_migration` VALUES ('m261106_120000_create_order_coefficient_table',1793963994);
INSERT INTO `tbl_migration` VALUES ('m261109_120000_add_expense_to_torder',1794288767);
INSERT INTO `tbl_migration` VALUES ('m261110_120000_change_t_product_gtin_length',1794303824);
INSERT INTO `tbl_migration` VALUES ('m261110_130000_add_torder_realised_state_index',1794409527);
INSERT INTO `tbl_migration` VALUES ('m261112_120000_create_order_expense_table',1794494868);
INSERT INTO `tbl_migration` VALUES ('m261112_120100_drop_expense_from_torder',1794494868);
INSERT INTO `tbl_migration` VALUES ('m261113_120000_t_product_add_for_acquisition_cost',1794557547);
INSERT INTO `tbl_migration` VALUES ('m261113_130000_add_extra_fields_to_notification',1794575277);
