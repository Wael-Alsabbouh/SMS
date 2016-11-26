-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbhyf
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `tableclasses`
--

DROP TABLE IF EXISTS `tableclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tableclasses` (
  `classId` smallint(6) NOT NULL AUTO_INCREMENT,
  `className` varchar(30) NOT NULL,
  `classStartDate` date DEFAULT NULL,
  `classEndDate` date DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableclasses`
--

LOCK TABLES `tableclasses` WRITE;
/*!40000 ALTER TABLE `tableclasses` DISABLE KEYS */;
INSERT INTO `tableclasses` VALUES (1,'HYF',NULL,NULL),(2,'Class 1',NULL,NULL),(3,'Class 2',NULL,NULL),(4,'Class 4',NULL,NULL),(5,'Class 5',NULL,NULL);
/*!40000 ALTER TABLE `tableclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablelessondetails`
--

DROP TABLE IF EXISTS `tablelessondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablelessondetails` (
  `lessonDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `lessonId` int(11) DEFAULT NULL,
  `lessonStudentId` int(11) DEFAULT NULL,
  `lessonAttended` tinyint(1) DEFAULT NULL,
  `lessonAssignment` varchar(100) DEFAULT NULL,
  `lessonFeedback` text,
  PRIMARY KEY (`lessonDetailsId`),
  KEY `lessonId` (`lessonId`,`lessonStudentId`),
  KEY `lessonStudentId` (`lessonStudentId`),
  CONSTRAINT `tablelessondetails_ibfk_1` FOREIGN KEY (`lessonId`) REFERENCES `tablelessons` (`lessonId`),
  CONSTRAINT `tablelessondetails_ibfk_2` FOREIGN KEY (`lessonStudentId`) REFERENCES `tableusers` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablelessondetails`
--

LOCK TABLES `tablelessondetails` WRITE;
/*!40000 ALTER TABLE `tablelessondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablelessondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablelessons`
--

DROP TABLE IF EXISTS `tablelessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablelessons` (
  `lessonId` int(11) NOT NULL AUTO_INCREMENT,
  `lessonDate` date NOT NULL,
  `lessonClass` varchar(30) NOT NULL,
  `lessonLocation` varchar(30) DEFAULT NULL,
  `lessonModule` smallint(6) NOT NULL,
  `lessonMentor1` smallint(6) NOT NULL,
  `lessonMentor2` smallint(6) DEFAULT NULL,
  `lessonMentor3` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`lessonId`),
  KEY `lessonModule` (`lessonModule`),
  CONSTRAINT `tablelessons_ibfk_1` FOREIGN KEY (`lessonModule`) REFERENCES `tablemodules` (`moduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablelessons`
--

LOCK TABLES `tablelessons` WRITE;
/*!40000 ALTER TABLE `tablelessons` DISABLE KEYS */;
INSERT INTO `tablelessons` VALUES (1,'2016-11-20','5','de waag',1,4,NULL,NULL);
/*!40000 ALTER TABLE `tablelessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablemodules`
--

DROP TABLE IF EXISTS `tablemodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablemodules` (
  `moduleId` smallint(6) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(30) NOT NULL,
  `moduleMentor1` smallint(6) DEFAULT NULL,
  `moduleMentor2` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablemodules`
--

LOCK TABLES `tablemodules` WRITE;
/*!40000 ALTER TABLE `tablemodules` DISABLE KEYS */;
INSERT INTO `tablemodules` VALUES (1,'HTML',3,NULL),(2,'CSS',5,NULL);
/*!40000 ALTER TABLE `tablemodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tableroles`
--

DROP TABLE IF EXISTS `tableroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tableroles` (
  `roleId` tinyint(4) NOT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableroles`
--

LOCK TABLES `tableroles` WRITE;
/*!40000 ALTER TABLE `tableroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tableroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tableuserroles`
--

DROP TABLE IF EXISTS `tableuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tableuserroles` (
  `roleId` tinyint(4) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tableuserroles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `tableroles` (`roleId`),
  CONSTRAINT `tableuserroles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `tableusers` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableuserroles`
--

LOCK TABLES `tableuserroles` WRITE;
/*!40000 ALTER TABLE `tableuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tableuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tableusers`
--

DROP TABLE IF EXISTS `tableusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tableusers` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userFirstName` varchar(30) NOT NULL,
  `userLastName` varchar(30) DEFAULT NULL,
  `userAddress` varchar(30) DEFAULT NULL,
  `userRegisterDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `userEmail` varchar(30) NOT NULL,
  `userMobile` varchar(30) DEFAULT NULL,
  `userStatus` tinyint(1) DEFAULT NULL,
  `userRole` varchar(30) NOT NULL,
  `userClass` smallint(6) DEFAULT NULL,
  `userPhoto` longblob,
  `userPassword` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `userClass` (`userClass`),
  KEY `userStatus` (`userStatus`),
  CONSTRAINT `tableusers_ibfk_1` FOREIGN KEY (`userClass`) REFERENCES `tableclasses` (`classId`),
  CONSTRAINT `tableusers_ibfk_2` FOREIGN KEY (`userStatus`) REFERENCES `tableuserstatus` (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableusers`
--

LOCK TABLES `tableusers` WRITE;
/*!40000 ALTER TABLE `tableusers` DISABLE KEYS */;
INSERT INTO `tableusers` VALUES (1,'Yonas','BW','Rot','2016-11-09 00:00:00','yoni11er@gmail.com','0682379012',1,'Student',4,NULL,'123'),(2,'Wael','HS','Mas','2016-11-05 00:00:00','wael@gmail.com','0682546671',1,'Student',5,NULL,'jahsiua'),(3,'Maartje','m','Ams','2016-11-06 00:00:00','maartje@yahoo.com','068772110',1,'Admin',1,NULL,'12377hfhf'),(4,'Daan','updatedUser','Ams','2016-11-08 00:00:00','daanarts@gmail.com','0689922616',1,'Mentor',1,NULL,'jd12344'),(5,'Samuel','T','Asmara',NULL,'hjdhkjl@yahoo.com','00098278023',1,'regular',2,NULL,'jsdhkal'),(6,'Henok','F','Massawa','2016-11-19 00:00:00','jhsk@kjhs.com','9924991',1,'3',4,NULL,'sdajhhkiu'),(7,'Kib','aha','Sto','2016-11-19 14:53:21','adjjk@gmail.com','910990324',2,'3',2,NULL,'khadah');
/*!40000 ALTER TABLE `tableusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tableuserstatus`
--

DROP TABLE IF EXISTS `tableuserstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tableuserstatus` (
  `statusId` tinyint(4) NOT NULL,
  `statusName` varchar(30) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableuserstatus`
--

LOCK TABLES `tableuserstatus` WRITE;
/*!40000 ALTER TABLE `tableuserstatus` DISABLE KEYS */;
INSERT INTO `tableuserstatus` VALUES (1,'Active'),(2,'Graduated'),(3,'Internship'),(4,'Working'),(5,'Quit');
/*!40000 ALTER TABLE `tableuserstatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21 21:18:33
