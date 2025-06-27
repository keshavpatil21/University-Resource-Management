-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gm_university_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DEP_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`DEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'PHYSICS'),(2,'MATHEMATICS'),(3,'CSE');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `FACULTY_ID` varchar(10) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESIGNATION` varchar(50) NOT NULL,
  `DEP_ID` int(11) NOT NULL,
  PRIMARY KEY (`FACULTY_ID`),
  KEY `DEP_ID` (`DEP_ID`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`DEP_ID`) REFERENCES `department` (`DEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('F001','Raghu S','Professor',2),('F002','Chanabasva','Professor',1),('F003','Dr.Shastri','Professor',3),('F004','Usha T M','Professor',3),('F005','Dr.Arunkumar','Professor',3),('F006','Dr.Shivanagowda','Professor',3),('F007','Priyanka B R','Professor',1),('F008','Shreyanka M N','Professor',3),('F009','Gaurav P R','Professor',3),('F010','Nayana M R','Professor',3),('F011','Saima Anjum','Professor',3),('F012','Priyanka S M','Professor',3),('F013','Maruthi S T','Professor',3),('F014','Ravinadan','Professor',3),('F015','Shalini M R','Professor',3),('F016','Kavya R','Professor',2),('F017','Dr.Vijay','Professor',1),('F018','Kavya B M','Professor',3),('F019','Ranjitha D S','Professor',3),('F020','Kumar S','Professor',3),('F021','Dr.Anand B C','Professor',1),('F022','Channaveeraswamy','Professor',3),('F023','Nandhita G','Professor',3),('F024','Mahesh R','Professor',2),('F025','Dr.Swaroop','Professor',1),('F026','Sumana','Professor',3);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `RESOURCE_ID` varchar(10) NOT NULL DEFAULT '',
  `TYPE` varchar(50) NOT NULL,
  `CAPACITY` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES ('CL010','Physics Lab',30,'GROUND FLOOR'),('CL011','DSA Lab',30,'FIRST FLOOR'),('CL012','FDBMS Lab',30,'THIRD FLOOR'),('CR010','Classroom',60,'GROUND FLOOR'),('CR011','Classroom',60,'GROUND FLOOR'),('CR012','Classroom',60,'GROUND FLOOR'),('CR013','Classroom',60,'GROUND FLOOR'),('CR014','Classroom',60,'GROUND FLOOR'),('CR015','Classroom',60,'GROUND FLOOR'),('CSH010','Seminar Hall',100,'FIRST FLOOR'),('CSH011','Seminar Hall',80,'FIRST FLOOR'),('CSH012','Seminar Hall',150,'FIRST FLOOR');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `TIMETABLE_ID` int(11) NOT NULL,
  `WEEKDAY` varchar(10) NOT NULL,
  `TIME_SLOT` varchar(20) NOT NULL,
  `SECTION` varchar(10) NOT NULL,
  `ACADEMIC_YEAR` varchar(20) NOT NULL,
  `SEMESTER` int(11) NOT NULL,
  `SUBJECT_NAME` varchar(100) NOT NULL,
  `SUBJECT_CODE` varchar(20) NOT NULL,
  `FACULTY_ID` varchar(10) DEFAULT NULL,
  `RESOURCE_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TIMETABLE_ID`),
  KEY `FACULTY_ID` (`FACULTY_ID`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`FACULTY_ID`) REFERENCES `faculty` (`FACULTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'Monday','HR1','A','2024-2025',2,'FCN','U24CS1205','F005','CR010'),(2,'Monday','HR2','A','2024-2025',2,'APCSE','U24CS1202','F002','CR010'),(3,'Monday','HR3','A','2024-2025',2,'DSA','U24CS1203','F003','CR010'),(4,'Monday','HR4','A','2024-2025',2,'DSA','U24CS1203','F003','CR010'),(5,'Monday','HR5','A','2024-2025',2,'FDBMS','U24CS1206','F006','CR010'),(6,'Monday','HR6','A','2024-2025',2,'DSA','U24CS1203','F003','CR010'),(7,'Tuesday','HR1','A','2024-2025',2,'APCSE','U24CS1202','F002','CR010'),(8,'Tuesday','HR2','A','2024-2025',2,'FCN','U24CS1205','F005','CR010'),(9,'Tuesday','HR3','A','2024-2025',2,'PP','U24CS1204','F004','CR010'),(10,'Tuesday','HR4','A','2024-2025',2,'DSA','U24CS1213','F003','CR010'),(11,'Tuesday','HR5','A','2024-2025',2,'AMCS','U24CS1201','F001','CR010'),(12,'Tuesday','HR6','A','2024-2025',2,'APCSE','U24CS1202','F002','CR010'),(13,'Wednesday','HR1','A','2024-2025',2,'DSA','U24CS1203','F003','CR010'),(14,'Wednesday','HR2','A','2024-2025',2,'APCSE','U24CS1202','F002','CR010'),(15,'Wednesday','HR3','A','2024-2025',2,'FCN','U24CS1205','F005','CR010'),(16,'Wednesday','HR4','A','2024-2025',2,'AMCS','U24CS1201','F001','CR010'),(17,'Wednesday','HR5','A','2024-2025',2,'PP','U24CS1204','F004','CR010'),(18,'Wednesday','HR6','A','2024-2025',2,'FDBMS','U24CS1206','F006','CR010'),(19,'Thursday','HR1','A','2024-2025',2,'FDBMS','U24CS1206','F006','CR010'),(20,'Thursday','HR2','A','2024-2025',2,'PP','U24CS1204','F004','CR010'),(21,'Thursday','HR3','A','2024-2025',2,'AMCS','U24CS1201','F001','CR010'),(22,'Thursday','HR4','A','2024-2025',2,'FCN','U24CS1205','F005','CR010'),(23,'Friday','HR1','A','2024-2025',2,'PP','U24CS1204','F004','CR010'),(24,'Friday','HR2','A','2024-2025',2,'FDBMS','U24CS1206','F006','CR010'),(25,'Friday','HR3','A','2024-2025',2,'APCSE','U24CS1202','F002','CR010'),(26,'Friday','HR4','A','2024-2025',2,'AMCS','U24CS1201','F001','CR010'),(27,'Saturday','HR1','A','2024-2025',2,'APCSE','U24CS1204','F004','CR010'),(28,'Saturday','HR2','A','2024-2025',2,'AMCS','U24CS1204','F004','CR010'),(29,'Saturday','HR3','A','2024-2025',2,'DSA','U24CS1203','F003','CR010'),(30,'Saturday','HR4','A','2024-2025',2,'FDBMS','U24CS1206','F006','CR010'),(31,'Monday','HR1','B','2024-2025',2,'FDBMS','U24CS1206','F011','CR011'),(32,'Monday','HR2','B','2024-2025',2,'DSA','U24CS1203','F008','CR011'),(33,'Monday','HR3','B','2024-2025',2,'PP','U24CS1204','F009','CR011'),(34,'Monday','HR4','B','2024-2025',2,'APCSE','U24CS1202','F007','CR011'),(35,'Monday','HR5','B','2024-2025',2,'AMCS','U24CS1201','F001','CR011'),(36,'Monday','HR6','B','2024-2025',2,'FCN','U24CS1205','F010','CR011'),(37,'Tuesday','HR1','B','2024-2025',2,'APCSE','U24CS1202','F007','CR011'),(38,'Tuesday','HR2','B','2024-2025',2,'FDBMS','U24CS1206','F010','CR011'),(39,'Tuesday','HR3','B','2024-2025',2,'AMCS','U24CS1201','F001','CR011'),(40,'Tuesday','HR4','B','2024-2025',2,'FCN','U24CS1205','F010','CR011'),(41,'Tuesday','HR5','B','2024-2025',2,'FDBMS','U24CS1206','F011','CR011'),(42,'Tuesday','HR6','B','2024-2025',2,'FDBMS','U24CS1206','F011','CR011'),(43,'Wednesday','HR1','B','2024-2025',2,'PP','U24CS1204','F009','CR011'),(44,'Wednesday','HR2','B','2024-2025',2,'PP','U24CS1204','F009','CR011'),(45,'Wednesday','HR3','B','2024-2025',2,'FCN','U24CS1205','F010','CR011'),(46,'Wednesday','HR4','B','2024-2025',2,'DSA','U24CS1203','F008','CR011'),(47,'Wednesday','HR5','B','2024-2025',2,'FDBMS','U24CS1206','F011','CR011'),(48,'Wednesday','HR6','B','2024-2025',2,'PP','U24CS1204','F009','CR011'),(49,'Thursday','HR1','B','2024-2025',2,'FCN','U24CS1205','F010','CR011'),(50,'Thursday','HR2','B','2024-2025',2,'APCSE','U24CS1202','F007','CR011'),(51,'Thursday','HR3','B','2024-2025',2,'PP','U24CS1204','F009','CR011'),(52,'Thursday','HR4','B','2024-2025',2,'DSA','U24CS1203','F008','CR011'),(53,'Friday','HR1','B','2024-2025',2,'DSA','U24CS1203','F008','CR011'),(54,'Friday','HR2','B','2024-2025',2,'AMCS','U24CS1201','F001','CR011'),(55,'Friday','HR3','B','2024-2025',2,'PP','U24CS1204','F009','CR011'),(56,'Friday','HR4','B','2024-2025',2,'APCSE','U24CS1202','F007','CR011'),(57,'Saturday','HR1','B','2024-2025',2,'DSA','U24CS1203','F008','CR011'),(58,'Saturday','HR2','B','2024-2025',2,'DSA','U24CS1203','F008','CR011'),(59,'Saturday','HR3','B','2024-2025',2,'FDBMS','U24CS1206','F011','CR011'),(60,'Saturday','HR4','B','2024-2025',2,'APCSE','U24CS1202','F007','CR011'),(61,'Monday','HR1','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(62,'Monday','HR2','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(63,'Monday','HR3','C','2024-2025',2,'FCN','U24CS1205','F014','CR012'),(64,'Monday','HR4','C','2024-2025',2,'AMCS','U24CS1201','F001','CR012'),(65,'Monday','HR5','C','2024-2025',2,'FDBMS','U24CS1206','F015','CR012'),(66,'Monday','HR6','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(67,'Tuesday','HR1','C','2024-2025',2,'FCN','U24CS1205','F014','CR012'),(68,'Tuesday','HR2','C','2024-2025',2,'FDBMS','U24CS1206','F015','CR012'),(69,'Tuesday','HR3','C','2024-2025',2,'PP','U24CS1204','F013','CR012'),(70,'Tuesday','HR4','C','2024-2025',2,'PP','U24CS1204','F013','CR012'),(71,'Tuesday','HR5','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(72,'Tuesday','HR6','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(73,'Wednesday','HR1','C','2024-2025',2,'AMCS','U24CS1201','F001','CR012'),(74,'Wednesday','HR2','C','2024-2025',2,'PP','U24CS1204','F013','CR012'),(75,'Wednesday','HR3','C','2024-2025',2,'DSA','U24CS1203','F012','CR012'),(76,'Wednesday','HR4','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(77,'Wednesday','HR5','C','2024-2025',2,'PP','U24CS1204','F013','CR012'),(78,'Wednesday','HR6','C','2024-2025',2,'FDBMS','U24CS1206','F015','CR012'),(79,'Thursday','HR1','C','2024-2025',2,'AMCS','U24CS1201','F001','CR012'),(80,'Thursday','HR2','C','2024-2025',2,'DSA','U24CS1203','F012','CR012'),(81,'Thursday','HR3','C','2024-2025',2,'FDBMS','U24CS1206','F015','CR012'),(82,'Thursday','HR4','C','2024-2025',2,'FDBMS','U24CS1206','F015','CR012'),(83,'Thursday','HR5','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(84,'Thursday','HR6','C','2024-2025',2,'FCN','U24CS1205','F014','CR012'),(85,'Friday','HR1','C','2024-2025',2,'FCN','U24CS1205','F014','CR012'),(86,'Friday','HR2','C','2024-2025',2,'APCSE','U24CS1202','F007','CR012'),(87,'Friday','HR3','C','2024-2025',2,'PP','U24CS1204','F013','CR012'),(88,'Friday','HR4','C','2024-2025',2,'DSA','U24CS1203','F012','CR012'),(89,'Saturday','HR1','C','2024-2025',2,'FDBMS','U24CS1206','F015','CR012'),(90,'Saturday','HR2','C','2024-2025',2,'DSA','U24CS1203','F012','CR012'),(91,'Saturday','HR3','C','2024-2025',2,'AMCS','U24CS1201','F001','CR012'),(92,'Saturday','HR4','C','2024-2025',2,'PP','U24CS1204','F013','CR012'),(93,'Monday','HR1','D','2024-2025',2,'FDBMS','U24CS1206','F020','CR013'),(94,'Monday','HR2','D','2024-2025',2,'FDBMS','U24CS1206','F020','CR013'),(95,'Monday','HR3','D','2024-2025',2,'AMCS','U24CS1201','F016','CR013'),(96,'Monday','HR4','D','2024-2025',2,'PP','U24CS1204','F004','CR013'),(97,'Monday','HR5','D','2024-2025',2,'FCN','U24CS1205','F019','CR013'),(98,'Monday','HR6','D','2024-2025',2,'APCSE','U24CS1202','F017','CR013'),(99,'Tuesday','HR1','D','2024-2025',2,'PP','U24CS1204','F004','CR013'),(100,'Tuesday','HR2','D','2024-2025',2,'FCN','U24CS1205','F019','CR013'),(101,'Tuesday','HR3','D','2024-2025',2,'FDBMS','U24CS1206','F020','CR013'),(102,'Tuesday','HR4','D','2024-2025',2,'AMCS','U24CS1201','F016','CR013'),(103,'Tuesday','HR5','D','2024-2025',2,'APCSE','U24CS1202','F017','CR013'),(104,'Tuesday','HR6','D','2024-2025',2,'DSA','U24CS1203','F018','CR013'),(105,'Wednesday','HR1','D','2024-2025',2,'DSA','U24CS1203','F018','CR013'),(106,'Wednesday','HR2','D','2024-2025',2,'DSA','U24CS1203','F018','CR013'),(107,'Wednesday','HR3','D','2024-2025',2,'PP','U24CS1204','F004','CR013'),(108,'Wednesday','HR4','D','2024-2025',2,'DSA','U24CS1203','F018','CR013'),(109,'Wednesday','HR5','D','2024-2025',2,'APCSE','U24CS1202','F017','CR013'),(110,'Wednesday','HR6','D','2024-2025',2,'APCSE','U24CS1202','F017','CR013'),(111,'Thursday','HR1','D','2024-2025',2,'FCN','U24CS1205','F019','CR013'),(112,'Thursday','HR2','D','2024-2025',2,'DSA','U24CS1203','F018','CR013'),(113,'Thursday','HR3','D','2024-2025',2,'FDBMS','U24CS1206','F020','CR013'),(114,'Thursday','HR4','D','2024-2025',2,'APCSE','U24CS1202','F017','CR013'),(115,'Friday','HR1','D','2024-2025',2,'DSA','U24CS1203','F018','CR013'),(116,'Friday','HR2','D','2024-2025',2,'AMCS','U24CS1201','F016','CR013'),(117,'Friday','HR3','D','2024-2025',2,'FCN','U24CS1205','F019','CR013'),(118,'Friday','HR4','D','2024-2025',2,'PP','U24CS1204','F004','CR013'),(119,'Saturday','HR1','D','2024-2025',2,'AMCS','U24CS1201','F016','CR013'),(120,'Saturday','HR2','D','2024-2025',2,'FDBMS','U24CS1206','F020','CR013'),(121,'Saturday','HR3','D','2024-2025',2,'PP','U24CS1204','F004','CR013'),(122,'Saturday','HR4','D','2024-2025',2,'PP','U24CS1204','F004','CR013'),(123,'Monday','HR1','E','2024-2025',2,'FDBMS','U24CS1206','F023','CR014'),(124,'Monday','HR2','E','2024-2025',2,'AMCS','U24CS1201','F016','CR014'),(125,'Monday','HR3','E','2024-2025',2,'PP','U24CS1204','F022','CR014'),(126,'Monday','HR4','E','2024-2025',2,'APCSE','U24CS1202','F021','CR014'),(127,'Monday','HR5','E','2024-2025',2,'FCN','U24CS1205','F014','CR014'),(128,'Monday','HR6','E','2024-2025',2,'APCSE','U24CS1202','F021','CR014'),(129,'Tuesday','HR1','E','2024-2025',2,'FDBMS','U24CS1206','F023','CR014'),(130,'Tuesday','HR2','E','2024-2025',2,'FDBMS','U24CS1206','F023','CR014'),(131,'Tuesday','HR3','E','2024-2025',2,'FDBMS','U24CS1206','F023','CR014'),(132,'Tuesday','HR4','E','2024-2025',2,'DSA','U24CS1203','F008','CR014'),(133,'Tuesday','HR5','E','2024-2025',2,'APCSE','U24CS1202','F021','CR014'),(134,'Tuesday','HR6','E','2024-2025',2,'FCN','U24CS1205','F014','CR014'),(135,'Wednesday','HR1','E','2024-2025',2,'APCSE','U24CS1202','F021','CR014'),(136,'Wednesday','HR2','E','2024-2025',2,'DSA','U24CS1203','F008','CR014'),(137,'Wednesday','HR3','E','2024-2025',2,'AMCS','U24CS1201','F016','CR014'),(138,'Wednesday','HR4','E','2024-2025',2,'PP','U24CS1204','F022','CR014'),(139,'Wednesday','HR5','E','2024-2025',2,'DSA','U24CS1203','F008','CR014'),(140,'Wednesday','HR6','E','2024-2025',2,'DSA','U24CS1203','F008','CR014'),(141,'Thursday','HR1','E','2024-2025',2,'PP','U24CS1204','F022','CR014'),(142,'Thursday','HR2','E','2024-2025',2,'PP','U24CS1204','F022','CR014'),(143,'Thursday','HR3','E','2024-2025',2,'FDBMS','U24CS1206','F023','CR014'),(144,'Thursday','HR4','E','2024-2025',2,'AMCS','U24CS1201','F016','CR014'),(145,'Thursday','HR5','E','2024-2025',2,'DSA','U24CS1203','F008','CR014'),(146,'Thursday','HR6','E','2024-2025',2,'PP','U24CS1204','F021','CR014'),(147,'Friday','HR1','E','2024-2025',2,'PP','U24CS1204','F021','CR014'),(148,'Friday','HR2','E','2024-2025',2,'FDBMS','U24CS1206','F023','CR014'),(149,'Friday','HR3','E','2024-2025',2,'FCN','U24CS1205','F022','CR014'),(150,'Friday','HR4','E','2024-2025',2,'DSA','U24CS1203','F008','CR014'),(151,'Monday','HR1','F','2024-2025',2,'PP','U24CS1204','F009','CR015'),(152,'Monday','HR2','F','2024-2025',2,'FDBMS','U24CS1206','F026','CR015'),(153,'Monday','HR3','F','2024-2025',2,'FDBMS','U24CS1206','F026','CR015'),(154,'Monday','HR4','F','2024-2025',2,'FDBMS','U24CS1206','F026','CR015'),(155,'Monday','HR5','F','2024-2025',2,'AMCS','U24CS1201','F024','CR015'),(156,'Monday','HR6','F','2024-2025',2,'PP','U24CS1204','F009','CR015'),(157,'Tuesday','HR1','F','2024-2025',2,'FDBMS','U24CS1206','F026','CR015'),(158,'Tuesday','HR2','F','2024-2025',2,'AMCS','U24CS1201','F024','CR015'),(159,'Tuesday','HR3','F','2024-2025',2,'FCN','U24CS1205','F010','CR015'),(160,'Tuesday','HR4','F','2024-2025',2,'PP','U24CS1204','F009','CR015'),(161,'Wednesday','HR1','F','2024-2025',2,'APCSE','U24CS1202','F025','CR015'),(162,'Wednesday','HR2','F','2024-2025',2,'FCN','U24CS1205','F010','CR015'),(163,'Wednesday','HR3','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(164,'Wednesday','HR4','F','2024-2025',2,'PP','U24CS1204','F009','CR015'),(165,'Wednesday','HR5','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(166,'Wednesday','HR6','F','2024-2025',2,'AMCS','U24CS1201','F024','CR015'),(167,'Thursday','HR1','F','2024-2025',2,'AMCS','U24CS1201','F024','CR015'),(168,'Thursday','HR2','F','2024-2025',2,'APCSE','U24CS1202','F025','CR015'),(169,'Thursday','HR3','F','2024-2025',2,'FDBMS','U24CS1206','F026','CR015'),(170,'Thursday','HR4','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(171,'Thursday','HR5','F','2024-2025',2,'APCSE','U24CS1202','F025','CR015'),(172,'Thursday','HR6','F','2024-2025',2,'PP','U24CS1204','F009','CR015'),(173,'Friday','HR1','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(174,'Friday','HR2','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(175,'Friday','HR3','F','2024-2025',2,'FCN','U24CS1205','F010','CR015'),(176,'Friday','HR4','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(177,'Saturday','HR1','F','2024-2025',2,'FDBMS','U24CS1206','F026','CR015'),(178,'Saturday','HR2','F','2024-2025',2,'DSA','U24CS1203','F003','CR015'),(179,'Saturday','HR3','F','2024-2025',2,'FCN','U24CS1205','F010','CR015'),(180,'Saturday','HR4','F','2024-2025',2,'APCSE','U24CS1202','F025','CR015');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gmu','keshavpatil2100@gmail.com','scrypt:32768:8:1$yOynIDfQeFiff2iD$6879ed9907d819435482d7ef913a49d9d23641dd5152ffe3b4c11acb68ddbff10642891560e0572a8d3eb2a9de33dab657e631f2ed1439fbd43ccea44949aea9','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 18:02:04
