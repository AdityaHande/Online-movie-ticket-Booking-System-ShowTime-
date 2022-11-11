CREATE DATABASE  IF NOT EXISTS `showtimedb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `showtimedb`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: showtimedb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `screen_cat_seat_allocation`
--

DROP TABLE IF EXISTS `screen_cat_seat_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_cat_seat_allocation` (
  `scnid` int NOT NULL,
  `cat_id` int NOT NULL,
  `seats` int NOT NULL,
  KEY `scnid112_idx` (`scnid`),
  KEY `cat_id122_idx` (`cat_id`),
  CONSTRAINT `cat_id122` FOREIGN KEY (`cat_id`) REFERENCES `seat_categories` (`cat_id`) ON UPDATE CASCADE,
  CONSTRAINT `scnid112` FOREIGN KEY (`scnid`) REFERENCES `screen_master` (`scnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_cat_seat_allocation`
--

LOCK TABLES `screen_cat_seat_allocation` WRITE;
/*!40000 ALTER TABLE `screen_cat_seat_allocation` DISABLE KEYS */;
INSERT INTO `screen_cat_seat_allocation` VALUES (1,1,30),(1,2,60),(1,3,60);
/*!40000 ALTER TABLE `screen_cat_seat_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_master`
--

DROP TABLE IF EXISTS `screen_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_master` (
  `scnid` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `screen_no` int NOT NULL,
  PRIMARY KEY (`scnid`),
  KEY `tid24_idx` (`tid`),
  CONSTRAINT `tid24` FOREIGN KEY (`tid`) REFERENCES `theater` (`tid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_master`
--

LOCK TABLES `screen_master` WRITE;
/*!40000 ALTER TABLE `screen_master` DISABLE KEYS */;
INSERT INTO `screen_master` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `screen_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_seat_capacity`
--

DROP TABLE IF EXISTS `screen_seat_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_seat_capacity` (
  `scnid` int NOT NULL,
  `total` int NOT NULL,
  `rows` int NOT NULL,
  `columns` int NOT NULL,
  KEY `cascascacasc_idx` (`scnid`),
  CONSTRAINT `cascascacasc` FOREIGN KEY (`scnid`) REFERENCES `screen_master` (`scnid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_seat_capacity`
--

LOCK TABLES `screen_seat_capacity` WRITE;
/*!40000 ALTER TABLE `screen_seat_capacity` DISABLE KEYS */;
INSERT INTO `screen_seat_capacity` VALUES (2,120,10,12),(1,120,10,12);
/*!40000 ALTER TABLE `screen_seat_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_categories`
--

DROP TABLE IF EXISTS `seat_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_categories` (
  `cat_id` int NOT NULL,
  `category_name` varchar(10) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_categories`
--

LOCK TABLES `seat_categories` WRITE;
/*!40000 ALTER TABLE `seat_categories` DISABLE KEYS */;
INSERT INTO `seat_categories` VALUES (1,'silver'),(2,'gold'),(3,'platinum');
/*!40000 ALTER TABLE `seat_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 12:19:37
