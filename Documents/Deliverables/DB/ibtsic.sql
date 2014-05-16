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
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `startInstant` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `validity` time DEFAULT '00:00:15',
  `edgeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_Announcement_1` (`edgeId`),
  CONSTRAINT `fk_Announcement_1` FOREIGN KEY (`edgeId`) REFERENCES `Edge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `Arrival`
--

DROP TABLE IF EXISTS `Arrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Arrival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT '00:00:00',
  `pathNodeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Arrival_1` (`pathNodeId`),
  CONSTRAINT `fk_Arrival_1` FOREIGN KEY (`pathNodeId`) REFERENCES `PathNode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arrival`
--

LOCK TABLES `Arrival` WRITE;
/*!40000 ALTER TABLE `Arrival` DISABLE KEYS */;
/*!40000 ALTER TABLE `Arrival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bus`
--

DROP TABLE IF EXISTS `Bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` double DEFAULT '0',
  `y` double DEFAULT '0',
  `pathId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Bus_1` (`pathId`),
  CONSTRAINT `fk_Bus_1` FOREIGN KEY (`pathId`) REFERENCES `Path` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bus`
--

LOCK TABLES `Bus` WRITE;
/*!40000 ALTER TABLE `Bus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departure`
--

DROP TABLE IF EXISTS `Departure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT '00:00:00',
  `pathNodeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Departure_1` (`pathNodeId`),
  CONSTRAINT `fk_Departure_1` FOREIGN KEY (`pathNodeId`) REFERENCES `PathNode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departure`
--

LOCK TABLES `Departure` WRITE;
/*!40000 ALTER TABLE `Departure` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Edge`
--

DROP TABLE IF EXISTS `Edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Edge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node1Id` int(11) DEFAULT NULL,
  `node2Id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Edge_1` (`node1Id`),
  KEY `fk_Edge_2` (`node2Id`),
  CONSTRAINT `fk_Edge_1` FOREIGN KEY (`node1Id`) REFERENCES `Node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Edge_2` FOREIGN KEY (`node2Id`) REFERENCES `Node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Edge`
--

LOCK TABLES `Edge` WRITE;
/*!40000 ALTER TABLE `Edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `Edge` ENABLE KEYS */;
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
  `x` double DEFAULT '0',
  `y` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nodecol_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Node`
--

LOCK TABLES `Node` WRITE;
/*!40000 ALTER TABLE `Node` DISABLE KEYS */;
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
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Path`
--

LOCK TABLES `Path` WRITE;
/*!40000 ALTER TABLE `Path` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `fk_PathNode_1` (`pathId`),
  KEY `fk_PathNode_2` (`nodeId`),
  CONSTRAINT `fk_PathNode_1` FOREIGN KEY (`pathId`) REFERENCES `Path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PathNode_2` FOREIGN KEY (`nodeId`) REFERENCES `Node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PathNode`
--

LOCK TABLES `PathNode` WRITE;
/*!40000 ALTER TABLE `PathNode` DISABLE KEYS */;
/*!40000 ALTER TABLE `PathNode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-16 22:01:32
