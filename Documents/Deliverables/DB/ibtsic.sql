-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ibtsic
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `Announcement`
--

DROP TABLE IF EXISTS `Announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `startInstant` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `validity` time DEFAULT '00:15:00',
  `nodeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Announcement_1` (`nodeId`),
  CONSTRAINT `fk_Announcement_1` FOREIGN KEY (`nodeId`) REFERENCES `Node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Announcement`
--

LOCK TABLES `Announcement` WRITE;
/*!40000 ALTER TABLE `Announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bus`
--

DROP TABLE IF EXISTS `Bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regNo` varchar(45) NOT NULL,
  `latitude` double DEFAULT '0',
  `longitude` double DEFAULT '0',
  `onwardPathId` int(11) DEFAULT NULL,
  `returnPathId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regNo_UNIQUE` (`regNo`),
  KEY `fk_Bus_1` (`onwardPathId`),
  KEY `fk_Bus_2` (`returnPathId`),
  CONSTRAINT `fk_Bus_1` FOREIGN KEY (`onwardPathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bus_2` FOREIGN KEY (`returnPathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bus`
--

LOCK TABLES `Bus` WRITE;
/*!40000 ALTER TABLE `Bus` DISABLE KEYS */;
INSERT INTO `Bus` VALUES (1,'r1',1.11,2.22,3,5),(3,'f',0,0,1,2);
/*!40000 ALTER TABLE `Bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Node`
--

DROP TABLE IF EXISTS `Node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `latitude` double DEFAULT '0',
  `longitude` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nodecol_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Node`
--

LOCK TABLES `Node` WRITE;
/*!40000 ALTER TABLE `Node` DISABLE KEYS */;
INSERT INTO `Node` VALUES (1,'JP Nagar 6th Phase',1.11,2.22),(2,'Ganga Nagara',3.33,4.44),(7,'tyyrytr',2,4),(13,'jhjh',22,22),(14,'hgfhgfhfgfhgf',44,44),(15,'hgfhgf',77,77),(16,'nbmnb',777,78),(19,'rtyq',7.01,8.02),(21,'hghjg',8,8),(22,'ghfhgfhff',22,1),(23,'hgfghfhgfhgfghf',1,2);
/*!40000 ALTER TABLE `Node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Path`
--

DROP TABLE IF EXISTS `Path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Path`
--

LOCK TABLES `Path` WRITE;
/*!40000 ALTER TABLE `Path` DISABLE KEYS */;
INSERT INTO `Path` VALUES (1,'MBS-1.onward'),(2,'MBS-1.return'),(3,'route1.onward'),(5,'route1.return'),(7,'route3');
/*!40000 ALTER TABLE `Path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PathNode`
--

DROP TABLE IF EXISTS `PathNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathNode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathId` int(11) DEFAULT NULL,
  `nodeId` int(11) DEFAULT NULL,
  `seqNo` int(11) DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  `distance` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_PathNode_1` (`pathId`),
  KEY `fk_PathNode_2` (`nodeId`),
  CONSTRAINT `fk_PathNode_1` FOREIGN KEY (`pathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PathNode_2` FOREIGN KEY (`nodeId`) REFERENCES `Node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PathNode`
--

LOCK TABLES `PathNode` WRITE;
/*!40000 ALTER TABLE `PathNode` DISABLE KEYS */;
INSERT INTO `PathNode` VALUES (1,1,1,1,NULL,NULL,0),(2,1,2,2,NULL,NULL,0),(3,2,2,1,NULL,NULL,0),(4,2,1,2,NULL,NULL,0),(5,3,1,1,NULL,NULL,0),(8,5,1,1,NULL,NULL,0),(11,7,2,1,NULL,NULL,0),(12,7,7,2,NULL,NULL,0);
/*!40000 ALTER TABLE `PathNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Run`
--

DROP TABLE IF EXISTS `Run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `pathId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Run_1` (`pathId`),
  CONSTRAINT `fk_Run_1` FOREIGN KEY (`pathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Run`
--

LOCK TABLES `Run` WRITE;
/*!40000 ALTER TABLE `Run` DISABLE KEYS */;
INSERT INTO `Run` VALUES (1,1,'06:40:00','07:40:00',1),(2,2,'09:00:00','10:10:00',1),(3,3,'14:25:00','15:35:00',1),(4,4,'17:20:00','18:30:00',1),(5,5,'19:50:00','21:00:00',1),(6,1,'07:45:00','08:55:00',2),(7,2,'10:40:00','11:50:00',2),(8,3,'16:05:00','17:15:00',2),(9,4,'18:35:00','19:45:00',2),(10,5,'21:05:00','22:05:00',2),(11,1,'08:00:00','09:00:00',5),(12,2,'08:10:00','09:10:00',5),(13,1,'08:00:00','09:00:00',7);
/*!40000 ALTER TABLE `Run` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-24 21:03:53
