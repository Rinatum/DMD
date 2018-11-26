CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: dmdproject.c6oqyq6orxxy.us-east-1.rds.amazonaws.com    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Application` (
  `App ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Version` varchar(45) NOT NULL DEFAULT '1.0',
  `Platform` varchar(45) NOT NULL DEFAULT 'IOS',
  `Permission` varchar(45) NOT NULL DEFAULT 'not permitted',
  `idPersonalInfo` int(10) unsigned NOT NULL,
  `idEmployee` int(10) unsigned NOT NULL,
  PRIMARY KEY (`App ID`),
  UNIQUE KEY `App ID_UNIQUE` (`App ID`),
  KEY `fk_Application_Personal Info1_idx` (`idPersonalInfo`),
  KEY `fk_Application_Employees1_idx` (`idEmployee`),
  CONSTRAINT `fk_Application_Employees1` FOREIGN KEY (`idEmployee`) REFERENCES `Employees` (`idemployee`),
  CONSTRAINT `fk_Application_Personal Info1` FOREIGN KEY (`idPersonalInfo`) REFERENCES `PersonalInfo` (`idpersonalinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application`
--

LOCK TABLES `Application` WRITE;
/*!40000 ALTER TABLE `Application` DISABLE KEYS */;
INSERT INTO `Application` VALUES (1,'2.0.0','Android','Phone',1,1),(2,'2.0.0','IOS','no',2,1),(3,'3.0.0','IOS','Phone',3,1),(4,'3.0.1','IOS','GPS',4,2),(5,'2.0.1','Android','no',5,2),(6,'2.0.0','Android','Phone',6,2),(7,'3.0.2','IOS','GPS',7,3),(8,'2.0.0','Android','Phone',8,3),(9,'2.1.0','Android','GPS',9,3);
/*!40000 ALTER TABLE `Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Building`
--

DROP TABLE IF EXISTS `Building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Building` (
  `idBuilding` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idLocation` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idBuilding`),
  UNIQUE KEY `idBuilding_UNIQUE` (`idBuilding`),
  UNIQUE KEY `idLocation_UNIQUE` (`idLocation`),
  KEY `fk_Building_Location1_idx` (`idLocation`),
  CONSTRAINT `fk_Building_Location1` FOREIGN KEY (`idLocation`) REFERENCES `Location` (`idlocation`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
INSERT INTO `Building` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,10);
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarModel`
--

