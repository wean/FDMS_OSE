-- MySQL dump 10.13  Distrib 5.6.24, for Linux (x86_64)
--
-- Host: localhost    Database: fdms_bestholiday
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_account`
--

DROP TABLE IF EXISTS `t_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_account` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_account`
--

LOCK TABLES `t_account` WRITE;
/*!40000 ALTER TABLE `t_account` DISABLE KEYS */;
INSERT INTO `t_account` VALUES ('4d0289c6d62111e4a6de001de03ecb01','支付宝','18662300916',122809,0,'2015-03-29 22:38:44'),('95d021f6d61011e4a3aa001de03ecb01','建行','6222021101043670754',10,0,NULL),('eed6035cd37611e48048001de03ecb01','工行','6122021101043170751',-891,0,NULL),('fd047f8ad37611e48048001de03ecb01','中行','1222021101043670754',5000,0,NULL);
/*!40000 ALTER TABLE `t_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_account_flow`
--

DROP TABLE IF EXISTS `t_account_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_account_flow` (
  `id` varchar(32) NOT NULL,
  `accountId` varchar(32) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `memo` text,
  `flowTypeId` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `profitItemId` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  KEY `flowTypeId` (`flowTypeId`),
  KEY `profitItemId` (`profitItemId`),
  CONSTRAINT `t_account_flow_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `t_account` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `t_account_flow_ibfk_2` FOREIGN KEY (`flowTypeId`) REFERENCES `t_account_flow_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_account_flow_ibfk_3` FOREIGN KEY (`profitItemId`) REFERENCES `t_profit_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_account_flow`
--

LOCK TABLES `t_account_flow` WRITE;
/*!40000 ALTER TABLE `t_account_flow` DISABLE KEYS */;
INSERT INTO `t_account_flow` VALUES ('1ad48984dd4911e48815001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',-2,0,'2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费123',NULL,'2015-04-08 01:11:18',NULL,1),('3f885e22dd4911e48815001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',-5,0,'2015-04-16 港澳自由行 海洋世界 海外 财务部 团费 5123',NULL,'2015-04-08 01:12:20',NULL,1),('44f63bc8d6a911e4afed001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',123,0,'','3debffbcd4f011e4a8ce001de03ecb01','2015-03-30 14:52:02',NULL,1),('5149ff48daa211e4b4bf001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',1,0,'1','3debffbcd4f011e4a8ce001de03ecb01','2015-04-04 16:12:21',NULL,1),('5b003330d5e911e48fb3001de03ecb01','eed6035cd37611e48048001de03ecb01',10,0,'10','3debffbcd4f011e4a8ce001de03ecb01',NULL,NULL,1),('6c3dce7eded011e49baa001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',1,0,'','3debffbcd4f011e4a8ce001de03ecb01','2015-04-09 23:52:28',NULL,1),('6ef7a12ade0911e48631001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',-9,0,'2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费',NULL,'2015-04-09 00:08:03',NULL,1),('75109e58e2f111e48662001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',100,0,'出发时间：2015-04-05 线路：台湾半月自由行 团号： 公司：青旅 部门：出境部 联系人：1234 项目：团费',NULL,'2015-04-15 05:59:01',NULL,1),('75d978bce82511e4941e001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',-10,0,'100 11','3debffbcd4f011e4a8ce001de03ecb01','2015-04-21 20:53:52',NULL,0),('8f71a354e68a11e49f1f001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',100,0,' ',NULL,'2015-04-19 19:52:31',NULL,0),('9a0b4d52d5ef11e4aafb001de03ecb01','eed6035cd37611e48048001de03ecb01',123,0,'总','3debffbcd4f011e4a8ce001de03ecb01',NULL,NULL,1),('bc7c4594d62111e4a6de001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',120000,0,'团费收入','6785d212d62111e4a6de001de03ecb01','2015-03-29 22:41:51',NULL,1),('be28e45ed60f11e4a3aa001de03ecb01','eed6035cd37611e48048001de03ecb01',11,0,'到沙发大声地说','3debffbcd4f011e4a8ce001de03ecb01',NULL,NULL,1),('c9a5f10cdc7011e49621001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',-1,0,'','621b2cbed62111e4a6de001de03ecb01','2015-04-06 23:22:51',NULL,1),('cefe71cae8ae11e48a7d001de03ecb01','eed6035cd37611e48048001de03ecb01',-1000,0,'出发时间：2015-05-01 线路：港澳自由行 海洋世界 团号：FFF000000000001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费','3debffbcd4f011e4a8ce001de03ecb01','2015-04-22 13:17:02','0ad14ac0e89511e48a7d001de03ecb01',0),('d0b03f64e82511e4b4e8001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',-100,0,'出发时间：2015-04-30 线路：泰美丽 泰北纯玩自由行 团号：FFFFFFFFFFFFFFf0001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费1111','3debffbcd4f011e4a8ce001de03ecb01','2015-04-21 20:56:24',NULL,1),('e263abb8d5e911e48fb3001de03ecb01','eed6035cd37611e48048001de03ecb01',10,0,'哈哈哈','3debffbcd4f011e4a8ce001de03ecb01',NULL,NULL,1),('e41c5bfadaa111e4b4bf001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',10,0,'111','6785d212d62111e4a6de001de03ecb01','2015-04-04 16:09:18',NULL,1),('e73ce982e0e911e496dc001de03ecb01','eed6035cd37611e48048001de03ecb01',-2,0,'2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费',NULL,'2015-04-12 15:59:54',NULL,1),('f1d8af26e8ae11e48a7d001de03ecb01','4d0289c6d62111e4a6de001de03ecb01',1600,0,'出发时间：2015-05-01 线路：港澳自由行 海洋世界 团号：FFF000000000001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费','3debffbcd4f011e4a8ce001de03ecb01','2015-04-22 13:18:01','ef8d2568e89411e4a1b2001de03ecb01',0);
/*!40000 ALTER TABLE `t_account_flow` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_bion_account_flow before insert 
on t_account_flow for each row 
begin
update t_account set money=money+new.money where id=new.accountId;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `t_account_flow_type`
--

DROP TABLE IF EXISTS `t_account_flow_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_account_flow_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_account_flow_type`
--

LOCK TABLES `t_account_flow_type` WRITE;
/*!40000 ALTER TABLE `t_account_flow_type` DISABLE KEYS */;
INSERT INTO `t_account_flow_type` VALUES ('3debffbcd4f011e4a8ce001de03ecb01','办公用品',NULL),('45db82ecd4f011e4a8ce001de03ecb01','员工工资',NULL),('621b2cbed62111e4a6de001de03ecb01','团费成本','2015-03-29 22:39:20'),('6785d212d62111e4a6de001de03ecb01','团费收入','2015-03-29 22:39:29'),('ee66ff36d4f011e4a8ce001de03ecb01','公关费用',NULL);
/*!40000 ALTER TABLE `t_account_flow_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_area`
--

DROP TABLE IF EXISTS `t_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_area` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_area`
--

LOCK TABLES `t_area` WRITE;
/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
INSERT INTO `t_area` VALUES ('452aa586dd4611e48cce001de03ecb01','1','2015-04-08 00:51:01'),('75319ba8d62111e4a6de001de03ecb01','苏州','2015-03-29 22:39:52'),('cb174792d37f11e48bc9001de03ecb01','常熟',NULL),('cebe7a0ad37f11e48bc9001de03ecb01','张家港',NULL),('d1b1082cd37f11e48bc9001de03ecb01','太仓',NULL),('d47fb468d37f11e48bc9001de03ecb01','昆山',NULL),('d7f0edbad37f11e48bc9001de03ecb01','江阴',NULL);
/*!40000 ALTER TABLE `t_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bill`
--

DROP TABLE IF EXISTS `t_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bill` (
  `id` varchar(32) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `money` float DEFAULT NULL,
  `profitItemId` varchar(32) DEFAULT NULL,
  `billPic` varchar(350) DEFAULT NULL,
  `billNo` varchar(100) DEFAULT NULL,
  `typeId` varchar(32) DEFAULT NULL,
  `memo` text,
  PRIMARY KEY (`id`),
  KEY `profitItemId` (`profitItemId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `t_bill_ibfk_1` FOREIGN KEY (`profitItemId`) REFERENCES `t_profit_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_bill_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `t_bill_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bill`
--

LOCK TABLES `t_bill` WRITE;
/*!40000 ALTER TABLE `t_bill` DISABLE KEYS */;
INSERT INTO `t_bill` VALUES ('2983aabad95611e48565001de03ecb01','2015-04-03 00:34:41',0,NULL,'static/upload/9026f5f6d95611e48565001de03ecb01.jpg','123','2c352ef2dec711e4b645001de03ecb01','备注备注'),('67dc95f6d95611e48565001de03ecb01','2015-04-03 00:36:26',2,NULL,'static/upload/3899dc1ee82311e482b6001de03ecb01.png','1111111','2c352ef2dec711e4b645001de03ecb01','None'),('6bcbdde6e82b11e4ab94001de03ecb01','2015-04-21 21:36:32',100,NULL,'static/upload/6a4f06d2e82b11e4ab94001de03ecb01.png','100','2c352ef2dec711e4b645001de03ecb01',''),('75d98bcce82511e4941e001de03ecb01','2015-04-21 20:53:52',10,NULL,'static/upload/738e3edae82511e4941e001de03ecb01.png','',NULL,'100 11'),('cefe9290e8ae11e48a7d001de03ecb01','2015-04-22 13:17:02',1000,'0ad14ac0e89511e48a7d001de03ecb01','static/upload/ce077b2ce8ae11e48a7d001de03ecb01.png','',NULL,'出发时间：2015-05-01 线路：港澳自由行 海洋世界 团号：FFF000000000001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费'),('d0b053a0e82511e4b4e8001de03ecb01','2015-04-21 20:56:24',100,NULL,'static/upload/8c416436e82811e4b4e8001de03ecb01.jpg','','2c352ef2dec711e4b645001de03ecb01','出发时间：2015-04-30 线路：泰美丽 泰北纯玩自由行 团号：FFFFFFFFFFFFFFf0001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费1111'),('f1d8cceae8ae11e48a7d001de03ecb01','2015-04-22 13:18:01',1600,'ef8d2568e89411e4a1b2001de03ecb01','static/upload/93a58e60e8ae11e48a7d001de03ecb01.png','',NULL,'出发时间：2015-05-01 线路：港澳自由行 海洋世界 团号：FFF000000000001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费');
/*!40000 ALTER TABLE `t_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bill_type`
--

DROP TABLE IF EXISTS `t_bill_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bill_type` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bill_type`
--

LOCK TABLES `t_bill_type` WRITE;
/*!40000 ALTER TABLE `t_bill_type` DISABLE KEYS */;
INSERT INTO `t_bill_type` VALUES ('2c352ef2dec711e4b645001de03ecb01','发票','2015-04-09 22:46:15'),('30ffe2a6dec711e4b645001de03ecb01','确认单','2015-04-09 22:46:23');
/*!40000 ALTER TABLE `t_bill_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_company`
--

DROP TABLE IF EXISTS `t_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_company` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_company`
--

LOCK TABLES `t_company` WRITE;
/*!40000 ALTER TABLE `t_company` DISABLE KEYS */;
INSERT INTO `t_company` VALUES ('1a0de9f4d39011e497f5001de03ecb01','青旅',NULL),('6e9481cad48711e49df3001de03ecb01','chunqiu',NULL),('80de6f44d62111e4a6de001de03ecb01','海外','2015-03-29 22:40:11'),('8cb820b6dc7611e4a786001de03ecb01','春秋','2015-04-07 00:04:05');
/*!40000 ALTER TABLE `t_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_contact`
--

DROP TABLE IF EXISTS `t_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_contact` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `companyId` varchar(32) DEFAULT NULL,
  `departmentId` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `departmentId` (`departmentId`),
  CONSTRAINT `t_contact_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `t_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_contact_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `t_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_contact`
--

LOCK TABLES `t_contact` WRITE;
/*!40000 ALTER TABLE `t_contact` DISABLE KEYS */;
INSERT INTO `t_contact` VALUES ('9428a944d4ea11e49d5a001de03ecb01','dffdfd','1a0de9f4d39011e497f5001de03ecb01','aa71b43cd3ca11e49520001de03ecb01',NULL,NULL,NULL,NULL),('9dc643fcd62111e4a6de001de03ecb01','财务总监','80de6f44d62111e4a6de001de03ecb01','8e7ee28cd62111e4a6de001de03ecb01','2015-03-29 22:41:00',NULL,NULL,NULL),('c33fbc92e69511e4be5b001de03ecb01','哈哈哈','1a0de9f4d39011e497f5001de03ecb01','aa71b43cd3ca11e49520001de03ecb01','2015-04-19 21:12:43','1988888888','317728282','181811818@qq.com'),('f9c3abf4d3ce11e49912001de03ecb01','1234','1a0de9f4d39011e497f5001de03ecb01','aa71b43cd3ca11e49520001de03ecb01',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department`
--

DROP TABLE IF EXISTS `t_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_department` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `companyId` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `t_department_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `t_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES ('77845508d48711e49df3001de03ecb01','chujingbu','6e9481cad48711e49df3001de03ecb01',NULL),('809a0a52d48711e49df3001de03ecb01','duanxian','6e9481cad48711e49df3001de03ecb01',NULL),('8e7ee28cd62111e4a6de001de03ecb01','财务部','80de6f44d62111e4a6de001de03ecb01','2015-03-29 22:40:34'),('aa71b43cd3ca11e49520001de03ecb01','出境部','1a0de9f4d39011e497f5001de03ecb01',NULL);
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ext_account`
--

DROP TABLE IF EXISTS `t_ext_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ext_account` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `companyId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `t_ext_account_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `t_company` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ext_account`
--

LOCK TABLES `t_ext_account` WRITE;
/*!40000 ALTER TABLE `t_ext_account` DISABLE KEYS */;
INSERT INTO `t_ext_account` VALUES ('714c603ce89a11e4b1d8001de03ecb01','8cb820b6dc7611e4a786001de03ecb01','春秋对公','622222222222222222222','2015-04-22 10:51:15'),('9350c20ee76e11e4bb0f001de03ecb01','1a0de9f4d39011e497f5001de03ecb01','工行对公','111111','2015-04-20 23:04:43');
/*!40000 ALTER TABLE `t_ext_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_guest`
--

DROP TABLE IF EXISTS `t_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_guest` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `engName` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `idCardNo` varchar(100) DEFAULT NULL,
  `visaHk` int(11) DEFAULT NULL,
  `visaMc` int(11) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `profitItemId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profitItemId` (`profitItemId`),
  CONSTRAINT `t_guest_ibfk_1` FOREIGN KEY (`profitItemId`) REFERENCES `t_profit_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_guest`
--

LOCK TABLES `t_guest` WRITE;
/*!40000 ALTER TABLE `t_guest` DISABLE KEYS */;
INSERT INTO `t_guest` VALUES ('7ba0a58ad87c11e48b12001de03ecb01','客人','KEREN',0,'11/12','22222222222222',1,1,'22222222222',NULL);
/*!40000 ALTER TABLE `t_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_income_check`
--

DROP TABLE IF EXISTS `t_income_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_income_check` (
  `id` varchar(32) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `money` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `profitItemId` varchar(32) DEFAULT NULL,
  `requestUserId` varchar(32) DEFAULT NULL,
  `requestMemo` text,
  `confirmUserId` varchar(32) DEFAULT NULL,
  `confirmTime` datetime DEFAULT NULL,
  `cancelUserId` varchar(32) DEFAULT NULL,
  `cancelTime` datetime DEFAULT NULL,
  `cancelMemo` text,
  `incomeAccountId` varchar(32) DEFAULT NULL,
  `payPic` varchar(350) DEFAULT NULL,
  `flowTypeId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cancelUserId` (`cancelUserId`),
  KEY `confirmUserId` (`confirmUserId`),
  KEY `requestUserId` (`requestUserId`),
  KEY `profitItemId` (`profitItemId`),
  KEY `incomeAccountId` (`incomeAccountId`),
  KEY `flowTypeId` (`flowTypeId`),
  CONSTRAINT `t_income_check_ibfk_1` FOREIGN KEY (`cancelUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_income_check_ibfk_2` FOREIGN KEY (`confirmUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_income_check_ibfk_3` FOREIGN KEY (`requestUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_income_check_ibfk_4` FOREIGN KEY (`profitItemId`) REFERENCES `t_profit_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_income_check_ibfk_5` FOREIGN KEY (`incomeAccountId`) REFERENCES `t_account` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_income_check_ibfk_6` FOREIGN KEY (`flowTypeId`) REFERENCES `t_account_flow_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_income_check`
--

LOCK TABLES `t_income_check` WRITE;
/*!40000 ALTER TABLE `t_income_check` DISABLE KEYS */;
INSERT INTO `t_income_check` VALUES ('00f2d6d2e69111e497f4001de03ecb01','2015-04-19 20:38:39',100,1,NULL,'12345','1000 ',NULL,NULL,NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01','','3debffbcd4f011e4a8ce001de03ecb01'),('05191854e10311e4a67e001de03ecb01','2015-04-12 18:59:41',3,1,NULL,'12345','出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费',NULL,NULL,NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01','static/upload/036a0ee6e10311e4a67e001de03ecb01.jpg',NULL),('29e3e844e10311e4a67e001de03ecb01','2015-04-12 19:00:43',10,1,NULL,'12345',' 出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费\n出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费',NULL,NULL,NULL,NULL,'','95d021f6d61011e4a3aa001de03ecb01','',NULL),('6c0b8b2ee2f111e48662001de03ecb01','2015-04-15 05:58:46',100,2,NULL,'12345','出发时间：2015-04-05 线路：台湾半月自由行 团号： 公司：青旅 部门：出境部 联系人：1234 项目：团费','12345','2015-03-15 05:59:00',NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01','',NULL),('887aa2dae68a11e4ba47001de03ecb01','2015-04-19 19:52:20',100,2,NULL,'12345',' ','12345','2015-03-19 19:52:31',NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01','',NULL),('946c2b9ce8ae11e48a7d001de03ecb01','2015-04-22 13:15:24',1600,2,'ef8d2568e89411e4a1b2001de03ecb01','12345','出发时间：2015-05-01 线路：港澳自由行 海洋世界 团号：FFF000000000001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费','12345','2015-03-22 13:17:42',NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01','static/upload/93a58e60e8ae11e48a7d001de03ecb01.png','3debffbcd4f011e4a8ce001de03ecb01'),('a660155ede0711e4a14e001de03ecb01','2015-04-08 23:55:17',-9,2,NULL,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-09 00:08:02',NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01',NULL,NULL),('b573cc1ee10111e486ad001de03ecb01','2015-04-12 18:50:18',3,1,NULL,'12345','出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 项目：团费',NULL,NULL,NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01',NULL,NULL),('c3847c48e0ea11e496dc001de03ecb01','2015-04-12 16:06:04',3,1,NULL,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费',NULL,NULL,NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01',NULL,NULL),('d20dc584e0e611e498a0001de03ecb01','2015-04-12 15:37:50',10,3,NULL,'12345','111 ',NULL,NULL,'12345','2015-03-12 15:45:31','1234','4d0289c6d62111e4a6de001de03ecb01',NULL,NULL),('dbfb9a06e83611e49412001de03ecb01','2015-04-21 22:58:24',1,1,NULL,'12345','出发时间：2015-04-30 线路：泰美丽 泰北纯玩自由行 团号：FFFFFFFFFFFFFFf0001 公司：青旅 部门：出境部 联系人：dffdfd 项目：团费',NULL,NULL,NULL,NULL,'','4d0289c6d62111e4a6de001de03ecb01','','3debffbcd4f011e4a8ce001de03ecb01');
/*!40000 ALTER TABLE `t_income_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_line`
--

DROP TABLE IF EXISTS `t_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_line` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_line`
--

LOCK TABLES `t_line` WRITE;
/*!40000 ALTER TABLE `t_line` DISABLE KEYS */;
INSERT INTO `t_line` VALUES ('40575554dd4611e48cce001de03ecb01','333','2015-04-08 00:50:52'),('68ed23f6da9711e49615001de03ecb01','港澳自由行 海洋世界','2015-04-04 14:54:16'),('b267841cdd4511e48cce001de03ecb01','泰美丽 泰北纯玩自由行','2015-04-08 00:46:54'),('c241f61add4511e48cce001de03ecb01','台湾半月自由行','2015-04-08 00:47:21'),('ea4ba9d0dd4511e48cce001de03ecb01','123','2015-04-08 00:48:28'),('ee61d634dd4511e48cce001de03ecb01','123','2015-04-08 00:48:35');
/*!40000 ALTER TABLE `t_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_link_user_group`
--

DROP TABLE IF EXISTS `t_link_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_link_user_group` (
  `id` varchar(32) NOT NULL,
  `groupId` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupId` (`groupId`),
  KEY `userId` (`userId`),
  CONSTRAINT `t_link_user_group_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `t_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_link_user_group_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_link_user_group`
--

LOCK TABLES `t_link_user_group` WRITE;
/*!40000 ALTER TABLE `t_link_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_link_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pay_request`
--

DROP TABLE IF EXISTS `t_pay_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pay_request` (
  `id` varchar(32) NOT NULL,
  `money` float DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `requestUserId` varchar(32) DEFAULT NULL,
  `requestMemo` text,
  `confirmUserId` varchar(32) DEFAULT NULL,
  `confirmTime` varchar(45) DEFAULT NULL,
  `cancelUserId` varchar(32) DEFAULT NULL,
  `cancelMemo` text,
  `cancelTime` datetime DEFAULT NULL,
  `payUserId` varchar(32) DEFAULT NULL,
  `payAccountId` varchar(32) DEFAULT NULL,
  `payTime` datetime DEFAULT NULL,
  `payMemo` text,
  `relateType` int(11) DEFAULT NULL,
  `relateId` varchar(32) DEFAULT NULL,
  `payPic` varchar(350) DEFAULT NULL,
  `flowTypeId` varchar(32) DEFAULT NULL,
  `extAccountId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requestUserId` (`requestUserId`),
  KEY `confirmUserId` (`confirmUserId`),
  KEY `cancelUserId` (`cancelUserId`),
  KEY `payUserId` (`payUserId`),
  KEY `payAccountId` (`payAccountId`),
  KEY `flowTypeId` (`flowTypeId`),
  KEY `extAccountId` (`extAccountId`),
  CONSTRAINT `t_pay_request_ibfk_1` FOREIGN KEY (`requestUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_pay_request_ibfk_2` FOREIGN KEY (`confirmUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_pay_request_ibfk_3` FOREIGN KEY (`cancelUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_pay_request_ibfk_4` FOREIGN KEY (`payUserId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_pay_request_ibfk_5` FOREIGN KEY (`payAccountId`) REFERENCES `t_account` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_pay_request_ibfk_6` FOREIGN KEY (`flowTypeId`) REFERENCES `t_account_flow_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_pay_request_ibfk_7` FOREIGN KEY (`extAccountId`) REFERENCES `t_ext_account` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pay_request`
--

LOCK TABLES `t_pay_request` WRITE;
/*!40000 ALTER TABLE `t_pay_request` DISABLE KEYS */;
INSERT INTO `t_pay_request` VALUES ('0ddf96fae82111e49146001de03ecb01',100,'2015-04-21 20:22:19',1,'12345','1111v ',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',0,'','','3debffbcd4f011e4a8ce001de03ecb01','9350c20ee76e11e4bb0f001de03ecb01'),('0ec13c96e0eb11e496dc001de03ecb01',95,'2015-04-12 16:08:10',2,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-12 16:09:43',NULL,'',NULL,NULL,NULL,NULL,'',1,'fe3f1010dc7011e49621001de03ecb01','',NULL,NULL),('12ffd7a4dd4911e48815001de03ecb01',2,'2015-04-08 01:11:05',4,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-08 01:11:13',NULL,'',NULL,'12345','eed6035cd37611e48048001de03ecb01','2015-03-12 15:59:53','',1,'ca2fb052d7cc11e4933d001de03ecb01','static/upload/e57e29a8e0e911e496dc001de03ecb01.jpg',NULL,NULL),('31255024dd4911e48815001de03ecb01',5,'2015-04-08 01:11:55',4,'12345','2015-04-16 港澳自由行 海洋世界 海外 财务部 团费 5','12345','2015-03-08 01:12:10',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-08 01:12:19','123',1,'fe3f1010dc7011e49621001de03ecb01',NULL,NULL,NULL),('427c8a94e82111e48f49001de03ecb01',10,'2015-04-21 20:23:47',4,'12345','100 ','12345','2015-03-21 20:52:21',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-21 20:53:51','11',0,'','static/upload/738e3edae82511e4941e001de03ecb01.png','3debffbcd4f011e4a8ce001de03ecb01','9350c20ee76e11e4bb0f001de03ecb01'),('4b76800cdd4811e4bc04001de03ecb01',2,'2015-04-08 01:05:30',4,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-08 01:05:38',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-08 01:05:46','123',1,'ca2fb052d7cc11e4933d001de03ecb01',NULL,NULL,NULL),('4b9c2decdbaa11e49857001de03ecb01',100,'2015-04-05 23:41:59',4,'12345','sdfdsfdsf','12345','2015-03-08 00:21:17',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-08 00:26:19','123',0,'',NULL,NULL,NULL),('55a482b0e10111e486ad001de03ecb01',-2,'2015-04-12 18:47:38',3,'12345','出发时间：2015-04-16 线路：港澳自由行 海洋世界 公司：青旅 部门：出境部 项目：团费',NULL,NULL,'12345','sddssds','2015-03-21 20:54:38',NULL,NULL,NULL,'',1,'ca2fb052d7cc11e4933d001de03ecb01','',NULL,NULL),('5861eff8e0eb11e496dc001de03ecb01',15,'2015-04-12 16:10:13',3,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费',NULL,NULL,'12345','sddsdssd','2015-03-21 20:54:29',NULL,NULL,NULL,'',1,'fe3f1010dc7011e49621001de03ecb01','',NULL,NULL),('89a46864e8ae11e4ba38001de03ecb01',1000,'2015-04-22 13:15:06',4,'12345','出发时间：2015-05-01 线路：港澳自由行 海洋世界 团号：FFF000000000001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费','12345','2015-03-22 13:15:20',NULL,'',NULL,'12345','eed6035cd37611e48048001de03ecb01','2015-03-22 13:16:44','',1,'0ad14ac0e89511e48a7d001de03ecb01','static/upload/ce077b2ce8ae11e48a7d001de03ecb01.png','3debffbcd4f011e4a8ce001de03ecb01','714c603ce89a11e4b1d8001de03ecb01'),('8b39b948dd4811e4903b001de03ecb01',2,'2015-04-08 01:07:17',4,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-08 01:07:24',NULL,'',NULL,'12345','eed6035cd37611e48048001de03ecb01','2015-03-08 01:07:32','123',1,'ca2fb052d7cc11e4933d001de03ecb01',NULL,NULL,NULL),('a310607ed62911e4b668001de03ecb01',100,'2015-03-29 23:38:25',0,'12345','',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',0,'',NULL,NULL,NULL),('bdf83698e68f11e49488001de03ecb01',100,'2015-04-19 20:29:37',1,'12345','100 ',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',0,'','','3debffbcd4f011e4a8ce001de03ecb01',NULL),('c3f64d22e82511e4b4e8001de03ecb01',100,'2015-04-21 20:56:03',4,'12345','出发时间：2015-04-30 线路：泰美丽 泰北纯玩自由行 团号：FFFFFFFFFFFFFFf0001 公司：青旅 部门：出境部 联系人：哈哈哈 项目：团费','12345','2015-03-21 20:56:14',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-21 20:56:24','1111',1,'bace6ee6e82511e4941e001de03ecb01','static/upload/cefe8de2e82511e4b4e8001de03ecb01.png','3debffbcd4f011e4a8ce001de03ecb01','9350c20ee76e11e4bb0f001de03ecb01'),('c81ef090dd4711e4a14a001de03ecb01',2,'2015-04-08 01:01:50',4,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-08 01:03:19',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-08 01:03:30','123',1,'ca2fb052d7cc11e4933d001de03ecb01',NULL,NULL,NULL),('c9b55826dd3e11e48b53001de03ecb01',2,'2015-04-07 23:57:27',3,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费',NULL,NULL,'12345','不通过','2015-03-08 00:21:06',NULL,NULL,NULL,'',1,'ca2fb052d7cc11e4933d001de03ecb01',NULL,NULL,NULL),('ca675cbadd4811e497ef001de03ecb01',2,'2015-04-08 01:09:03',4,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-08 01:09:13',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-08 01:09:19','123',1,'ca2fb052d7cc11e4933d001de03ecb01',NULL,NULL,NULL),('e4e0187ae68f11e4b1aa001de03ecb01',100,'2015-04-19 20:30:42',1,'12345','111 ',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',0,'','','45db82ecd4f011e4a8ce001de03ecb01',NULL),('e9813152dd4811e4aa29001de03ecb01',2,'2015-04-08 01:09:55',4,'12345','2015-04-16 港澳自由行 海洋世界 青旅 出境部 团费','12345','2015-03-08 01:10:03',NULL,'',NULL,'12345','4d0289c6d62111e4a6de001de03ecb01','2015-03-08 01:11:18','123',1,'ca2fb052d7cc11e4933d001de03ecb01',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_pay_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profit`
--

DROP TABLE IF EXISTS `t_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profit` (
  `id` varchar(32) NOT NULL,
  `departTime` datetime DEFAULT NULL,
  `peopleNum` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `lineId` varchar(32) DEFAULT NULL,
  `operatorId` varchar(32) DEFAULT NULL,
  `teamNo` varchar(200) DEFAULT NULL,
  `leaderNum` int(11) DEFAULT NULL,
  `sourceTypeId` varchar(32) DEFAULT NULL,
  `profitTypeId` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sellerId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lineId` (`lineId`),
  KEY `operatorId` (`operatorId`),
  KEY `sourceTypeId` (`sourceTypeId`),
  KEY `profitTypeId` (`profitTypeId`),
  KEY `sellerId` (`sellerId`),
  CONSTRAINT `t_profit_ibfk_1` FOREIGN KEY (`lineId`) REFERENCES `t_line` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `t_profit_ibfk_2` FOREIGN KEY (`operatorId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `t_profit_ibfk_3` FOREIGN KEY (`sourceTypeId`) REFERENCES `t_profit_source_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_profit_ibfk_4` FOREIGN KEY (`profitTypeId`) REFERENCES `t_profit_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_profit_ibfk_5` FOREIGN KEY (`sellerId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profit`
--

LOCK TABLES `t_profit` WRITE;
/*!40000 ALTER TABLE `t_profit` DISABLE KEYS */;
INSERT INTO `t_profit` VALUES ('d8211362e89411e4a1b2001de03ecb01','2015-05-01 00:00:00',12,'2015-04-22 10:11:11','哈哈，2，3','68ed23f6da9711e49615001de03ecb01','12345','FFF000000000001',2,'5843776cd6dc11e48ee9001de03ecb01','7a2fe40ed6d811e4a767001de03ecb01',2,'d134a74edc7811e4baf3001de03ecb01');
/*!40000 ALTER TABLE `t_profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profit_check_item`
--

DROP TABLE IF EXISTS `t_profit_check_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profit_check_item` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `typeName` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `memo` text,
  `operatorId` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `profitItemId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operatorId` (`operatorId`),
  KEY `profitItemId` (`profitItemId`),
  CONSTRAINT `t_profit_check_item_ibfk_1` FOREIGN KEY (`operatorId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_profit_check_item_ibfk_2` FOREIGN KEY (`profitItemId`) REFERENCES `t_profit_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profit_check_item`
--

LOCK TABLES `t_profit_check_item` WRITE;
/*!40000 ALTER TABLE `t_profit_check_item` DISABLE KEYS */;
INSERT INTO `t_profit_check_item` VALUES ('109854aae84311e4b71e001de03ecb01','111',23,2,'1111','12345','2015-04-22 00:25:47',NULL),('3a4b3b7ae2f611e486f4001de03ecb01','团费',1000,3,'','12345','2015-04-15 06:33:10',NULL),('5f1a4fbae12311e49d31001de03ecb01','成人',1000,10,'',NULL,'2015-04-12 22:51:16',NULL),('b2fce5cce83311e4a8c5001de03ecb01','19',19,3,'','12345','2015-04-21 22:35:47',NULL),('f827f2ace89411e48a7d001de03ecb01','团费',1200,2,'','12345','2015-04-22 10:12:04','ef8d2568e89411e4a1b2001de03ecb01'),('ff123ea6e89411e4b1d8001de03ecb01','小费',100,2,'','12345','2015-04-22 10:12:16','ef8d2568e89411e4a1b2001de03ecb01');
/*!40000 ALTER TABLE `t_profit_check_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profit_item`
--

DROP TABLE IF EXISTS `t_profit_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profit_item` (
  `id` varchar(32) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `profitItemTypeId` varchar(32) DEFAULT NULL,
  `contactId` varchar(32) DEFAULT NULL,
  `peopleNum` int(11) DEFAULT NULL,
  `totalMoney` float DEFAULT NULL,
  `profitId` varchar(32) DEFAULT NULL,
  `operatorId` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `departmentId` varchar(32) DEFAULT NULL,
  `companyId` varchar(32) DEFAULT NULL,
  `billNo` varchar(200) DEFAULT NULL,
  `guestContact` varchar(500) DEFAULT NULL,
  `concileId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profitItemTypeId` (`profitItemTypeId`),
  KEY `operatorId` (`operatorId`),
  KEY `profitId` (`profitId`),
  KEY `departmentId` (`departmentId`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `t_profit_item_ibfk_1` FOREIGN KEY (`profitItemTypeId`) REFERENCES `t_profit_item_type` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `t_profit_item_ibfk_2` FOREIGN KEY (`operatorId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `t_profit_item_ibfk_3` FOREIGN KEY (`profitId`) REFERENCES `t_profit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_profit_item_ibfk_4` FOREIGN KEY (`departmentId`) REFERENCES `t_department` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `t_profit_item_ibfk_5` FOREIGN KEY (`companyId`) REFERENCES `t_company` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profit_item`
--

LOCK TABLES `t_profit_item` WRITE;
/*!40000 ALTER TABLE `t_profit_item` DISABLE KEYS */;
INSERT INTO `t_profit_item` VALUES ('0ad14ac0e89511e48a7d001de03ecb01',1,'2728a53ed6fb11e491be001de03ecb01','c33fbc92e69511e4be5b001de03ecb01',2,2000,'d8211362e89411e4a1b2001de03ecb01','12345',NULL,'aa71b43cd3ca11e49520001de03ecb01','1a0de9f4d39011e497f5001de03ecb01','','',NULL),('174c7faee83111e49f59001de03ecb01',0,NULL,NULL,0,0,NULL,'12345',NULL,NULL,NULL,'','',NULL),('2cbbecf8e83111e4b4f3001de03ecb01',1,'2728a53ed6fb11e491be001de03ecb01','9428a944d4ea11e49d5a001de03ecb01',10,1000,NULL,'12345',NULL,'aa71b43cd3ca11e49520001de03ecb01','1a0de9f4d39011e497f5001de03ecb01','','',NULL),('375aabcce83111e48080001de03ecb01',1,'2728a53ed6fb11e491be001de03ecb01','9428a944d4ea11e49d5a001de03ecb01',10,1000,NULL,'12345',NULL,'aa71b43cd3ca11e49520001de03ecb01','1a0de9f4d39011e497f5001de03ecb01','','',NULL),('3f3a1652e83111e491da001de03ecb01',1,'2728a53ed6fb11e491be001de03ecb01','9428a944d4ea11e49d5a001de03ecb01',10,10,NULL,'12345',NULL,'aa71b43cd3ca11e49520001de03ecb01','1a0de9f4d39011e497f5001de03ecb01','','',NULL),('ea72d3dee83011e49f59001de03ecb01',0,NULL,NULL,0,0,NULL,'12345',NULL,NULL,NULL,'','',NULL),('ef8d2568e89411e4a1b2001de03ecb01',0,'2728a53ed6fb11e491be001de03ecb01','c33fbc92e69511e4be5b001de03ecb01',2,2600,'d8211362e89411e4a1b2001de03ecb01','12345',NULL,'aa71b43cd3ca11e49520001de03ecb01','1a0de9f4d39011e497f5001de03ecb01','','',NULL);
/*!40000 ALTER TABLE `t_profit_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profit_item_type`
--

DROP TABLE IF EXISTS `t_profit_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profit_item_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profit_item_type`
--

LOCK TABLES `t_profit_item_type` WRITE;
/*!40000 ALTER TABLE `t_profit_item_type` DISABLE KEYS */;
INSERT INTO `t_profit_item_type` VALUES ('2728a53ed6fb11e491be001de03ecb01','团费','2015-03-31 00:38:11'),('2b61f4e8d6fb11e491be001de03ecb01','机票款','2015-03-31 00:38:18');
/*!40000 ALTER TABLE `t_profit_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profit_source_type`
--

DROP TABLE IF EXISTS `t_profit_source_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profit_source_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profit_source_type`
--

LOCK TABLES `t_profit_source_type` WRITE;
/*!40000 ALTER TABLE `t_profit_source_type` DISABLE KEYS */;
INSERT INTO `t_profit_source_type` VALUES ('54ba53aed6dc11e48ee9001de03ecb01','直客','2015-03-30 20:57:33'),('5843776cd6dc11e48ee9001de03ecb01','同行','2015-03-30 20:57:39');
/*!40000 ALTER TABLE `t_profit_source_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_profit_type`
--

DROP TABLE IF EXISTS `t_profit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_profit_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_profit_type`
--

LOCK TABLES `t_profit_type` WRITE;
/*!40000 ALTER TABLE `t_profit_type` DISABLE KEYS */;
INSERT INTO `t_profit_type` VALUES ('51d2bd4cd6d811e4a767001de03ecb01','自由行','2015-03-30 20:28:50'),('5ccb7d92d6d811e4a767001de03ecb01','港澳整团','2015-03-30 20:29:09'),('6a2c7dc4d6d811e4a767001de03ecb01','港澳散拼','2015-03-30 20:29:31'),('73a6a28ad6d811e4a767001de03ecb01','代定机票','2015-03-30 20:29:47'),('7a2fe40ed6d811e4a767001de03ecb01','出境整团','2015-03-30 20:29:58'),('7ec28472d6d811e4a767001de03ecb01','出境散拼','2015-03-30 20:30:06'),('82d731fcd6d811e4a767001de03ecb01','国内','2015-03-30 20:30:12'),('86f04120d6d811e4a767001de03ecb01','签证','2015-03-30 20:30:19'),('8b17f16cd6d811e4a767001de03ecb01','其他','2015-03-30 20:30:26');
/*!40000 ALTER TABLE `t_profit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `salt` varchar(5) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('12345','admin','12345','e363373ddc24b34c5bb9d99abbfd8be5',NULL),('d134a74edc7811e4baf3001de03ecb01','测试','50d02','dfedabf46a5ccfc4f89a52755b62a3a5','2015-04-07 00:20:19');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_privilege`
--

DROP TABLE IF EXISTS `t_user_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_privilege` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `userId` varchar(32) DEFAULT NULL,
  `privilegeKey` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `t_user_privilege_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_privilege`
--

LOCK TABLES `t_user_privilege` WRITE;
/*!40000 ALTER TABLE `t_user_privilege` DISABLE KEYS */;
INSERT INTO `t_user_privilege` VALUES ('13ecaf92e1e111e485ba001de03ecb01','12345','tongji_jixiao_caozuo_mingxi',1,'2015-04-13 21:29:15'),('13f15434e1e111e485ba001de03ecb01','12345','tongji_jixiao_xiaoshou_mingxi',1,'2015-04-13 21:29:15'),('13f46386e1e111e485ba001de03ecb01','12345','tongji_jixiao_xiaoshou',1,'2015-04-13 21:29:15'),('13f75488e1e111e485ba001de03ecb01','12345','tongji_jixiao_caozuo',1,'2015-04-13 21:29:15'),('2cacc62ee2a011e4a508001de03ecb01','12345','tongji_company_guest',1,'2015-04-14 20:17:10'),('4664d4b4e23011e4ae47001de03ecb01','12345','tongji_lirun',1,'2015-04-14 06:56:10'),('5ac13fe4e2a611e4bd0f001de03ecb01','12345','tongji_dayin',1,'2015-04-14 21:01:24'),('5f914600e76e11e48c42001de03ecb01','12345','jichushuju_ext_account',1,'2015-04-20 23:03:16'),('77d46cd2e69d11e4a216001de03ecb01','12345','tongji_cost',1,'2015-04-19 22:07:52'),('b42e552ee1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_line',0,'2015-04-13 20:50:46'),('b42eedaee1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_account_flow_type',0,'2015-04-13 20:50:47'),('b42f7c7ee1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jitiao_profit_type',0,'2015-04-13 20:50:47'),('b430086ae1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_department',0,'2015-04-13 20:50:47'),('b430ac34e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_pay_request_new',0,'2015-04-13 20:50:47'),('b4313884e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','xitongshuju',0,'2015-04-13 20:50:47'),('b431c254e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jixiao',0,'2015-04-13 20:50:47'),('b4324c9ce1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_bill',0,'2015-04-13 20:50:47'),('b432d7d4e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jitiao',0,'2015-04-13 20:50:47'),('b433617ce1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','index',0,'2015-04-13 20:50:47'),('b433ea5ce1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jitiao_profit',0,'2015-04-13 20:50:47'),('b4347346e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_bill_type',0,'2015-04-13 20:50:47'),('b434fd2ae1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_account',0,'2015-04-13 20:50:47'),('b4358682e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jitiao_profit_source_type',0,'2015-04-13 20:50:47'),('b4362628e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu',1,'2015-04-13 20:50:47'),('b436b55ce1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','xitongshuju_user',0,'2015-04-13 20:50:47'),('b4373feae1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_contact',0,'2015-04-13 20:50:47'),('b437c988e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju',0,'2015-04-13 20:50:47'),('b4385222e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jitiao_profit_item_type',0,'2015-04-13 20:50:47'),('b438dc38e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_company',0,'2015-04-13 20:50:47'),('b4396478e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_income_check_new',0,'2015-04-13 20:50:47'),('b439ed08e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_account_flow',0,'2015-04-13 20:50:47'),('b43a766ae1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','tongji',0,'2015-04-13 20:50:47'),('b43aff9ae1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','jichushuju_area',0,'2015-04-13 20:50:47'),('b43b8c8ae1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_pay_request',0,'2015-04-13 20:50:47'),('b43c0e12e1db11e49199001de03ecb01','d134a74edc7811e4baf3001de03ecb01','caiwu_income_check',0,'2015-04-13 20:50:47'),('d36eeb92e22611e49b30001de03ecb01','12345','tongji_jixiao_seller',1,'2015-04-14 05:48:31'),('dd11bfc6e1ea11e4ad8a001de03ecb01','12345','tongji_jixiao_mingxi',1,'2015-04-13 22:39:18'),('e68194c4e22a11e480f3001de03ecb01','12345','jitiao_profit_check',1,'2015-04-14 06:17:41'),('e6baecc6e1e711e4a713001de03ecb01','12345','tongji_jixiao',1,'2015-04-13 22:18:05'),('fe25fe20e1db11e49199001de03ecb01','12345','jichushuju_line',1,'2015-04-13 20:52:51'),('fe26947ae1db11e49199001de03ecb01','12345','jichushuju_account_flow_type',1,'2015-04-13 20:52:51'),('fe2722e6e1db11e49199001de03ecb01','12345','jitiao_profit_type',1,'2015-04-13 20:52:51'),('fe27e370e1db11e49199001de03ecb01','12345','jichushuju_department',1,'2015-04-13 20:52:51'),('fe28586ee1db11e49199001de03ecb01','12345','caiwu_pay_request_new',1,'2015-04-13 20:52:51'),('fe28c510e1db11e49199001de03ecb01','12345','xitongshuju',1,'2015-04-13 20:52:51'),('fe29305ee1db11e49199001de03ecb01','12345','jixiao',1,'2015-04-13 20:52:51'),('fe299968e1db11e49199001de03ecb01','12345','caiwu_bill',1,'2015-04-13 20:52:51'),('fe2a0290e1db11e49199001de03ecb01','12345','jitiao',1,'2015-04-13 20:52:51'),('fe2a6bfee1db11e49199001de03ecb01','12345','index',0,'2015-04-13 20:52:51'),('fe2ad4e0e1db11e49199001de03ecb01','12345','jitiao_profit',1,'2015-04-13 20:52:51'),('fe2b3da4e1db11e49199001de03ecb01','12345','caiwu_bill_type',1,'2015-04-13 20:52:51'),('fe2ba622e1db11e49199001de03ecb01','12345','jichushuju_account',1,'2015-04-13 20:52:51'),('fe2c0d42e1db11e49199001de03ecb01','12345','jitiao_profit_source_type',1,'2015-04-13 20:52:51'),('fe2c75fce1db11e49199001de03ecb01','12345','caiwu',1,'2015-04-13 20:52:51'),('fe2cf1f8e1db11e49199001de03ecb01','12345','xitongshuju_user',1,'2015-04-13 20:52:51'),('fe2d5cf6e1db11e49199001de03ecb01','12345','jichushuju_contact',1,'2015-04-13 20:52:51'),('fe2dc6d2e1db11e49199001de03ecb01','12345','jichushuju',1,'2015-04-13 20:52:51'),('fe2e4760e1db11e49199001de03ecb01','12345','jitiao_profit_item_type',1,'2015-04-13 20:52:51'),('fe2ed22ae1db11e49199001de03ecb01','12345','jichushuju_company',1,'2015-04-13 20:52:51'),('fe2f5b64e1db11e49199001de03ecb01','12345','caiwu_income_check_new',1,'2015-04-13 20:52:51'),('fe2fe4bce1db11e49199001de03ecb01','12345','caiwu_account_flow',1,'2015-04-13 20:52:51'),('fe306ce8e1db11e49199001de03ecb01','12345','tongji',1,'2015-04-13 20:52:51'),('fe30f708e1db11e49199001de03ecb01','12345','jichushuju_area',1,'2015-04-13 20:52:51'),('fe318060e1db11e49199001de03ecb01','12345','caiwu_pay_request',1,'2015-04-13 20:52:51'),('fe3209e0e1db11e49199001de03ecb01','12345','caiwu_income_check',1,'2015-04-13 20:52:51');
/*!40000 ALTER TABLE `t_user_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_account_flow`
--

DROP TABLE IF EXISTS `v_account_flow`;
/*!50001 DROP VIEW IF EXISTS `v_account_flow`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_account_flow` AS SELECT 
 1 AS `id`,
 1 AS `accountId`,
 1 AS `money`,
 1 AS `type`,
 1 AS `memo`,
 1 AS `flowTypeId`,
 1 AS `createTime`,
 1 AS `profitItemId`,
 1 AS `accountName`,
 1 AS `accountAccount`,
 1 AS `flowTypeName`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_bill`
--

DROP TABLE IF EXISTS `v_bill`;
/*!50001 DROP VIEW IF EXISTS `v_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_bill` AS SELECT 
 1 AS `id`,
 1 AS `createTime`,
 1 AS `money`,
 1 AS `profitItemId`,
 1 AS `billPic`,
 1 AS `billNo`,
 1 AS `typeId`,
 1 AS `typeName`,
 1 AS `memo`,
 1 AS `profitId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_checked_profit_item`
--

DROP TABLE IF EXISTS `v_checked_profit_item`;
/*!50001 DROP VIEW IF EXISTS `v_checked_profit_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_checked_profit_item` AS SELECT 
 1 AS `id`,
 1 AS `checkedMoney`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ext_account`
--

DROP TABLE IF EXISTS `v_ext_account`;
/*!50001 DROP VIEW IF EXISTS `v_ext_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_ext_account` AS SELECT 
 1 AS `id`,
 1 AS `companyId`,
 1 AS `name`,
 1 AS `account`,
 1 AS `createTime`,
 1 AS `companyName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_guest`
--

DROP TABLE IF EXISTS `v_guest`;
/*!50001 DROP VIEW IF EXISTS `v_guest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_guest` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `engName`,
 1 AS `sex`,
 1 AS `birth`,
 1 AS `idCardNo`,
 1 AS `visaHk`,
 1 AS `visaMc`,
 1 AS `memo`,
 1 AS `profitItemId`,
 1 AS `profitId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_income_check`
--

DROP TABLE IF EXISTS `v_income_check`;
/*!50001 DROP VIEW IF EXISTS `v_income_check`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_income_check` AS SELECT 
 1 AS `id`,
 1 AS `createTime`,
 1 AS `money`,
 1 AS `status`,
 1 AS `profitItemId`,
 1 AS `requestUserId`,
 1 AS `requestMemo`,
 1 AS `confirmUserId`,
 1 AS `confirmTime`,
 1 AS `cancelUserId`,
 1 AS `cancelTime`,
 1 AS `cancelMemo`,
 1 AS `incomeAccountId`,
 1 AS `requestUserName`,
 1 AS `confirmUserName`,
 1 AS `cancelUserName`,
 1 AS `incomeAccountName`,
 1 AS `flowTypeName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_income_profit_item`
--

DROP TABLE IF EXISTS `v_income_profit_item`;
/*!50001 DROP VIEW IF EXISTS `v_income_profit_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_income_profit_item` AS SELECT 
 1 AS `id`,
 1 AS `money`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pay_request`
--

DROP TABLE IF EXISTS `v_pay_request`;
/*!50001 DROP VIEW IF EXISTS `v_pay_request`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_pay_request` AS SELECT 
 1 AS `id`,
 1 AS `money`,
 1 AS `createTime`,
 1 AS `status`,
 1 AS `requestUserId`,
 1 AS `requestMemo`,
 1 AS `confirmUserId`,
 1 AS `confirmTime`,
 1 AS `cancelUserId`,
 1 AS `cancelMemo`,
 1 AS `cancelTime`,
 1 AS `payUserId`,
 1 AS `payAccountId`,
 1 AS `payTime`,
 1 AS `payMemo`,
 1 AS `relateType`,
 1 AS `relateId`,
 1 AS `requestUserName`,
 1 AS `confirmUserName`,
 1 AS `cancelUserName`,
 1 AS `payUserName`,
 1 AS `payAccountName`,
 1 AS `flowTypeName`,
 1 AS `extAccountId`,
 1 AS `extAccountName`,
 1 AS `extAccountAccount`,
 1 AS `extAccountCompanyName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_profit`
--

DROP TABLE IF EXISTS `v_profit`;
/*!50001 DROP VIEW IF EXISTS `v_profit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_profit` AS SELECT 
 1 AS `id`,
 1 AS `departTime`,
 1 AS `peopleNum`,
 1 AS `createTime`,
 1 AS `leader`,
 1 AS `lineId`,
 1 AS `operatorId`,
 1 AS `teamNo`,
 1 AS `leaderNum`,
 1 AS `sourceTypeId`,
 1 AS `profitTypeId`,
 1 AS `lineName`,
 1 AS `profitTypeName`,
 1 AS `sourceTypeName`,
 1 AS `status`,
 1 AS `operatorName`,
 1 AS `sellerId`,
 1 AS `sellerName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_profit_item`
--

DROP TABLE IF EXISTS `v_profit_item`;
/*!50001 DROP VIEW IF EXISTS `v_profit_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_profit_item` AS SELECT 
 1 AS `id`,
 1 AS `type`,
 1 AS `profitItemTypeId`,
 1 AS `contactId`,
 1 AS `peopleNum`,
 1 AS `totalMoney`,
 1 AS `profitId`,
 1 AS `operatorId`,
 1 AS `createTime`,
 1 AS `departmentId`,
 1 AS `companyId`,
 1 AS `billNo`,
 1 AS `guestContact`,
 1 AS `profitItemTypeName`,
 1 AS `companyName`,
 1 AS `departmentName`,
 1 AS `contactName`,
 1 AS `checkedMoney`,
 1 AS `remainMoney`,
 1 AS `departTime`,
 1 AS `profitPeopleNum`,
 1 AS `leader`,
 1 AS `lineId`,
 1 AS `profitOperatorId`,
 1 AS `teamNo`,
 1 AS `leaderNum`,
 1 AS `sourceTypeId`,
 1 AS `profitTypeId`,
 1 AS `lineName`,
 1 AS `sourceTypeName`,
 1 AS `profitTypeName`,
 1 AS `profitStatus`,
 1 AS `profitOperatorName`,
 1 AS `sellerId`,
 1 AS `sellerName`,
 1 AS `incomeMoney`,
 1 AS `requestedMoney`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_requested_profit_item`
--

DROP TABLE IF EXISTS `v_requested_profit_item`;
/*!50001 DROP VIEW IF EXISTS `v_requested_profit_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_requested_profit_item` AS SELECT 
 1 AS `id`,
 1 AS `money`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_seach_profit_item`
--

DROP TABLE IF EXISTS `v_seach_profit_item`;
/*!50001 DROP VIEW IF EXISTS `v_seach_profit_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_seach_profit_item` AS SELECT 
 1 AS `id`,
 1 AS `concileId`,
 1 AS `peopleNum`,
 1 AS `totalMoney`,
 1 AS `guestContact`,
 1 AS `profitId`,
 1 AS `departTime`,
 1 AS `profitCreateTime`,
 1 AS `lineName`,
 1 AS `companyName`,
 1 AS `departmentName`,
 1 AS `contactName`,
 1 AS `contactInfo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_account_flow`
--

/*!50001 DROP VIEW IF EXISTS `v_account_flow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_account_flow` AS select `f`.`id` AS `id`,`f`.`accountId` AS `accountId`,`f`.`money` AS `money`,`f`.`type` AS `type`,`f`.`memo` AS `memo`,`f`.`flowTypeId` AS `flowTypeId`,`f`.`createTime` AS `createTime`,`f`.`profitItemId` AS `profitItemId`,`a`.`name` AS `accountName`,`a`.`account` AS `accountAccount`,`t`.`name` AS `flowTypeName`,`f`.`status` AS `status` from ((`t_account_flow` `f` left join `t_account` `a` on((`a`.`id` = `f`.`accountId`))) left join `t_account_flow_type` `t` on((`t`.`id` = `f`.`flowTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_bill`
--

/*!50001 DROP VIEW IF EXISTS `v_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_bill` AS select `b`.`id` AS `id`,`b`.`createTime` AS `createTime`,`b`.`money` AS `money`,`b`.`profitItemId` AS `profitItemId`,`b`.`billPic` AS `billPic`,`b`.`billNo` AS `billNo`,`b`.`typeId` AS `typeId`,`t`.`name` AS `typeName`,`b`.`memo` AS `memo`,`pi`.`profitId` AS `profitId` from ((`t_bill` `b` left join `t_bill_type` `t` on((`t`.`id` = `b`.`typeId`))) left join `t_profit_item` `pi` on((`pi`.`id` = `b`.`profitItemId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_checked_profit_item`
--

/*!50001 DROP VIEW IF EXISTS `v_checked_profit_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_checked_profit_item` AS select `t_account_flow`.`profitItemId` AS `id`,sum(`t_account_flow`.`money`) AS `checkedMoney` from `t_account_flow` group by `t_account_flow`.`profitItemId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ext_account`
--

/*!50001 DROP VIEW IF EXISTS `v_ext_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ext_account` AS select `a`.`id` AS `id`,`a`.`companyId` AS `companyId`,`a`.`name` AS `name`,`a`.`account` AS `account`,`a`.`createTime` AS `createTime`,`c`.`name` AS `companyName` from (`t_ext_account` `a` left join `t_company` `c` on((`c`.`id` = `a`.`companyId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_guest`
--

/*!50001 DROP VIEW IF EXISTS `v_guest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_guest` AS select `g`.`id` AS `id`,`g`.`name` AS `name`,`g`.`engName` AS `engName`,`g`.`sex` AS `sex`,`g`.`birth` AS `birth`,`g`.`idCardNo` AS `idCardNo`,`g`.`visaHk` AS `visaHk`,`g`.`visaMc` AS `visaMc`,`g`.`memo` AS `memo`,`g`.`profitItemId` AS `profitItemId`,`pi`.`profitId` AS `profitId` from (`t_guest` `g` left join `t_profit_item` `pi` on((`pi`.`id` = `g`.`profitItemId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_income_check`
--

/*!50001 DROP VIEW IF EXISTS `v_income_check`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_income_check` AS select `c`.`id` AS `id`,`c`.`createTime` AS `createTime`,`c`.`money` AS `money`,`c`.`status` AS `status`,`c`.`profitItemId` AS `profitItemId`,`c`.`requestUserId` AS `requestUserId`,`c`.`requestMemo` AS `requestMemo`,`c`.`confirmUserId` AS `confirmUserId`,`c`.`confirmTime` AS `confirmTime`,`c`.`cancelUserId` AS `cancelUserId`,`c`.`cancelTime` AS `cancelTime`,`c`.`cancelMemo` AS `cancelMemo`,`c`.`incomeAccountId` AS `incomeAccountId`,`ru`.`name` AS `requestUserName`,`cu`.`name` AS `confirmUserName`,`cc`.`name` AS `cancelUserName`,`a`.`name` AS `incomeAccountName`,`aft`.`name` AS `flowTypeName` from (((((`t_income_check` `c` left join `t_user` `ru` on((`ru`.`id` = `c`.`requestUserId`))) left join `t_user` `cu` on((`cu`.`id` = `c`.`confirmUserId`))) left join `t_user` `cc` on((`cc`.`id` = `c`.`cancelUserId`))) left join `t_account` `a` on((`a`.`id` = `c`.`incomeAccountId`))) left join `t_account_flow_type` `aft` on((`aft`.`id` = `c`.`flowTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_income_profit_item`
--

/*!50001 DROP VIEW IF EXISTS `v_income_profit_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_income_profit_item` AS select `t_income_check`.`profitItemId` AS `id`,sum(`t_income_check`.`money`) AS `money` from `t_income_check` where (`t_income_check`.`status` = 1) group by `t_income_check`.`profitItemId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pay_request`
--

/*!50001 DROP VIEW IF EXISTS `v_pay_request`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pay_request` AS select `r`.`id` AS `id`,`r`.`money` AS `money`,`r`.`createTime` AS `createTime`,`r`.`status` AS `status`,`r`.`requestUserId` AS `requestUserId`,`r`.`requestMemo` AS `requestMemo`,`r`.`confirmUserId` AS `confirmUserId`,`r`.`confirmTime` AS `confirmTime`,`r`.`cancelUserId` AS `cancelUserId`,`r`.`cancelMemo` AS `cancelMemo`,`r`.`cancelTime` AS `cancelTime`,`r`.`payUserId` AS `payUserId`,`r`.`payAccountId` AS `payAccountId`,`r`.`payTime` AS `payTime`,`r`.`payMemo` AS `payMemo`,`r`.`relateType` AS `relateType`,`r`.`relateId` AS `relateId`,`ru`.`name` AS `requestUserName`,`cu`.`name` AS `confirmUserName`,`ccu`.`name` AS `cancelUserName`,`pu`.`name` AS `payUserName`,`ac`.`name` AS `payAccountName`,`aft`.`name` AS `flowTypeName`,`r`.`extAccountId` AS `extAccountId`,`ea`.`name` AS `extAccountName`,`ea`.`account` AS `extAccountAccount`,`eac`.`name` AS `extAccountCompanyName` from ((((((((`t_pay_request` `r` left join `t_user` `ru` on((`ru`.`id` = `r`.`requestUserId`))) left join `t_user` `cu` on((`cu`.`id` = `r`.`confirmUserId`))) left join `t_user` `ccu` on((`ccu`.`id` = `r`.`cancelUserId`))) left join `t_user` `pu` on((`pu`.`id` = `r`.`payUserId`))) left join `t_account` `ac` on((`ac`.`id` = `r`.`payAccountId`))) left join `t_account_flow_type` `aft` on((`aft`.`id` = `r`.`flowTypeId`))) left join `t_ext_account` `ea` on((`ea`.`id` = `r`.`extAccountId`))) left join `t_company` `eac` on((`eac`.`id` = `ea`.`companyId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_profit`
--

/*!50001 DROP VIEW IF EXISTS `v_profit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_profit` AS select `p`.`id` AS `id`,`p`.`departTime` AS `departTime`,`p`.`peopleNum` AS `peopleNum`,`p`.`createTime` AS `createTime`,`p`.`leader` AS `leader`,`p`.`lineId` AS `lineId`,`p`.`operatorId` AS `operatorId`,`p`.`teamNo` AS `teamNo`,`p`.`leaderNum` AS `leaderNum`,`p`.`sourceTypeId` AS `sourceTypeId`,`p`.`profitTypeId` AS `profitTypeId`,`l`.`name` AS `lineName`,`pt`.`name` AS `profitTypeName`,`pst`.`name` AS `sourceTypeName`,`p`.`status` AS `status`,`ou`.`name` AS `operatorName`,`p`.`sellerId` AS `sellerId`,`su`.`name` AS `sellerName` from (((((`t_profit` `p` left join `t_line` `l` on((`l`.`id` = `p`.`lineId`))) left join `t_profit_type` `pt` on((`pt`.`id` = `p`.`profitTypeId`))) left join `t_profit_source_type` `pst` on((`pst`.`id` = `p`.`sourceTypeId`))) left join `t_user` `ou` on((`ou`.`id` = `p`.`operatorId`))) left join `t_user` `su` on((`su`.`id` = `p`.`sellerId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_profit_item`
--

/*!50001 DROP VIEW IF EXISTS `v_profit_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_profit_item` AS select `i`.`id` AS `id`,`i`.`type` AS `type`,`i`.`profitItemTypeId` AS `profitItemTypeId`,`i`.`contactId` AS `contactId`,`i`.`peopleNum` AS `peopleNum`,`i`.`totalMoney` AS `totalMoney`,`i`.`profitId` AS `profitId`,`i`.`operatorId` AS `operatorId`,`i`.`createTime` AS `createTime`,`i`.`departmentId` AS `departmentId`,`i`.`companyId` AS `companyId`,`i`.`billNo` AS `billNo`,`i`.`guestContact` AS `guestContact`,`t`.`name` AS `profitItemTypeName`,`c`.`name` AS `companyName`,`d`.`name` AS `departmentName`,`a`.`name` AS `contactName`,`cpi`.`checkedMoney` AS `checkedMoney`,(`i`.`totalMoney` - (ifnull(`cpi`.`checkedMoney`,0) * (1 - (`i`.`type` * 2)))) AS `remainMoney`,`p`.`departTime` AS `departTime`,`p`.`peopleNum` AS `profitPeopleNum`,`p`.`leader` AS `leader`,`p`.`lineId` AS `lineId`,`p`.`operatorId` AS `profitOperatorId`,`p`.`teamNo` AS `teamNo`,`p`.`leaderNum` AS `leaderNum`,`p`.`sourceTypeId` AS `sourceTypeId`,`p`.`profitTypeId` AS `profitTypeId`,`p`.`lineName` AS `lineName`,`p`.`sourceTypeName` AS `sourceTypeName`,`p`.`profitTypeName` AS `profitTypeName`,`p`.`status` AS `profitStatus`,`p`.`operatorName` AS `profitOperatorName`,`p`.`sellerId` AS `sellerId`,`p`.`sellerName` AS `sellerName`,`ipi`.`money` AS `incomeMoney`,`rpi`.`money` AS `requestedMoney` from ((((((((`t_profit_item` `i` left join `t_profit_item_type` `t` on((`t`.`id` = `i`.`profitItemTypeId`))) left join `t_company` `c` on((`c`.`id` = `i`.`companyId`))) left join `t_department` `d` on((`d`.`id` = `i`.`departmentId`))) left join `t_contact` `a` on((`a`.`id` = `i`.`contactId`))) left join `v_checked_profit_item` `cpi` on((`cpi`.`id` = `i`.`id`))) left join `v_profit` `p` on((`p`.`id` = `i`.`profitId`))) left join `v_income_profit_item` `ipi` on((`ipi`.`id` = `i`.`id`))) left join `v_requested_profit_item` `rpi` on((`rpi`.`id` = `i`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_requested_profit_item`
--

/*!50001 DROP VIEW IF EXISTS `v_requested_profit_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_requested_profit_item` AS select `t_pay_request`.`relateId` AS `id`,sum(`t_pay_request`.`money`) AS `money` from `t_pay_request` where ((`t_pay_request`.`status` in (1,2)) and (`t_pay_request`.`relateType` = 1)) group by `t_pay_request`.`relateId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_seach_profit_item`
--

/*!50001 DROP VIEW IF EXISTS `v_seach_profit_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_seach_profit_item` AS select `c`.`id` AS `id`,`c`.`concileId` AS `concileId`,`c`.`peopleNum` AS `peopleNum`,`c`.`totalMoney` AS `totalMoney`,`c`.`guestContact` AS `guestContact`,`c`.`profitId` AS `profitId`,`d`.`departTime` AS `departTime`,`d`.`createTime` AS `profitCreateTime`,`l`.`name` AS `lineName`,`com`.`name` AS `companyName`,`dep`.`name` AS `departmentName`,`con`.`name` AS `contactName`,`con`.`phone` AS `contactInfo` from ((((((`t_profit_item` `c` left join `t_profit` `d` on((`d`.`id` = `c`.`profitId`))) left join `t_line` `l` on((`l`.`id` = `d`.`lineId`))) left join `t_company` `com` on((`com`.`id` = `c`.`companyId`))) left join `t_department` `dep` on((`dep`.`id` = `c`.`departmentId`))) left join `t_contact` `con` on((`con`.`id` = `c`.`contactId`))) left join `v_checked_profit_item` `co` on((`co`.`id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-22 13:59:36
