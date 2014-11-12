CREATE DATABASE  IF NOT EXISTS `orgChart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `orgChart`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: orgChart
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `LocationLogs`
--

DROP TABLE IF EXISTS `LocationLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LocationLogs` (
  `locationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `CITY` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `CURRENT_ID` datetime DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LocationLogs`
--

LOCK TABLES `LocationLogs` WRITE;
/*!40000 ALTER TABLE `LocationLogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `LocationLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OfficeAddress`
--

DROP TABLE IF EXISTS `OfficeAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OfficeAddress` (
  `OFFICE_ADDRES_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS_LINE_1` varchar(255) DEFAULT NULL,
  `ADDRESS_LINE_2` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `OFFICE_CONTACT_NO` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `ZIP_CODE` varchar(255) DEFAULT NULL,
  `OFFICE_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OFFICE_ADDRES_ID`),
  UNIQUE KEY `OFFICE_NAME_UNIQUE` (`OFFICE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OfficeAddress`
--

LOCK TABLES `OfficeAddress` WRITE;
/*!40000 ALTER TABLE `OfficeAddress` DISABLE KEYS */;
INSERT INTO `OfficeAddress` VALUES (1,'Wellesley, MA (HQ)','16 Laurel Ave, Wellesley Hills','Wellesley Hills','United States',42.308626,-71.276275,'(781) 591-4800','Massachusetts','02481','Mobiquity Wellesley'),(2,'Ahmedabad, India','Prahlad Nagar','Ahmedabad','India',23.015218,72.504521,'079-67821489124','Gujarat','380015','Mobiquity Ahmedabad'),(4,'Waltham, MA','Waltham','Waltham','United States',42.308416,-71.276269,'(781) 642-7142','Massachusetts','02451-02454','Mobiquity Waltham'),(5,'Gainesville, FL','USA','Gainesville','USA',42.308376,-71.27628,'555-2712-421487','Florida','793214','Mobiquity Gainesville'),(6,'Atlanta, GA',NULL,NULL,NULL,33.929726,-84.338343,NULL,NULL,NULL,'Mobiquity Atlanta'),(7,'The Hague, The Netherlands',NULL,NULL,NULL,52.33606,4.886909,NULL,NULL,NULL,'Mobiquity The Hague'),(8,'Dallas, Texas',NULL,NULL,NULL,32.832146,-96.69957,NULL,NULL,NULL,'Mobiquity Dallas'),(9,'New York, NY',NULL,NULL,NULL,40.7499006,-73.9944146,NULL,NULL,NULL,'Mobiquity New York'),(10,'Philadelphia, PN',NULL,NULL,NULL,40.045282,-75.388177,NULL,NULL,NULL,'Mobiquity Philadelphia'),(11,'Providence, RI',NULL,NULL,NULL,41.823321,-71.413426,NULL,NULL,NULL,'Mobiquity Providence'),(12,'San Francisco, CA',NULL,NULL,NULL,37.7969563,-122.4002903,NULL,NULL,NULL,'Mobiquity San Francisco'),(13,'San Jose, Costa Rica',NULL,NULL,NULL,9.913668,-84.039017,NULL,NULL,NULL,'Mobiquity San Jose');
/*!40000 ALTER TABLE `OfficeAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Title`
--

DROP TABLE IF EXISTS `Title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Title` (
  `TITL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TITL_ID`),
  UNIQUE KEY `TITLE_NAME_UNIQUE` (`TITLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Title`
--

LOCK TABLES `Title` WRITE;
/*!40000 ALTER TABLE `Title` DISABLE KEYS */;
INSERT INTO `Title` VALUES (2,'Android Developer'),(3,'CEO'),(4,'Chief Architect'),(5,'Creative Director'),(6,'Director'),(7,'General Manager'),(8,'HR Exec'),(9,'Interaction Design Consultant'),(10,'iOS Developer'),(11,'Java Developer'),(12,'Manager'),(13,'Project Manager'),(14,'QA Engineer'),(15,'Sales Exec'),(16,'System Architect'),(17,'UX Architect'),(18,'Vice President'),(19,'Web Developer');
/*!40000 ALTER TABLE `Title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTACT_NO` varchar(255) DEFAULT NULL,
  `EMAIL_ID` varchar(255) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `HOBBIES` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_RESOURCE_MANAGER` tinyint(1) DEFAULT NULL,
  `JOB_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFICE_CONTACT_NO` varchar(255) DEFAULT NULL,
  `RESOURCE_MANAGER_ID` bigint(20) DEFAULT NULL,
  `USER_PICTURE` varchar(255) DEFAULT NULL,
  `OFFICE_ADDRESS_ID` bigint(20) DEFAULT NULL,
  `TITLE_ID` bigint(20) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK285FEBF31E833A` (`TITLE_ID`),
  KEY `FK285FEB7494A4C1` (`OFFICE_ADDRESS_ID`),
  CONSTRAINT `FK285FEB7494A4C1` FOREIGN KEY (`OFFICE_ADDRESS_ID`) REFERENCES `OfficeAddress` (`OFFICE_ADDRES_ID`),
  CONSTRAINT `FK285FEBF31E833A` FOREIGN KEY (`TITLE_ID`) REFERENCES `Title` (`TITL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'98989898989','bseibel@mobiquityinc.com','Bill Seibel','Reading,Music',1,1,'CEO',NULL,1,NULL,1,3,42.308626,-71.276275),(2,'2637483920','anorman@mobiquityinc.com','Andy Norman','Reading,Music',1,1,'Project Manager',NULL,1,NULL,2,13,42.308416,-71.276269),(3,'3674829105','cberry@mobiquityinc.com','Cyd Berry','Reading,Music',1,1,'Dveloper',NULL,2,NULL,2,12,42.308423,-71.276269),(4,'8949475930','dcohen@mobiquityinc.com','Daniel Cohen','Reading,Music',1,1,'Manager',NULL,3,NULL,2,7,42.308376,-71.27628),(6,'5263728394','aabbas@mobiquityinc.com','Abbas Ali','Reading,Music',1,1,NULL,NULL,2,NULL,2,12,52.336214,4.886872),(7,'5273892637','vcleversey@mobiquityinc.com','Vangie Cleversey','Reading,Music',1,1,NULL,NULL,2,NULL,2,12,42.30844,-71.276269),(8,'36274859373','agabrault@mobiquityinc.com','Adam Gabrault','Reading,Music',1,1,NULL,NULL,3,NULL,2,13,42.308416,-71.276269),(9,'3546530823','ocarounanidy@mobiquityinc.com','Oudaya Carounanidy','Reading,Music',1,1,NULL,NULL,3,NULL,2,6,37.7969563,-122.4002903),(10,'3527483927','ecarmichael@mobiquityinc.com','Elise Carmichael','Reading,Music',1,1,NULL,NULL,4,NULL,2,5,42.30838,-71.27628),(11,'3536473829','dstanton@mobiquityinc.com','Dave Stanton','Reading,Music',1,1,NULL,NULL,4,NULL,2,4,42.308376,-71.27628),(12,'45362748397','rbonner@mobiquityinc.com','Rob Bonner','Reading,Music',1,1,NULL,NULL,4,NULL,2,5,42.308378,-71.27628),(13,'64738385849','vpai@mobiquityinc.com','Venks Pai','Reading,Music',1,1,NULL,NULL,9,NULL,2,10,23.0142325,72.5047459),(14,'3839264739','rgabrielli@mobiquityinc.com','Robin Gabrielli','Reading,Music',1,1,NULL,NULL,4,NULL,2,8,42.308416,-71.276269),(15,'3839483028','bwalker@mobiquityinc.com','Ben Walker','Reading,Music',1,1,NULL,NULL,9,NULL,2,6,33.929726,-84.338343),(16,'2838473939','trollin@mobiquityinc.com','Ty Rollin','Reading,Music',1,1,NULL,NULL,1,NULL,2,4,42.308632,-71.276275),(20,'9428585505','bdesai@mobiquityinc.com','Bijal Desai','',1,0,'','',6,'https://lh6.googleusercontent.com/-sqqUVprN1cM/AAAAAAAAAAI/AAAAAAAAABM/EJORmCHTyQA/photo.jpg',2,11,23.014251299999998,72.5047885),(21,'9725094398','rnair@mobiquityinc.com','Ravi Nair','',1,0,'','9725094398',6,'https://lh3.googleusercontent.com/-HcAfsX9u8Cc/AAAAAAAAAAI/AAAAAAAAABE/5FDsvIfr4Co/photo.jpg',2,11,23.0142737,72.5046986),(22,'9033103450','ubhavsar1@mobiquityinc.com','Utkarsh Bhavsar','',0,0,'','89797984798',6,NULL,2,11,23.014201099999998,72.5047434),(23,'9429843885','nkhandelwal@mobiquityinc.com','Nehal Khandelwal','reading',1,0,'','9876543213',13,'https://lh3.googleusercontent.com/-yGDJXW1lvk4/AAAAAAAAAAI/AAAAAAAAAAw/yhMcqcaQXPM/photo.jpg',2,11,23.0142258,72.5047202),(24,'9878231627','apandey@mobiquityinc.com','Abhinav Pandey','',1,0,'','12345677880',6,'https://lh5.googleusercontent.com/-mydSsmwGHQg/AAAAAAAAAAI/AAAAAAAAABQ/a_M4tq9H3zA/photo.jpg',2,11,23.0142567,72.5047587),(30,'9033103450','ubhavsar@mobiquityinc.com','Utkarsh Bhavsar','',1,0,'','',6,'https://lh4.googleusercontent.com/-2-JPMAQH1S8/AAAAAAAAAAI/AAAAAAAAAAs/U_Ak7gHvf2Q/photo.jpg',5,11,NULL,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-12 10:25:53