DROP TABLE IF EXISTS `CarModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CarModel` (
  `idCarModel` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Model` varchar(45) NOT NULL,
  PRIMARY KEY (`idCarModel`),
  UNIQUE KEY `idCarModel_UNIQUE` (`idCarModel`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarModel`
--

LOCK TABLES `CarModel` WRITE;
/*!40000 ALTER TABLE `CarModel` DISABLE KEYS */;
INSERT INTO `CarModel` VALUES (1,'Lada'),(2,'Mercedes'),(3,'BWM'),(4,'Mitsubishi'),(5,'Hyundai'),(6,'Tesla'),(7,'Honda');
/*!40000 ALTER TABLE `CarModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarStatus`
--

DROP TABLE IF EXISTS `CarStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CarStatus` (
  `idCarStatus` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`idCarStatus`),
  UNIQUE KEY `idCarStatus_UNIQUE` (`idCarStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarStatus`
--

LOCK TABLES `CarStatus` WRITE;
/*!40000 ALTER TABLE `CarStatus` DISABLE KEYS */;
INSERT INTO `CarStatus` VALUES (1,'Ride to Customer'),(2,'Execute Order'),(3,'Free'),(4,'Charges'),(5,'is repaired'),(6,'Broken');
/*!40000 ALTER TABLE `CarStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChargingHistory`
--

DROP TABLE IF EXISTS `ChargingHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ChargingHistory` (
  `idCharging` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `StartTime` datetime NOT NULL,
  `FinishTime` datetime NOT NULL,
  `idVehicle` int(10) unsigned NOT NULL,
  `idChargingStation` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCharging`),
  UNIQUE KEY `idCharging_UNIQUE` (`idCharging`),
  KEY `fk_ChargingHistory_Vehicle1_idx` (`idVehicle`),
  KEY `fk_ChargingHistory_ChargingStation1_idx` (`idChargingStation`),
  CONSTRAINT `fk_ChargingHistory_ChargingStation1` FOREIGN KEY (`idChargingStation`) REFERENCES `ChargingStation` (`idchargingstation`),
  CONSTRAINT `fk_ChargingHistory_Vehicle1` FOREIGN KEY (`idVehicle`) REFERENCES `Vehicle` (`idvehiclep`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChargingHistory`
--

LOCK TABLES `ChargingHistory` WRITE;
/*!40000 ALTER TABLE `ChargingHistory` DISABLE KEYS */;
INSERT INTO `ChargingHistory` VALUES (2,'2018-11-01 01:20:00','2018-11-01 01:50:00',1,1),(3,'2018-11-06 02:20:00','2018-11-06 02:50:00',2,1),(4,'2018-11-03 03:20:00','2018-11-03 03:50:00',3,2),(5,'2018-11-03 04:20:00','2018-11-03 04:50:00',4,2),(6,'2018-11-03 05:20:00','2018-11-03 05:50:00',5,3),(7,'2018-11-03 06:20:00','2018-11-03 06:50:00',6,3),(8,'2018-11-03 07:20:00','2018-11-03 07:50:00',7,3),(9,'2018-11-03 08:20:00','2018-11-03 08:50:00',8,4),(10,'2018-11-03 09:20:00','2018-11-03 09:50:00',9,4),(11,'2018-11-03 10:20:00','2018-11-03 10:50:00',10,4),(12,'2018-11-03 11:20:00','2018-11-03 11:50:00',11,4),(13,'2018-11-03 12:20:00','2018-11-03 12:50:00',12,4),(14,'2018-11-03 13:20:00','2018-11-03 13:50:00',1,2),(15,'2018-11-03 14:20:00','2018-11-03 14:50:00',2,2),(16,'2018-11-03 15:20:00','2018-11-03 15:50:00',3,1),(17,'2018-11-03 16:20:00','2018-11-03 16:50:00',4,3),(18,'2018-11-03 17:20:00','2018-11-03 17:50:00',5,3),(19,'2018-11-03 18:20:00','2018-11-03 18:50:00',6,3),(20,'2018-11-03 19:20:00','2018-11-03 19:50:00',7,3),(21,'2018-11-03 20:20:00','2018-11-03 20:50:00',8,4),(22,'2018-11-03 21:20:00','2018-11-03 21:50:00',9,4),(23,'2018-11-03 22:20:00','2018-11-03 22:50:00',10,4),(24,'2018-11-03 23:20:00','2018-11-03 23:50:00',11,4),(26,'2018-11-07 01:06:00','2018-11-07 01:56:00',12,4),(27,'2018-11-07 02:05:00','2018-11-07 02:35:00',1,1),(28,'2018-11-07 03:05:00','2018-11-07 03:35:00',2,1),(29,'2018-11-07 04:05:00','2018-11-07 04:35:00',3,1),(30,'2018-11-05 05:05:00','2018-11-05 05:35:00',4,2),(31,'2018-11-03 06:05:00','2018-11-07 06:35:00',5,2),(32,'2018-11-07 07:05:00','2018-11-07 07:35:00',6,3),(33,'2018-11-07 08:05:00','2018-11-07 08:35:00',7,3),(34,'2018-11-07 09:05:00','2018-11-07 09:35:00',8,4),(35,'2018-11-07 10:05:00','2018-11-07 10:35:00',9,4),(36,'2018-11-07 11:05:00','2018-11-07 11:35:00',10,4),(37,'2018-11-07 12:05:00','2018-11-07 12:35:00',11,4),(38,'2018-11-07 13:05:00','2018-11-07 13:35:00',12,4),(39,'2018-11-07 14:05:00','2018-11-07 14:35:00',1,1),(40,'2018-11-07 15:05:00','2018-11-07 15:35:00',2,1),(41,'2018-11-07 16:05:00','2018-11-07 16:35:00',3,1),(42,'2018-11-07 17:05:00','2018-11-07 17:35:00',4,2),(43,'2018-11-07 18:05:00','2018-11-07 18:35:00',5,2),(44,'2018-11-07 19:05:00','2018-11-07 19:35:00',6,3),(45,'2018-11-07 20:05:00','2018-11-07 20:35:00',7,3),(46,'2018-11-07 21:05:00','2018-11-07 21:35:00',8,4),(47,'2018-11-07 22:05:00','2018-11-07 22:35:00',9,4),(48,'2018-11-07 23:05:00','2018-11-07 23:35:00',10,4);
/*!40000 ALTER TABLE `ChargingHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChargingStation`
--

DROP TABLE IF EXISTS `ChargingStation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ChargingStation` (
  `ChargingTime` int(10) unsigned NOT NULL DEFAULT '20',
  `Cost` double unsigned NOT NULL DEFAULT '200',
  `idChargingStation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idChargingStation`),
  UNIQUE KEY `idChargingStation_UNIQUE` (`idChargingStation`),
  CONSTRAINT `fk_Charging_Station1` FOREIGN KEY (`idChargingStation`) REFERENCES `Building` (`idbuilding`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChargingStation`
--

LOCK TABLES `ChargingStation` WRITE;
/*!40000 ALTER TABLE `ChargingStation` DISABLE KEYS */;
INSERT INTO `ChargingStation` VALUES (30,1000,1),(30,600,2),(30,400,3),(30,1200,4);
/*!40000 ALTER TABLE `ChargingStation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer` (
  `idCustomer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idLocation` int(10) unsigned NOT NULL,
  `idPersonalInfo` int(10) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `PaymentInfo` varchar(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE KEY `idCustomer_UNIQUE` (`idCustomer`),
  UNIQUE KEY `Surname_UNIQUE` (`username`),
  UNIQUE KEY `idPersonalInfo_UNIQUE` (`idPersonalInfo`),
  KEY `fk_Customer_Location1_idx` (`idLocation`),
  KEY `fk_Customer_Personal Info1_idx` (`idPersonalInfo`),
  CONSTRAINT `fk_Customer_Location1` FOREIGN KEY (`idLocation`) REFERENCES `Location` (`idlocation`),
  CONSTRAINT `fk_Customer_Personal Info1` FOREIGN KEY (`idPersonalInfo`) REFERENCES `PersonalInfo` (`idpersonalinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,1,1,'aa','master-card'),(2,2,2,'bb','MIR'),(3,2,3,'cc','VISA'),(4,10,4,'dd','Tinkoff'),(5,7,5,'mm','MIR'),(6,8,6,'nn','VISA');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetailRequest`
--

DROP TABLE IF EXISTS `DetailRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DetailRequest` (
  `idDetailRequest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Amount` int(10) unsigned NOT NULL DEFAULT '0',
  `idDetailsList` int(10) unsigned NOT NULL,
  `idEmployee` int(10) unsigned NOT NULL,
  `idProvider` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idDetailRequest`),
  UNIQUE KEY `idDetailRequest_UNIQUE` (`idDetailRequest`),
  KEY `fk_DetailRequest_DetailType1_idx` (`idDetailsList`),
  KEY `fk_DetailRequest_Employees1_idx` (`idEmployee`),
  KEY `fk_DetailRequest_Provider1_idx` (`idProvider`),
  CONSTRAINT `fk_DetailRequest_DetailType1` FOREIGN KEY (`idDetailsList`) REFERENCES `DetailType` (`iddetailslist`),
  CONSTRAINT `fk_DetailRequest_Employees1` FOREIGN KEY (`idEmployee`) REFERENCES `Employees` (`idemployee`),
  CONSTRAINT `fk_DetailRequest_Provider1` FOREIGN KEY (`idProvider`) REFERENCES `Provider` (`idprovider`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetailRequest`
--

LOCK TABLES `DetailRequest` WRITE;
/*!40000 ALTER TABLE `DetailRequest` DISABLE KEYS */;
INSERT INTO `DetailRequest` VALUES (1,25,1,1,1),(2,7,2,1,2),(3,8,3,2,3),(4,4,4,3,4),(5,9,5,5,5),(6,10,6,5,6),(7,7,7,5,7);
/*!40000 ALTER TABLE `DetailRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetailType`
--

DROP TABLE IF EXISTS `DetailType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DetailType` (
  `idDetailsList` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idDetailsList`),
  UNIQUE KEY `idDetailsList_UNIQUE` (`idDetailsList`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetailType`
--

LOCK TABLES `DetailType` WRITE;
/*!40000 ALTER TABLE `DetailType` DISABLE KEYS */;
INSERT INTO `DetailType` VALUES (1,'battery'),(2,'wheel'),(3,'wiper'),(4,'alternator belt'),(5,'spark plug'),(6,'fuse'),(7,'bumper');
/*!40000 ALTER TABLE `DetailType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeClass`
--

DROP TABLE IF EXISTS `EmployeeClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EmployeeClass` (
  `idEmployeeClass` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Class` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmployeeClass`),
  UNIQUE KEY `idEmployeeClass_UNIQUE` (`idEmployeeClass`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeClass`
--

LOCK TABLES `EmployeeClass` WRITE;
/*!40000 ALTER TABLE `EmployeeClass` DISABLE KEYS */;
INSERT INTO `EmployeeClass` VALUES (1,'Manager'),(2,'Director'),(3,'Developer'),(4,'Mechanical');
/*!40000 ALTER TABLE `EmployeeClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeServeBuildings`
--

DROP TABLE IF EXISTS `EmployeeServeBuildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EmployeeServeBuildings` (
  `idEmployee` int(10) unsigned NOT NULL,
  `idBuilding` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEmployee`,`idBuilding`),
  KEY `fk_Employees_has_Building_Building1_idx` (`idBuilding`),
  KEY `fk_Employees_has_Building_Employees1_idx` (`idEmployee`),
  CONSTRAINT `idBuilding` FOREIGN KEY (`idBuilding`) REFERENCES `Building` (`idbuilding`),
  CONSTRAINT `idEmployee` FOREIGN KEY (`idEmployee`) REFERENCES `Employees` (`idemployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeServeBuildings`
--

LOCK TABLES `EmployeeServeBuildings` WRITE;
/*!40000 ALTER TABLE `EmployeeServeBuildings` DISABLE KEYS */;
INSERT INTO `EmployeeServeBuildings` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(2,7);
/*!40000 ALTER TABLE `EmployeeServeBuildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employees` (
  `idEmployee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPersonalInfo` int(10) unsigned NOT NULL,
  `idEmployeeClass` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE KEY `EmpolyeesID_UNIQUE` (`idEmployee`),
  KEY `fk_Employees_Personal Info1_idx` (`idPersonalInfo`),
  KEY `fk_Employees_EmployeeClass1_idx` (`idEmployeeClass`),
  CONSTRAINT `fk_Employees_EmployeeClass1` FOREIGN KEY (`idEmployeeClass`) REFERENCES `EmployeeClass` (`idemployeeclass`),
  CONSTRAINT `fk_Employees_Personal Info1` FOREIGN KEY (`idPersonalInfo`) REFERENCES `PersonalInfo` (`idpersonalinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,1,3),(2,1,3),(3,3,3),(4,2,1),(5,4,4),(6,9,2),(7,5,1),(8,2,3),(9,1,1);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GPS`
--

DROP TABLE IF EXISTS `GPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GPS` (
  `idGPS` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Longitude` varchar(45) NOT NULL,
  `Latitude` varchar(45) NOT NULL,
  PRIMARY KEY (`idGPS`),
  UNIQUE KEY `idGPS_UNIQUE` (`idGPS`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GPS`
--

LOCK TABLES `GPS` WRITE;
/*!40000 ALTER TABLE `GPS` DISABLE KEYS */;
INSERT INTO `GPS` VALUES (1,'20','1000'),(2,'30','23'),(3,'1','2'),(4,'0','0'),(5,'600','600'),(6,'21','12'),(7,'900','555'),(8,'23','322'),(9,'1900','2333'),(10,'466','433');
/*!40000 ALTER TABLE `GPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemsRow`
--

DROP TABLE IF EXISTS `ItemsRow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ItemsRow` (
  `idItem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVehicle` int(10) unsigned NOT NULL,
  `idProduct` int(10) unsigned NOT NULL,
  `Amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idItem`),
  UNIQUE KEY `idItem_UNIQUE` (`idItem`),
  KEY `fk_Item_ProductList1_idx` (`idProduct`),
  KEY `fk_ItemsRow_Vending1_idx1` (`idVehicle`),
  CONSTRAINT `fk_Item_ProductList1` FOREIGN KEY (`idProduct`) REFERENCES `ProductList` (`idproduct`),
  CONSTRAINT `fk_ItemsRow_Vending1` FOREIGN KEY (`idVehicle`) REFERENCES `Vending` (`idvehiclep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemsRow`
--

LOCK TABLES `ItemsRow` WRITE;
/*!40000 ALTER TABLE `ItemsRow` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemsRow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Location` (
  `idLocation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idGPS` int(10) unsigned NOT NULL,
  `ZipCode` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`idLocation`),
  UNIQUE KEY `idLocation_UNIQUE` (`idLocation`),
  UNIQUE KEY `idGPS_UNIQUE` (`idGPS`),
  KEY `fk_Location_GPS1_idx` (`idGPS`),
  CONSTRAINT `fk_Location_GPS1` FOREIGN KEY (`idGPS`) REFERENCES `GPS` (`idgps`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,1,'426019','Russia','Izhevsk'),(2,2,'426022','Russia','Izhevsk'),(3,3,'426777','Russia','Neftkamsk'),(4,4,'433900','Russia','Neftekamsk'),(5,5,'288199','Russia','Kazan'),(6,6,'288120','Russia','Kazan'),(7,7,'288388','Russia','Kazan'),(8,8,'299819','Russia','Kazan'),(9,9,'289180','Russia','Kazan'),(10,10,'622099','Russia','Izhevsk');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Order` (
  `idOrder` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idFrom` int(10) unsigned NOT NULL,
  `idTo` int(10) unsigned NOT NULL,
  `idCustomer` int(10) unsigned NOT NULL,
  `idOrderStatus` int(10) unsigned NOT NULL,
  `CarToClientDistance` float NOT NULL,
  `StartTime` datetime NOT NULL,
  `FinishTime` datetime NOT NULL,
  `Price` varchar(45) NOT NULL,
  `Feedback` varchar(45) DEFAULT NULL,
  `idVehicle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idOrder`),
  UNIQUE KEY `idOrder_UNIQUE` (`idOrder`),
  KEY `fk_Order_Location1_idx` (`idFrom`),
  KEY `fk_Order_Location2_idx` (`idTo`),
  KEY `fk_Order_Customer1_idx` (`idCustomer`),
  KEY `fk_Order_OrderStatus1_idx` (`idOrderStatus`),
  KEY `fk_Order_Vehicle1_idx1` (`idVehicle`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`idCustomer`) REFERENCES `Customer` (`idcustomer`),
  CONSTRAINT `fk_Order_Location1` FOREIGN KEY (`idFrom`) REFERENCES `Location` (`idlocation`),
  CONSTRAINT `fk_Order_Location2` FOREIGN KEY (`idTo`) REFERENCES `Location` (`idlocation`),
  CONSTRAINT `fk_Order_OrderStatus1` FOREIGN KEY (`idOrderStatus`) REFERENCES `OrderStatus` (`idorderstatus`),
  CONSTRAINT `fk_Order_Vehicle1` FOREIGN KEY (`idVehicle`) REFERENCES `Vehicle` (`idvehiclep`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1,2,1,1,200,'2018-11-01 08:00:00','2018-11-01 10:00:00','170','Сool riding',1),(2,2,3,2,1,300,'2018-09-02 12:00:00','2018-09-02 14:00:00','190',NULL,1),(3,1,2,1,1,200,'2018-11-01 08:00:00','2018-11-01 10:00:00','200',NULL,1),(4,4,5,1,1,500,'2018-09-04 07:00:00','2018-09-04 10:00:00','228',NULL,1),(5,5,6,1,1,600,'2018-11-05 17:30:00','2018-11-05 18:30:00','229',NULL,1),(6,6,7,2,1,750,'2018-11-06 08:00:00','2018-11-06 10:00:00','170',NULL,2),(11,2,3,2,1,505,'2018-09-07 17:20:00','2018-09-07 18:30:00','229',NULL,2),(12,2,3,2,1,505,'2018-10-08 17:20:00','2018-10-08 18:30:00','230',NULL,2),(13,3,2,2,1,606,'2018-10-09 08:00:00','2018-10-09 13:00:00','222',NULL,2),(14,9,10,3,1,1000,'2018-09-10 08:00:00','2018-09-10 09:00:00','100',NULL,3),(15,1,5,3,1,100,'2018-10-11 07:00:00','2018-10-11 08:30:00','500',NULL,3),(16,2,6,3,1,50,'2018-10-12 23:00:00','2018-10-12 23:30:00','30',NULL,3),(17,3,6,3,1,290,'2018-10-13 08:00:00','2018-10-13 09:00:00','200',NULL,4),(18,2,8,4,1,30,'2018-11-14 08:00:00','2018-11-14 09:00:00','278',NULL,4),(19,5,7,4,1,200,'2018-10-15 09:00:00','2018-10-15 10:00:00','300',NULL,5),(20,5,8,5,1,500,'2018-11-16 10:00:00','2018-11-16 11:00:00','170',NULL,5),(21,6,10,6,1,100,'2018-11-17 11:00:00','2018-11-17 12:00:00','200',NULL,6),(22,7,9,6,1,8,'2018-10-18 12:00:00','2018-10-18 13:00:00','555',NULL,6),(23,2,10,6,1,400,'2018-11-19 13:00:00','2018-11-19 14:00:00','700',NULL,7),(24,1,7,1,1,200,'2018-10-20 08:00:00','2018-10-20 09:00:00','500',NULL,7),(25,9,8,1,1,100,'2018-11-21 08:00:00','2018-10-21 09:00:00','367',NULL,8),(26,4,3,2,1,23,'2018-10-22 17:00:00','2018-10-22 18:00:00','290',NULL,8),(27,2,1,2,1,24,'2018-10-23 17:00:00','2018-10-23 18:00:00','389',NULL,9),(28,10,5,3,1,20,'2018-11-24 08:00:00','2018-11-24 09:00:00','200',NULL,9),(29,6,3,3,1,1,'2018-10-25 19:00:00','2018-10-25 20:00:00','400',NULL,10),(30,7,4,4,1,0,'2018-10-26 20:00:00','2018-10-26 21:00:00','390',NULL,11),(31,8,2,5,1,80,'2018-10-27 21:00:00','2018-10-27 22:00:00','550',NULL,12);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `OrderStatus` (
  `idOrderStatus` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrderStatus`),
  UNIQUE KEY `idOrderStatus_UNIQUE` (`idOrderStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES (1,'Ride To Customer'),(2,'Finish');
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartsStorage`
--

DROP TABLE IF EXISTS `PartsStorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PartsStorage` (
  `idPartsStorage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Amount` int(10) unsigned NOT NULL,
  `idDetailsList` int(10) unsigned NOT NULL,
  `idCarModel` int(10) unsigned NOT NULL,
  `idWorkshop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idPartsStorage`),
  UNIQUE KEY `idPartsStorage_UNIQUE` (`idPartsStorage`),
  KEY `fk_PartsStorage_DetailType1_idx` (`idDetailsList`),
  KEY `fk_PartsStorage_CarModel1_idx` (`idCarModel`),
  KEY `fk_PartsStorage_Workshop1_idx` (`idWorkshop`),
  CONSTRAINT `fk_PartsStorage_CarModel1` FOREIGN KEY (`idCarModel`) REFERENCES `CarModel` (`idcarmodel`),
  CONSTRAINT `fk_PartsStorage_DetailType1` FOREIGN KEY (`idDetailsList`) REFERENCES `DetailType` (`iddetailslist`),
  CONSTRAINT `fk_PartsStorage_Workshop1` FOREIGN KEY (`idWorkshop`) REFERENCES `Workshop` (`idworkshop`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartsStorage`
--

LOCK TABLES `PartsStorage` WRITE;
/*!40000 ALTER TABLE `PartsStorage` DISABLE KEYS */;
INSERT INTO `PartsStorage` VALUES (1,10,1,1,5),(2,5,2,2,5),(3,2,6,6,7),(4,7,7,7,7),(5,10,5,5,6),(6,11,4,4,6),(7,6,3,3,6);
/*!40000 ALTER TABLE `PartsStorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalInfo`
--

DROP TABLE IF EXISTS `PersonalInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PersonalInfo` (
  `idPersonalInfo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Phone Number` varchar(45) NOT NULL,
  `E-mail` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersonalInfo`),
  UNIQUE KEY `SSN_UNIQUE` (`idPersonalInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalInfo`
--

LOCK TABLES `PersonalInfo` WRITE;
/*!40000 ALTER TABLE `PersonalInfo` DISABLE KEYS */;
INSERT INTO `PersonalInfo` VALUES (1,'Rinat','Mulla','8-900-555-35-35','rintikir@innopolis.ru'),(2,'Katukha','Uzbekova','8-917-797-24-80','katya@yandex.ru'),(3,'Yar','Yudinskikh','8-920-193-22-32','y.yudinskikh@innopolis.ru'),(4,'Irina','Kell','8-347-900-22-33','p_perl@edu.ru'),(5,'Semen','Kiselev','8-233-444-23-45','s.kiselev@innopolis.ru'),(6,'Rassul','Tartar','8-990-293-43-45','r.tartar@yandex.ru'),(7,'Kostya','Ann','8-917-322-34-56','t.tramb@yandex.ru'),(8,'Andrey','Kulagin','8-927-455-34-56','a.kulagin@innopolis.ru'),(9,'Artem','Ivanov','8-927-344-23-45','a.ivanov@innopolis.ru'),(10,'Nikolay','Kudasov','8-917-900-40-09','n.kudasov@edu.ru'),(11,'Bertran','Meyer','8-987-667-90-45','bertran@mail.ru'),(12,'Kirill','Fedoseev','8-960-123-35-37','kirill_fed@yandex.ru'),(13,'Elena','Kornilaeva','8-962-900-25-34','elena_kornilaeva@yandex.ru'),(14,'Anna','Uzbekova','8-987-290-81-23','gfycyd@gmail.com'),(15,'Dmitrij','Reza','8-917-34-16-491','xdima1@mail.ru'),(16,'Nikita','Kostenko','8-975-090-22-00','n.kostenko@innopolis.ru');
/*!40000 ALTER TABLE `PersonalInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductList`
--

DROP TABLE IF EXISTS `ProductList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ProductList` (
  `idProduct` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE KEY `idProduct_UNIQUE` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductList`
--

LOCK TABLES `ProductList` WRITE;
/*!40000 ALTER TABLE `ProductList` DISABLE KEYS */;
INSERT INTO `ProductList` VALUES (1,'chokolate',60),(2,'marmelade',20),(3,'coca-cola',45),(4,'fanta',35),(5,'waflya',20),(6,'snikers',50),(7,'twix',65),(8,'RedBull',120);
/*!40000 ALTER TABLE `ProductList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductList_has_Vending`
--

DROP TABLE IF EXISTS `ProductList_has_Vending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ProductList_has_Vending` (
  `ProductList_idProduct` int(10) unsigned NOT NULL,
  `Vending_Car(Vehicle)_LicencePlate` int(10) unsigned NOT NULL,
  `Amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProductList_idProduct`,`Vending_Car(Vehicle)_LicencePlate`),
  KEY `fk_ProductList_has_Vending_Vending1_idx` (`Vending_Car(Vehicle)_LicencePlate`),
  KEY `fk_ProductList_has_Vending_ProductList1_idx` (`ProductList_idProduct`),
  CONSTRAINT `fk_ProductList_has_Vending_ProductList1` FOREIGN KEY (`ProductList_idProduct`) REFERENCES `ProductList` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductList_has_Vending`
--

LOCK TABLES `ProductList_has_Vending` WRITE;
/*!40000 ALTER TABLE `ProductList_has_Vending` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductList_has_Vending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Provider` (
  `idProvider` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCarModel` int(10) unsigned NOT NULL,
  `idLocation` int(10) unsigned NOT NULL,
  `idPersonalInfo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idProvider`),
  UNIQUE KEY `idProvider_UNIQUE` (`idProvider`),
  KEY `fk_Provider_CarModel2_idx` (`idCarModel`),
  KEY `fk_Provider_Location2_idx` (`idLocation`),
  KEY `fk_Provider_PersonalInfo1_idx` (`idPersonalInfo`),
  CONSTRAINT `fk_Provider_CarModel2` FOREIGN KEY (`idCarModel`) REFERENCES `CarModel` (`idcarmodel`),
  CONSTRAINT `fk_Provider_Location2` FOREIGN KEY (`idLocation`) REFERENCES `Location` (`idlocation`),
  CONSTRAINT `fk_Provider_PersonalInfo1` FOREIGN KEY (`idPersonalInfo`) REFERENCES `PersonalInfo` (`idpersonalinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider`
--

LOCK TABLES `Provider` WRITE;
/*!40000 ALTER TABLE `Provider` DISABLE KEYS */;
INSERT INTO `Provider` VALUES (1,1,1,10),(2,2,2,11),(3,3,3,12),(4,4,4,13),(5,5,5,14),(6,6,6,15),(7,7,7,16);
/*!40000 ALTER TABLE `Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider_has_DetailType`
--

DROP TABLE IF EXISTS `Provider_has_DetailType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Provider_has_DetailType` (
  `idProvider` int(10) unsigned NOT NULL,
  `idDetailsList` int(10) unsigned NOT NULL,
  `Price` int(10) unsigned NOT NULL,
  `Amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idProvider`,`idDetailsList`),
  KEY `fk_Provider_has_DetailsList_Provider1_idx` (`idProvider`),
  KEY `fk_Provider_has_DetailType_DetailType1_idx` (`idDetailsList`),
  CONSTRAINT `fk_Provider_has_DetailType_DetailType1` FOREIGN KEY (`idDetailsList`) REFERENCES `DetailType` (`iddetailslist`),
  CONSTRAINT `fk_Provider_has_DetailsList_Provider1` FOREIGN KEY (`idProvider`) REFERENCES `Provider` (`idprovider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider_has_DetailType`
--

LOCK TABLES `Provider_has_DetailType` WRITE;
/*!40000 ALTER TABLE `Provider_has_DetailType` DISABLE KEYS */;
INSERT INTO `Provider_has_DetailType` VALUES (1,1,100,40),(2,2,101,35),(3,3,228,455),(4,4,500,90),(5,5,300,20),(6,6,200,30),(7,7,1488,10);
/*!40000 ALTER TABLE `Provider_has_DetailType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProvidingsHistory`
--

DROP TABLE IF EXISTS `ProvidingsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ProvidingsHistory` (
  `idProviding` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idDetailsList` int(10) unsigned NOT NULL,
  `idProvider` int(10) unsigned NOT NULL,
  `Amount` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL,
  `idWorkshop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idProviding`),
  UNIQUE KEY `idProviding_UNIQUE` (`idProviding`),
  KEY `fk_Provider_has_Workshop_Provider2_idx` (`idProvider`),
  KEY `fk_ProvidingsHistory_DetailType1_idx` (`idDetailsList`),
  KEY `fk_ProvidingsHistory_Workshop1_idx` (`idWorkshop`),
  CONSTRAINT `fk_Provider_has_Workshop_Provider2` FOREIGN KEY (`idProvider`) REFERENCES `Provider` (`idprovider`),
  CONSTRAINT `fk_ProvidingsHistory_DetailType1` FOREIGN KEY (`idDetailsList`) REFERENCES `DetailType` (`iddetailslist`),
  CONSTRAINT `fk_ProvidingsHistory_Workshop1` FOREIGN KEY (`idWorkshop`) REFERENCES `Workshop` (`idworkshop`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProvidingsHistory`
--

LOCK TABLES `ProvidingsHistory` WRITE;
/*!40000 ALTER TABLE `ProvidingsHistory` DISABLE KEYS */;
INSERT INTO `ProvidingsHistory` VALUES (1,1,1,10,'2018-11-01 10:00:00',5),(2,2,2,5,'2018-11-02 10:00:00',5),(3,3,3,6,'2018-11-03 10:00:00',6),(4,4,4,11,'2018-11-04 10:00:00',6),(5,5,5,10,'2018-11-05 10:00:00',6),(6,6,6,2,'2018-11-06 10:00:00',7),(7,7,7,1,'2018-11-07 10:00:00',7);
/*!40000 ALTER TABLE `ProvidingsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchasingHistory`
--

DROP TABLE IF EXISTS `PurchasingHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PurchasingHistory` (
  `idPurchase` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idProduct` int(10) unsigned NOT NULL,
  `idCustomer` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL,
  `idVehicle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPurchase`),
  UNIQUE KEY `idPurchase_UNIQUE` (`idPurchase`),
  KEY `fk_Purchase_ProductList1_idx` (`idProduct`),
  KEY `fk_Purchase_Customer1_idx` (`idCustomer`),
  KEY `fk_PurchasingHistory_Vending1_idx` (`idVehicle`),
  CONSTRAINT `fk_Purchase_Customer1` FOREIGN KEY (`idCustomer`) REFERENCES `Customer` (`idcustomer`),
  CONSTRAINT `fk_Purchase_ProductList1` FOREIGN KEY (`idProduct`) REFERENCES `ProductList` (`idproduct`),
  CONSTRAINT `fk_PurchasingHistory_Vending1` FOREIGN KEY (`idVehicle`) REFERENCES `Vending` (`idvehiclep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchasingHistory`
--

LOCK TABLES `PurchasingHistory` WRITE;
/*!40000 ALTER TABLE `PurchasingHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchasingHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepairingHistory`
--

DROP TABLE IF EXISTS `RepairingHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `RepairingHistory` (
  `idRepairing` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVehicle` int(10) unsigned NOT NULL,
  `StartTime` datetime NOT NULL,
  `FinishTime` datetime NOT NULL,
  `idDetailsList` int(10) unsigned NOT NULL,
  `idWorkshop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idRepairing`),
  UNIQUE KEY `idRepairing_UNIQUE` (`idRepairing`),
  KEY `fk_Car(Vehicle)_has_Workshop_Car(Vehicle)1_idx` (`idVehicle`),
  KEY `fk_RepairingHistory_DetailType1_idx` (`idDetailsList`),
  KEY `fk_RepairingHistory_Workshop1_idx` (`idWorkshop`),
  CONSTRAINT `fk_RepairingHistory_DetailType1` FOREIGN KEY (`idDetailsList`) REFERENCES `DetailType` (`iddetailslist`),
  CONSTRAINT `fk_RepairingHistory_Workshop1` FOREIGN KEY (`idWorkshop`) REFERENCES `Workshop` (`idworkshop`),
  CONSTRAINT `fk_Vehicle` FOREIGN KEY (`idVehicle`) REFERENCES `Vehicle` (`idvehiclep`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepairingHistory`
--

LOCK TABLES `RepairingHistory` WRITE;
/*!40000 ALTER TABLE `RepairingHistory` DISABLE KEYS */;
INSERT INTO `RepairingHistory` VALUES (1,1,'2018-11-01 11:20:00','2018-11-01 12:20:00',1,5),(2,1,'2018-11-02 11:20:00','2018-11-02 12:20:00',1,5),(3,1,'2018-11-10 10:00:00','2018-11-10 11:00:00',1,5),(4,2,'2018-11-17 16:00:00','2018-11-17 17:00:00',2,5),(5,2,'2018-11-01 11:20:00','2018-11-01 12:20:00',2,5),(6,3,'2018-11-11 14:00:00','2018-11-01 14:30:00',4,6),(7,4,'2018-11-01 10:20:00','2018-11-01 11:00:00',4,6),(8,5,'2018-11-01 12:20:00','2018-11-01 13:00:00',1,6),(9,6,'2018-11-01 15:00:00','2018-11-01 16:00:00',2,7),(10,7,'2018-11-10 17:00:00','2018-11-10 18:00:00',5,7),(11,8,'2018-11-11 11:11:00','2018-11-11 11:20:00',1,5),(12,9,'2018-11-14 14:00:00','2018-11-14 14:50:00',5,5),(13,10,'2018-11-15 11:20:00','2018-11-15 12:00:00',7,6),(14,11,'2018-11-16 11:20:00','2018-11-16 12:00:00',4,6),(15,12,'2018-11-20 11:20:00','2018-11-20 12:00:00',3,6);
/*!40000 ALTER TABLE `RepairingHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SocketTypes`
--

DROP TABLE IF EXISTS `SocketTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SocketTypes` (
  `idSocketTypes` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idSocketTypes`),
  UNIQUE KEY `idSocketTypes_UNIQUE` (`idSocketTypes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SocketTypes`
--

LOCK TABLES `SocketTypes` WRITE;
/*!40000 ALTER TABLE `SocketTypes` DISABLE KEYS */;
INSERT INTO `SocketTypes` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10');
/*!40000 ALTER TABLE `SocketTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sockets`
--

DROP TABLE IF EXISTS `Sockets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Sockets` (
  `idSockets` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Available` int(10) unsigned NOT NULL,
  `Amount` int(10) unsigned NOT NULL,
  `idSocketTypes` int(10) unsigned NOT NULL,
  `idChargingStation` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idSockets`),
  UNIQUE KEY `idSockets_UNIQUE` (`idSockets`),
  KEY `fk_Sockets_SocketTypes1_idx` (`idSocketTypes`),
  KEY `fk_Sockets_ChargingStation1_idx` (`idChargingStation`),
  CONSTRAINT `fk_Sockets_ChargingStation1` FOREIGN KEY (`idChargingStation`) REFERENCES `ChargingStation` (`idchargingstation`),
  CONSTRAINT `fk_Sockets_SocketTypes1` FOREIGN KEY (`idSocketTypes`) REFERENCES `SocketTypes` (`idsockettypes`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sockets`
--

LOCK TABLES `Sockets` WRITE;
/*!40000 ALTER TABLE `Sockets` DISABLE KEYS */;
INSERT INTO `Sockets` VALUES (1,10,10,1,1),(2,2,2,2,1),(3,4,4,1,2),(4,5,5,2,2),(5,7,7,2,3),(6,3,3,3,3),(7,2,2,3,4),(8,10,10,4,4),(9,7,7,5,4);
/*!40000 ALTER TABLE `Sockets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Vehicle` (
  `idVehicleP` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idLocation` int(10) unsigned NOT NULL,
  `idSocketTypes` int(10) unsigned NOT NULL,
  `idCarStatus` int(10) unsigned NOT NULL,
  `idCarModel` int(10) unsigned NOT NULL,
  `ChargeLevel` float unsigned NOT NULL DEFAULT '0',
  `Color` varchar(45) NOT NULL DEFAULT 'red',
  `licensePlate` varchar(45) NOT NULL,
  `idEmployee` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idVehicleP`),
  UNIQUE KEY `Licence Level_UNIQUE` (`licensePlate`),
  UNIQUE KEY `idCar(Vehicle)_UNIQUE` (`idVehicleP`),
  KEY `fk_Car(Vehicle)_Location1_idx` (`idLocation`),
  KEY `fk_Car(Vehicle)_SocketTypes1_idx` (`idSocketTypes`),
  KEY `fk_Car(Vehicle)_CarStatus1_idx` (`idCarStatus`),
  KEY `fk_Car(Vehicle)_CarModel1_idx` (`idCarModel`),
  KEY `fk_Vehicle_Employees1_idx` (`idEmployee`),
  CONSTRAINT `fk_Car(Vehicle)_CarModel1` FOREIGN KEY (`idCarModel`) REFERENCES `CarModel` (`idcarmodel`),
  CONSTRAINT `fk_Car(Vehicle)_CarStatus1` FOREIGN KEY (`idCarStatus`) REFERENCES `CarStatus` (`idcarstatus`),
  CONSTRAINT `fk_Car(Vehicle)_Location1` FOREIGN KEY (`idLocation`) REFERENCES `Location` (`idlocation`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (1,1,1,3,1,0.98,'red','AN184U63',1),(2,2,1,3,2,1,'green','HU228Y16',1),(3,3,1,3,3,0.4,'blue','PK345N23',1),(4,4,2,3,4,0,'black','NA184U63',2),(5,5,2,3,5,0.9,'white','LV233K90',2),(6,6,3,3,6,0.78,'red','AA900K12',3),(7,7,3,3,7,0.34,'red','KK560X09',3),(8,7,4,3,1,0.23,'green','MM000M00',3),(9,8,4,3,2,0.7,'grey','BM289M00',5),(10,10,4,3,3,0.9,'red','AM007M00',5),(11,2,5,3,4,1,'black','KM100A07',5),(12,1,5,3,5,1,'red','BM777K00',5);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vending`
--

DROP TABLE IF EXISTS `Vending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Vending` (
  `Capacity` int(10) unsigned NOT NULL,
  `idVehicleP` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idVehicleP`),
  UNIQUE KEY `idVehicleP_UNIQUE` (`idVehicleP`),
  CONSTRAINT `fk_Vending_Vehicle1` FOREIGN KEY (`idVehicleP`) REFERENCES `Vehicle` (`idvehiclep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vending`
--

LOCK TABLES `Vending` WRITE;
/*!40000 ALTER TABLE `Vending` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vending_has_Product`
--

DROP TABLE IF EXISTS `Vending_has_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Vending_has_Product` (
  `Vending_Car(Vehicle)_LicencePlate` int(10) unsigned NOT NULL,
  `ProductList_idProduct` int(10) unsigned NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vending_Car(Vehicle)_LicencePlate`,`ProductList_idProduct`),
  KEY `fk_Vending_has_ProductList_ProductList1_idx` (`ProductList_idProduct`),
  KEY `fk_Vending_has_ProductList_Vending1_idx` (`Vending_Car(Vehicle)_LicencePlate`),
  CONSTRAINT `fk_Vending_has_ProductList_ProductList1` FOREIGN KEY (`ProductList_idProduct`) REFERENCES `ProductList` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vending_has_Product`
--

LOCK TABLES `Vending_has_Product` WRITE;
/*!40000 ALTER TABLE `Vending_has_Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vending_has_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workshop`
--

DROP TABLE IF EXISTS `Workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Workshop` (
  `TimingAvailibility` int(10) unsigned NOT NULL,
  `idWorkshop` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idWorkshop`),
  UNIQUE KEY `idWorkshop_UNIQUE` (`idWorkshop`),
  CONSTRAINT `fk_Workshop_Building` FOREIGN KEY (`idWorkshop`) REFERENCES `Building` (`idbuilding`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workshop`
--

LOCK TABLES `Workshop` WRITE;
/*!40000 ALTER TABLE `Workshop` DISABLE KEYS */;
INSERT INTO `Workshop` VALUES (1,5),(1,6),(1,7);
/*!40000 ALTER TABLE `Workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hours`
--

DROP TABLE IF EXISTS `hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hours` (
  `hour` int(11) NOT NULL,
  PRIMARY KEY (`hour`),
  UNIQUE KEY `hours_UNIQUE` (`hour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours`
--

LOCK TABLES `hours` WRITE;
/*!40000 ALTER TABLE `hours` DISABLE KEYS */;
INSERT INTO `hours` VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23);
/*!40000 ALTER TABLE `hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `procedure1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `procedure1`()
BEGIN SET @p := 2; WHILE @p<20 DO SET @p:=@p+1; END WHILE; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_1`(IN usename VARCHAR(45), IN indata VARCHAR(45), IN color VARCHAR(45), IN plate VARCHAR(5))
BEGIN
	SELECT 
		distinct Vehicle.LicensePlate, Vehicle.Color, Vehicle.idCarModel, Vehicle.idEmployee, Time(`Order`.StartTime) AS Time
	FROM
		Customer JOIN `Order` 
        ON 
			Customer.idCustomer =`Order`.idCustomer and `Order`.StartTime between indata and CONCAT(indata, ' ', '23:59:59') AND Customer.Username=username 
		JOIN Vehicle 
			ON `Order`.idVehicle = Vehicle.idVehicleP
	WHERE 
		Vehicle.Color = color AND SUBSTRING(Vehicle.LicensePlate, 1, 2) = plate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_10`(in startDate datetime, in endDate datetime)
BEGIN
    select idCarModel, round(sum(Price) / datediff(endDate, startDate),2) as AveDayPrice from 
		(select idCarModel, sum(Price) as Price
		from
			(
				select idVehicle, idCarModel, Cost as Price
				from (Vehicle as v 
						inner join  
							(select ch.idVehicle, cs.Cost 
							 from ChargingStation as cs  
									 inner join 
										(select * from ChargingHistory  where startDate <= StartTime and FinishTime <= endDate) as ch 
									 on ch.idChargingStation = cs.idChargingStation
							) as ps 
						on ps.idVehicle = v.idVehicleP)

			UNION
				
				select idVehicle, idCarModel, Price
				from (Vehicle as v 
						inner join  
							(select rh.idVehicle, dp.Price 
							 from ((select * from RepairingHistory where startDate <= StartTime and FinishTime <= endDate) as rh 
									 inner join 
											(select dt.idDetailsList, pt.Price
											from (DetailType as dt 
													inner join 
														(select idDetailsList, min(pd.Price)  as Price
														from Provider_has_DetailType as pd 
														group by idDetailsList) as pt
													on dt.idDetailsList = pt.idDetailsList)) as dp
									 on rh.idDetailsList = dp.idDetailsList)) as rhp
						on rhp.idVehicle = v.idVehicleP) 		
			) as res1
			group by idVehicle) as res
        group by idCarModel
	order by AveDayPrice DESC limit 1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_2`(in certain_date varchar(15))
BEGIN
	select hours.`hour`, ifnull(amount, 0)  as amount
	 from hours left join ( select hour(StartTime) as _hour, count(hour(StartTime)) as amount 
     from ChargingHistory
     where date(StartTime) = certain_date
     group by hour(StartTime)) buf on hours.`hour` = buf._hour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_3`(IN fist_day_of_the_week VARCHAR(45))
BEGIN
SELECT
	ifnull(RES.BusyCars, 0) AS BusyCars,
    RES.Time AS Time
    FROM
	(
		SELECT (
				SELECT 
					COUNT(*) AS BusyCars
				FROM
					(SELECT
					 #COUNT(*) * 100 DIV ((SELECT COUNT(*) FROM Vehicle) * 7) AS Count,
					 *,
					 'Morning' AS 'Time' 
					 FROM 
						`Order` 
					 WHERE 
							
						((HOUR(StartTime) between 7 and 10) OR (HOUR(FinishTime) between 7 and 10)) 
							AND
						((DATE(StartTime) between fist_day_of_the_week and DATE_ADD(fist_day_of_the_week, interval 7 day)) 
							OR 
						(DATE(FinishTime) between fist_day_of_the_week and  DATE_ADD(fist_day_of_the_week, interval 7 day)))
					 ) AS M
					GROUP BY M.Time
				)* 100 DIV ((SELECT COUNT(*) FROM Vehicle) * 7) AS BusyCars, 
			'Morning' AS 'Time'
			FROM Vehicle
			
		UNION

		SELECT (
				SELECT 
					COUNT(*) AS BusyCars
				FROM
					(SELECT
					 #COUNT(*) * 100 DIV ((SELECT COUNT(*) FROM Vehicle) * 7) AS Count,
					 *,
					 'Afternoon' AS 'Time' 
					 FROM 
						`Order` 
					 WHERE 
							
						((HOUR(StartTime) between 12 and 14) OR (HOUR(FinishTime) between 12 and 14)) 
							AND
						((DATE(StartTime) between fist_day_of_the_week and DATE_ADD(fist_day_of_the_week, interval 7 day)) 
							OR 
						(DATE(FinishTime) between fist_day_of_the_week and  DATE_ADD(fist_day_of_the_week, interval 7 day)))
					 ) AS M
					GROUP BY M.Time
				)* 100 DIV ((SELECT COUNT(*) FROM Vehicle) * 7) AS BusyCars, 
			'Afternoon' AS 'Time'
			FROM Vehicle
			
		UNION

		SELECT (
				SELECT 
					COUNT(*) AS BusyCars
				FROM
					(SELECT
					 #COUNT(*) * 100 DIV ((SELECT COUNT(*) FROM Vehicle) * 7) AS Count,
					 *,
					 'Evening' AS 'Time' 
					 FROM 
						`Order` 
					 WHERE 
							
						((HOUR(StartTime) between 17 and 19) OR (HOUR(FinishTime) between 17 and 19)) 
							AND
						((DATE(StartTime) between fist_day_of_the_week and DATE_ADD(fist_day_of_the_week, interval 7 day)) 
							OR 
						(DATE(FinishTime) between fist_day_of_the_week and  DATE_ADD(fist_day_of_the_week, interval 7 day)))
					 ) AS M
					GROUP BY M.Time
				)* 100 DIV ((SELECT COUNT(*) FROM Vehicle) * 7) AS BusyCars, 
			'Evening' AS 'Time'
			FROM Vehicle
	) AS RES;
		
	
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_4`(in usename VARCHAR(45), in certain_year varchar(10), in certain_month varchar(5))
BEGIN
  select username, date(StartTime) as day_of_doubled, idOrder as order_id from
        (select idOrder, StartTime, username, count(StartTime) as amount
        from `Order` inner join Customer on `Order`.idCustomer = Customer.idCustomer
        where year(StartTime) = certain_year and month(StartTime) = certain_month and usename = Customer.username
        group by StartTime) as buffer
        where amount > 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_5`(IN indata date)
BEGIN
SELECT round(avg(CarToClientDistance),2) as AveDistance_km,
            round(avg(hour(FinishTime)*60 + minute(FinishTime) + second(FinishTime)/60  - hour(StartTime) * 60 - minute(StartTime) - second(StartTime)/60), 2) AS AveTime_min
from `Order`
WHERE date(StartTime) = indata 

;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_6_destination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_6_destination`()
BEGIN
		SELECT *
        FROM (SELECT count(*) AS `Orders Amount`, concat(Country, '  ', City)  AS `Pickup Point`, 'Morning'  AS `Time`
                      FROM `Order` as o
                      JOIN Location as l ON  o.idTo = l.IdLocation
                      WHERE time(o.StartTime) >= time("07:00:00") AND time(o.StartTime) <= time("10:00:00")
                      GROUP BY o.idTo
                      ORDER BY `Orders Amount` DESC LIMIT 3) AS t1
        UNION
		SELECT *
        FROM (SELECT count(*) AS `Orders Amount`, concat(Country, '  ', City)  AS `Pickup Point`, 'Afternoon'  AS `Time`
                      FROM `Order` as o
                      JOIN Location as l ON  o.idTo = l.IdLocation
                      WHERE time(o.StartTime) >= time("12:00:00") AND time(o.StartTime) <= time("14:00:00")
                      GROUP BY o.idTo
                      ORDER BY `Orders Amount` DESC LIMIT 3) AS t2
        UNION
		SELECT *
        FROM (SELECT count(*) AS `Orders Amount`, concat(Country, '  ', City)  AS `Pickup Point`, 'Evening'  AS `Time`
                      FROM `Order` as o
                      JOIN Location as l ON  o.idTo = l.IdLocation
                      WHERE time(o.StartTime) >= time("17:00:00") AND time(o.StartTime) <= time("19:00:00")
                      GROUP BY o.idTo
                      ORDER BY `Orders Amount` DESC LIMIT 3) AS t3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_6_start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_6_start`()
BEGIN
		SELECT *
        FROM (SELECT count(*) AS `Orders Amount`, concat(Country, '  ', City)  AS `Pickup Point`, 'Morning'  AS `Time`
                      FROM `Order` as o
                      JOIN Location as l ON  o.idFrom = l.IdLocation
                      WHERE time(o.StartTime) >= time("07:00:00") AND time(o.StartTime) <= time("10:00:00")
                      GROUP BY o.idFrom
                      ORDER BY `Orders Amount` DESC LIMIT 3) AS t1
        UNION
		SELECT *
        FROM (SELECT count(*) AS `Orders Amount`, concat(Country, '  ', City)  AS `Pickup Point`, 'Afternoon'  AS `Time`
                      FROM `Order` as o
                      JOIN Location as l ON  o.idFrom = l.IdLocation
                      WHERE time(o.StartTime) >= time("12:00:00") AND time(o.StartTime) <= time("14:00:00")
                      GROUP BY o.idFrom
                      ORDER BY `Orders Amount` DESC LIMIT 3) AS t2
        UNION
		SELECT *
        FROM (SELECT count(*) AS `Orders Amount`, concat(Country, '  ', City)  AS `Pickup Point`, 'Evening'  AS `Time`
                      FROM `Order` as o
                      JOIN Location as l ON  o.idFrom = l.IdLocation
                      WHERE time(o.StartTime) >= time("17:00:00") AND time(o.StartTime) <= time("19:00:00")
                      GROUP BY o.idFrom
                      ORDER BY `Orders Amount` DESC LIMIT 3) AS t3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_7`()
BEGIN
	DECLARE count INT default 0;
    SET count = (SELECT COUNT(*) FROM Vehicle);
    SET count = count * 10 DIV 100;
	SELECT * FROM 
	(SELECT Vehicle.licensePlate, COUNT(*) AS Orders
	FROM `Order` JOIN Vehicle ON `Order`.idVehicle = Vehicle.idVehicleP
    WHERE `Order`.StartTime >= MONTH(DATE_SUB(NOW(), INTERVAL 3 MONTH))
    group by Vehicle.licensePlate) AS A
	ORDER BY A.Orders limit count;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_8`(in startDate date)
BEGIN
		
        declare endDate date;
        set endDate = date_add(startDate, interval 1 month);
        
		select idCustomer as UserID, sum(amount) as Amount from 
				(
                 select idCustomer, max(amount) as amount ,v1 as idVechicle, st1 as StartTime from
						(  select idVehicle as v1, date(StartTime) as st1, count(*) as amount 
							from ChargingHistory 
							where date(startDate) <= date(StartTime)  and date(StartTime) <= date(endDate)
							group by idVehicle, date(startTime)
						) as buffer		
						inner join 
						(	select  idVehicle as v2, idCustomer, date(StartTime) as st2
							from `Order` 
							where  date(startDate) <= date(StartTime)  and date(StartTime) <= date(endDate)
						) as ob
						on buffer.v1 = ob.v2 and buffer.st1 = ob.st2
				 group by idVechicle
				) as res
		group by idCustomer;
        
        
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_query_9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `select_query_9`(in weeks int)
BEGIN
	declare startDate datetime;
    declare endDate datetime;
    
    set startDate = date_sub(now(), interval weeks week);
    set endDate = now();
    
    select idWorkShop, (select Name from DetailType as dt where dt.idDetailsList = res2.idDetailsList) as `Name`,ceil((max(AveAmount))) as AdvicedAmount 
    from
		(select *, (count(*) / weeks ) as AveAmount from
			(select idWorkshop, idDetailsList
			from RepairingHistory as rh where startDate <= rh.StartTime and rh.FinishTime <= endDate
			order by idWorkShop desc, idDetailsList desc
			) as res1 
		group by idWorkshop, idDetailsList) as res2

	group by idWorkShop;
	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`katya`@`%` PROCEDURE `test`(in certain_date varchar(15))
BEGIN
	select hours.`hour`, ifnull(amount, 0)  as amount
	 from hours left join ( select hour(StartTime) as _hour, count(hour(StartTime)) as amount 
     from ChargingHistory
     where date(StartTime) = certain_date
     group by hour(StartTime)) buf on hours.`hour` = buf._hour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 23:31:57
