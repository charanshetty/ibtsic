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
  `currentPathId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regNo_UNIQUE` (`regNo`),
  KEY `fk_Bus_1` (`onwardPathId`),
  KEY `fk_Bus_2` (`returnPathId`),
  KEY `fk_Bus_3` (`currentPathId`),
  CONSTRAINT `fk_Bus_3` FOREIGN KEY (`currentPathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bus_1` FOREIGN KEY (`onwardPathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bus_2` FOREIGN KEY (`returnPathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bus`
--

LOCK TABLES `Bus` WRITE;
/*!40000 ALTER TABLE `Bus` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Node`
--

LOCK TABLES `Node` WRITE;
/*!40000 ALTER TABLE `Node` DISABLE KEYS */;
INSERT INTO `Node` VALUES (30,'n1',0,0),(31,'n2',0,0),(32,'n3',0,0),(33,'n4',0,0),(34,'n5',0,0),(35,'n6',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Path`
--

LOCK TABLES `Path` WRITE;
/*!40000 ALTER TABLE `Path` DISABLE KEYS */;
INSERT INTO `Path` VALUES (8,'p1'),(11,'p1r'),(9,'p2'),(10,'p3');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PathNode`
--

LOCK TABLES `PathNode` WRITE;
/*!40000 ALTER TABLE `PathNode` DISABLE KEYS */;
INSERT INTO `PathNode` VALUES (13,8,30,1,NULL,'00:00:00',0),(14,8,31,2,'01:00:00','01:00:00',0),(15,8,32,3,NULL,NULL,0),(16,8,33,4,'04:00:00',NULL,0),(17,9,34,1,NULL,'00:00:00',0),(18,9,31,2,'01:10:00','01:10:00',0),(19,9,32,3,NULL,NULL,0),(20,9,33,4,'03:00:00',NULL,0),(21,9,35,5,'04:00:00',NULL,0),(22,10,30,1,NULL,NULL,0),(23,10,31,2,NULL,NULL,0),(24,10,35,3,NULL,NULL,0),(25,11,33,1,NULL,NULL,0),(26,11,32,2,NULL,NULL,0),(27,11,31,3,NULL,NULL,0),(28,11,30,4,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Run`
--

LOCK TABLES `Run` WRITE;
/*!40000 ALTER TABLE `Run` DISABLE KEYS */;
INSERT INTO `Run` VALUES (14,1,'19:00:00','21:00:00',8),(15,2,'20:00:00','22:00:00',8),(16,1,'20:00:00','22:00:00',9),(17,2,'20:00:00','22:00:00',9),(18,1,'20:00:00','22:00:00',10),(19,1,'20:00:00','22:00:00',11);
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

-- Dump completed on 2014-06-26 10:20:39
