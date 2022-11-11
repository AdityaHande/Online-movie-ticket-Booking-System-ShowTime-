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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `uid6_idx` (`uid`),
  CONSTRAINT `uid6` FOREIGN KEY (`uid`) REFERENCES `login_table` (`uid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1,'vahab maner','head post office'),(2,2,'vyankatesh nakate','ichalkarji'),(3,3,'aditya hande','pune'),(4,4,'sangram desai','shahuwadi');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booked_seats`
--

DROP TABLE IF EXISTS `booked_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_seats` (
  `dummy_bs_id` int NOT NULL AUTO_INCREMENT,
  `bid` int NOT NULL,
  `seatid` varchar(10) NOT NULL,
  PRIMARY KEY (`dummy_bs_id`),
  KEY `uyuthgfrh_idx` (`bid`),
  CONSTRAINT `uyuthgfrh` FOREIGN KEY (`bid`) REFERENCES `booking_master` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_seats`
--

LOCK TABLES `booked_seats` WRITE;
/*!40000 ALTER TABLE `booked_seats` DISABLE KEYS */;
/*!40000 ALTER TABLE `booked_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_master`
--

DROP TABLE IF EXISTS `booking_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_master` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `mid` int NOT NULL,
  `scnid` int NOT NULL,
  `price_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `show_date` date NOT NULL,
  `booked_seats` int NOT NULL,
  `charges` int NOT NULL,
  `payment_status` tinyint NOT NULL,
  `payment_mode` varchar(15) NOT NULL,
  `booked_status` tinyint NOT NULL,
  `refund_status` tinyint NOT NULL,
  `refund_amount` int NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `csdcscsdcsdccs_idx` (`cid`),
  KEY `dcsdcd_idx` (`mid`),
  KEY `cdcdcdcdcds_idx` (`scnid`),
  KEY `umuuumiu_idx` (`price_id`),
  CONSTRAINT `cdcdcdcdcdsqqq` FOREIGN KEY (`scnid`) REFERENCES `screen_master` (`scnid`),
  CONSTRAINT `csdcscsdcsdccs` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `qqqqqqss` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`),
  CONSTRAINT `umuuumiu` FOREIGN KEY (`price_id`) REFERENCES `price_master` (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_master`
--

LOCK TABLES `booking_master` WRITE;
/*!40000 ALTER TABLE `booking_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cityid` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `city_pincode` varchar(45) NOT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Kolhapur','416012'),(2,'Sangli','415015');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `cname` varchar(45) NOT NULL,
  `caddress` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `ccontact` varchar(20) NOT NULL,
  `cemail` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid2_idx` (`uid`),
  CONSTRAINT `uid2` FOREIGN KEY (`uid`) REFERENCES `login_table` (`uid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,6,'Ramesh Kale','sangli','1997-01-01','male','7899877899','ramesh@mail.com'),(2,7,'suresh gaytonde','pune','1991-02-02','male','8989878789','suresh@mail.com'),(3,10,'dummy2','dummy2','2022-09-11','dummy2','dummy2','dummy2');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_table`
--

DROP TABLE IF EXISTS `login_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_table` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `active_status` tinyint NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_table`
--

LOCK TABLES `login_table` WRITE;
/*!40000 ALTER TABLE `login_table` DISABLE KEYS */;
INSERT INTO `login_table` VALUES (1,'vahab7maner','Admin@123','admin',1),(2,'vyanktesh5549','Admin@123','admin',1),(3,'aditya11','Admin@123','admin',1),(4,'sangram1492','Admin@123','admin',1),(5,'nitin','nititin123','towner',1),(6,'ramesh','ramesh123','customer',1),(7,'rameacach','ramesacasch123','customer',1),(8,'vishakha7755','vishakha@123','towner',0),(9,'dummy','dummy','towner',0),(10,'dummy2','dummy2','customer',1);
/*!40000 ALTER TABLE `login_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_feedback`
--

DROP TABLE IF EXISTS `movie_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_feedback` (
  `mfid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `mid` int NOT NULL,
  `rating` int NOT NULL,
  `comment` varchar(300) NOT NULL,
  PRIMARY KEY (`mfid`),
  KEY `cid_idx` (`cid`),
  KEY `mid_idx` (`mid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON UPDATE CASCADE,
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_feedback`
--

LOCK TABLES `movie_feedback` WRITE;
/*!40000 ALTER TABLE `movie_feedback` DISABLE KEYS */;
INSERT INTO `movie_feedback` VALUES (1,1,1,2,'good'),(2,2,2,3,'very good'),(3,3,3,4,'awesome'),(4,2,3,4,'awesome');
/*!40000 ALTER TABLE `movie_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_time_slots`
--

DROP TABLE IF EXISTS `movie_time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_time_slots` (
  `dummy_mts_id` int NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL,
  `scnid` int NOT NULL,
  `slot_id` int NOT NULL,
  PRIMARY KEY (`dummy_mts_id`),
  KEY `mid224_idx` (`mid`),
  KEY `scnid779_idx` (`scnid`),
  KEY `slot_id745896_idx` (`slot_id`),
  CONSTRAINT `mid224` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`),
  CONSTRAINT `scnid779` FOREIGN KEY (`scnid`) REFERENCES `screen_master` (`scnid`),
  CONSTRAINT `slot_id745896` FOREIGN KEY (`slot_id`) REFERENCES `time_slots` (`slot_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_time_slots`
--

LOCK TABLES `movie_time_slots` WRITE;
/*!40000 ALTER TABLE `movie_time_slots` DISABLE KEYS */;
INSERT INTO `movie_time_slots` VALUES (6,1,2,1),(7,1,2,2),(8,1,2,3),(9,1,2,4),(10,1,2,5),(16,3,1,1),(17,3,1,2),(18,3,1,3),(19,3,1,4),(20,3,1,5),(21,3,3,1),(22,3,3,2),(23,3,3,3),(24,3,3,4),(25,3,3,5);
/*!40000 ALTER TABLE `movie_time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(45) NOT NULL,
  `minfo` varchar(100) NOT NULL,
  `cast` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `release_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `language` varchar(45) NOT NULL,
  `poster` longblob,
  `tax_free` tinyint NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Bhramastra','Indian Hindi-language fantasy action-adventure film written and directed by Ayan Mukerji','Ranbir,Alia','2D','2022-10-05','2022-10-15','2022-12-05','Hindi',_binary 'RIFF\\t\0\0WEBPVP8X\n\0\0\0 \0\0\0\�\0\0$\0ICCP\0\0\0\0lcms\0\0mntrRGB XYZ \�\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0\�\0\0\0@gTRC\0\0\�\0\0\0@bTRC\0\0\�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0\Z\0\0\0\�\�c�k�?Q4!�)�2;�FQw]\�kpz���|�i�}\�\�\�0��VP8 *r\0\0�*\�\0%>=�C\"!!8 ĳ\0Y�\�0}�8ר]���\����\��J\�\�*�`�w\�\��U��=�`�e�\��\��\��\�\�w��\��w\�？\�\�\�}�?���\��C�\���\��\��\��d�\���\������n��0�[\��I�\�?����y�\�ۣ��\�~���_�>�.������\�使��\��ŏ��B?\"�����\��\����\�\��������\�#\��������?�{\�G\�\�z�3�W\�\'�����?\���������C���Ϲ�\��\��L�����\�\�0>����k�}�C�\����?M\�\��[�\���ۏ\�\���\�������c�w���O��?\����\�����\�O\��t\�\�o���o��\�\�C{�r\�]9b?\�\�R��2�Zs]�\��\\ �\�\�[��qa\���c���\��\�a�T�E��_�\�=0D@\��K��w���L7\�\�\��+1��\�yH�\�G6�\'/)���VK\�\�\��9�p\��RX�\�>\�\\ɬ�\�c\�\"���B�\�d$0G�*\nF\�h�:b4��p�|\�\�k�1a�i\�V\�\�\�~�\�\�\�	�@�V��V\�B���\�\�a�\�AVid\�w&\�o\�Ç��\�\nqT�VQ�ډ��@-)��j�u7}��A\n##el\�Ɠ.R��V��/^�)nFt]�z�Av�_�������̑�\��\�>�\���P�}g\�55��U:AtON&�~�c�`kL\�D�k^�s�nK͗G\�K\"��f�pF�s.b)x�����C_\�[T\�\�\�\��\�\�\��>�Dr���g�x�\���\�꼯����s\�*���j���\�r���(\�U3�h\r�Q\r\�j��2�~�\�.�xg�F����L�zf\'/C�tknR@��\��~�H9\Zr��\�\�\�r\�Ǫ��\�c �C��g�i*�I�\�jh�\Z\�\�#���T\�e#Sze\�\n&�Q��G	\�&\�(�.���I\�S�E�\r{3\�#���i\�Q\�?�\�$���/�r\�w�ڀ\�\�*��4\�\�p]Z�\�\�	(*���i�\rŊ\��Dm\�!��\�\"Db�ˁ$���d%����-\�\��\��?o;f�ϩ7o�\�%]#y�alIk�\��)��$evBC�c\�^\��!PK�7鹡3\'A2\�ݷ	����E�yU�Wb\���\�B6v��V�u���\�Y�`��/\�gj\�DG5SNyo\�S�Ϳә$�ѡ�7�\��GdC\'\�61,~\'\�\�%���((��K�X\�q\�Fh�(�\�\����kC�@n\�ǐN�\�Lwc�_�\�%ŵ�f\�%n\�m����Y�8�$\�\�N\�h�ŏ�\�v��\�\�\�$1>��D\�Wӝ�i�e�\�7M[\"<#E\�\n�<ԍ��iU\�\Z\�\�^:� �����U+��\��\�8\��0��҈;�h�\�՗����rC�v\�z\�柈q�\�X_|0��ƍ\��ļ\�Xq`H\��y��\Zb$޹9����uІKE����2�ST��1��n�\�I��6�X)�Zɢ��˘�*ͥ�y�Ȃ׽�\�`H���+4\����\��\�#\0�\��\��\�ݢe\�{��\'0Q��\��vp���[����6��g��q�\r7\�P\�J$3_�VK֔]-��\�\�b3�M�G\�\�\�q\�\r����&$�\'��~�l����<\'8��~����y�.\�\�c�\�^1�Z|�|K\�_\Z�[�\�M\r\Z;�MzW-�b�\�\"�]MU\�:�\�<�$����w=\�r���vLԺ��o�|G�\�g�W<K�@����2��#�\�}\�]\�ܖ���D{��<\�\�[\r������:�#I)@�\Z\�������O���ʪ�v4�\��:js�܈/F�gmׅ>�|�����\�v�<�l\�t;�LJ��=ͣz\�\\��ߝ÷�\�ảL��C1&:�\�\�X��[�k#���ɼst�c�ΐ8\�i߻= � \�\�g TT�xr6\�y\��wLwZ�g��H\�X�\��Go�\�:B�\�lg�k(>�\�\�;h\�\�\'\�q�I\�عԑ\������)\��_�INÂ���\�p(ؔr�7���W\0:q��	�af�c拯p���i�u_�W.� �\�噺a\�Q�8ML�0﵂�f��\�#3!z\'\�\�Đѿ`	�g�\�dO��w\�FN�h�E&�\�\Z$\�3�J�\�sv�WMP�7Nxރ�3\�\�~s�\�-�}\�3�`�e�~X6�\�*\�vs-���ؙ;\�\�\�\�\�\�\��66�gI0�[ק�(�\�\���߀\0��۷��v���NE�\rG=�f\�\'��ji���\�;\�\�*�x\�g+��\0��(�\�1Ͷ�B�\�\��\�T��\��i\�^� \�g񃀍\�Wɩ���\�\�\�\�_�.��K\�\�\�������\�͸{\��S\�m�N��C\�08�}����\�\�!M�u\�\�gA�gn��\�9Y݊Aԛ\�\�y\���\Z�����\�Q�!�a���\�>;pܱ~\r+�F��{�*P�}�h\�!�\r��<ߜ�\�\��v1\�I\�Z\�]�\�8�Ue�$1���\0^a7\�/N�\�5\�gG�\n��|gqhR\�>�U\�|!�\�\���\�\r�Ppd~C�Nw(U\�=f��~G���M1.\�)J\�N\nf��b^k}�yA\�m��w�;BĝZb5ݹ\�\�\�\"b�e�svT�\�Y�|\'�Y�\�\�O2s��G{.}\�w�$\��\�M\�\�A�9��xnCip���˺\�!\�D4YЂ�џ!׎OWVԔ䓵��|�\�1\�vj�-�V�Nη�\�\Z�uaŧ\�F��\n\�t��q��\�g|�z�q�e2鯶d>\\uKbt�P$��\�\��>̚��Fi\�}ё6�y����@�\n\�\�L�Z\�Ã�\�{\�o�D%Ro@\�v��q�\'�e�þ^�θ0ٯ�ٞ�E�\�~#�f�\�\�rw\�	�;�$\�\�\�\�*:ް��\��lD\�X��ᅑN��P\\k�vc����H�!�\�\�-Zh~\��m��ia.���%$\\ŠG6\"׀ \�\��\�\'?=�c��C&q\�!۝�&s��Ϯz�\�Ē.G\��\�B��H;`�F�w<\0\�ƕgb\�\�9�3<�@\�H�\�n�l�R�VߗMX\�\'��.ٍxK�|l�s�(�~�j��x\�6~��3y\r\�K8�t�\�\��\0�\�\�f/��H��\r݊yJv\�\�A~l8y�&P>\�\�ԛ�\�H\�-rr�d�\�aq8������fN���\�)X�\�߅Zq8`�ɻ呤�\�\�\Z�(UtFYB|���J\�x1\�?e;\�Mi�e�k\�m�P��^e�O��y��\�\�^pǖ��.q�B�\�&\re}3\"�&Y��SK�\�k�˷RB-ѧ\�C���\�\\\�\�1�~�/,=���	�}rv�Y\�\"$XY\0L\�\�x�\�\�/MĮ�/,߇Y\�\�R~�T\�6\���C�s}\�\�}���}VO���&M��񘼽��{t��Rz�e\Ze��<�\�s��Uy\�\��wuirC���\�(vD^��fC\�M��]֞=坸\Z�]�]9c8�\�bj�&0r���aM�~݃lC^9�\�zo2#O�\�P�E��\�5s\\\'t�$O\�\Z6uDN@>m7�xm\�?n4�0�8B6�~\�^�v�\�v>�-�=\Z�D�u�_Yơy��\�!limI1K\'q!�v\�&�eڦ5[?_��@\��:�/�P\�R��%؏#�\n��\�8̘A\�J\�물�\�\\\�D\�d;�\�\��Oڊ.�;�\�w�\�6*\�  �I���&#\����1���(<\�Յ���?�\�6�\�R\��}��\�JBs�4\�fojլ�c\�p\�f��ʾ<A\�<,\�6U��c\�)X4����\�\�\�Lc5k!O��C?�\�\�<B�uu]�/5\�X�W�\�\�謉c\�[�s\�q�5��\��$�\r!\Z�y��XT�T����W9+�\�\�h<\� \�ե�\�rG\�Ax��l2��M6U\�\�2v��*��\�*\�\��<V�\�v�4;\�#��z�\�4�r.��\�}���.û���e\0\\����\��m\�\�ۻ.D\r� @D\�#\�)\�\0)�|:��$��\�%�\�k���Y{ü	/�\�x%FpH�\�A�9.��)ɳ��\'y!�1x��B��pm�����KS\�iQ#���Si\���L�$�3L&2KK= ���	y4\Z%��})\�燧�x�)1\���|\������\"�\rc8\�hׯc f츦\�߰g7\�$}g�Њv�O\�|\�p\�,���cp\�\�\�\�w\�4\"� ���<�̋k�1�\�`�����Z,�&b{�<��O2�\��]#?��j�q\��P^7��I#X\�E&3I\�Й臉\�T!�8b����\�y\�sc\���f�\'�٪ﷰO�#\'(j�\��!\�\"�T�\Z_ap�J�,�R\� $�dT\�QF��\�f3\�|rO(M}:�\�fv��\�j�Ϙ\��6�����=�\'�G\��\�\05�jP̲/3\�tU�^��\�f\�l\�Z\�W��-��F�]\��\��Z*�L�\�\�^�KN+\�\��\"�A9\�\��ZZB\�\�M.1 (Rdweq�\�w�I�\�w[7%(o�%a�2?/|�Jhc$�h�9@�Y\'\���\"\'��Yݪ�˅Ʌ��an�}�ﮪg� b�g\ZM\�^Ә�\�\�ڿ>Qi���\ni�\����?G�3\�e�!\���g\���\�9�rk�L\�yg�\rwk,/�ϭx��4\�`ɥ\�EO�\�c\�+�?$\�w\'X����5V�\�\�:�\���Z1&Ǚ\�g�\�t��c\�G�\�O\�Ne[���A\�|2\�D��8[%p�SXl��\���\�p��r�\�N��Y�@l��\�\�Z\�\�D�T99�\�̰ƒ	)|��j{3r\�fZ\��\r8�\�A~W77/�ΚS\����\�e\n\�\�݄\�$����X�M�~��%�𽯘��\\X�\��b!\���\�v\�v�7@\nY��3ʏ�\�.\��\�`=n��\�:3\Z\�-$�l�|ھuM\�]V*\n\�p�eJ�t^�\�2ҧ�sz\�f\�\�\�N���á3������\"�%1}\�6U\�\Z�\��L\�~p �r�\�û\�&hBI\�\�U�R?��>w\�v|\�\�\�^j\��\�2\�jf9�-eڰ)wS�^g�\ru<\�{�Z\��~q\�j;J_\�=\��8Q�;\�ʺ��&\r\�\Z�R\�\�\�y�_\�:�\�,=^&�`ҌwX\�3�`ȝէ\�\�U�H� ���G�>Ӻ\�\�+ &���R�\�%\�^�\�j*��~�\�n�\���v\�Λ_gV\�r�:1\�\�`\�Ez�3�fu�S����[p��\�&\�t~k�J}�j���$�\�V*1H�ϴ\�6�\�\�uP�+\�lZ|�?ʷ\�G/v��I7g1g)M�<��L�;kŢI��7@b��k���(�v�j��\�ӕ�/`;9\�P�5��X2S�c�\'.^�Guq8�� Qq�ڢ\�\02s����\�-�>�8|\r\��j9�����\�\�2\�Z\�\�\�g���\'^<\�C ��\���g���O�M�^0e��J\�\�$\���\�XN0���xQ�\r\"�4\�z\�\����\�7\�h΅\�Ϥ���N\�z\�H���2)�d\�\�\�\�~�a9PN��\Z��\�\'r��E�A3Q(\��\�\�\\o(\�X��y�x�[�\"$\�PYO׀F�ԋ\�#\Z�I�\Z\�~w��7lo\�3\��\�~�r�\�x_\��x\�\�\��\� :XR�\�,�6[�R8��|i�\�\�4\��(�\�\0�:�P;z]��P%\"Qk�\�9���\�\�*AH�\�9�\�1鳇\�l�w9��p\'�ޘ\�[�y� \�\�D�*\�P�̭�\�Pr\'!�ɀ\�u\�-��Up�qh\�\�O\�A,\�.�(\���@쐐TM��\���:�\��\�ɺᶔ�\��\�\�p\�\"7iu+\�\�\�e\�s��8�W�\�\�=8�ߓ�\���4�\�\�:�\�ٱ�o�l\�R�Gn0��\�tm/�\�*�Y�b4�ˇ�!ߛgvH�,\\�q�?q\��f�S#+���a�\�,`��\�*\�\�\rp�\�f�/\���|YͩgU1	=)F3�1*\�)\�Ez��|�\�7.]�T�K�\�\\\0c��$)+P6\�)��s4�������\�\�\�\�[��p�!q:_\�e\�\�P�8\�#��q��[\��[Y\�>�zNyA��{q\�\�p�m-�R��EY\�A>�DR$�iE\�jM(\�:�J�F��\�gF�\\ 9��\�\�\�8y�7^,\�\Z遫OmS$\��rn/�ݞ���|+C���L�=\�BIw�3RiO��\�\�_̅W���BYH\��7\�i		���x\�5���fȦ�AIov)�\'�K\n�&�|�}�ʷ9Q܍\�ƆqP\�}�η\�Y�C:\�f�$�?=��3�U9`wd\Z\"G$&��O;\�����9\�~�\�\�	v\�ڂ16\r��6�ijų\��՝ڕ�l�.\'e�\�݉��{�WNd���\��yPM��\�\�xK�\��d\\��~�8�\���PĞ�\�6\�=�W��z�\�U�#\nǳ�\�Q�5\�0(�+��8>�m\�(�\�h揧Ϙ\0¢[\�\�\Z?H��Nu��\�\�Qy�8��X���\�B��	��⭎Af�=\�t��\�VHJ�\�\'\��o�S,�&��2�\�y�TTF\�i��ʈMVB7Ĵ�;H�\�XT\�`\0��\�1\�P	|�qS��C&��s�L2��5Āȗ}\�>��ݾ\�Ǖ	\�5m���O\�}~$7xF)cצe��\��k��X\0\�\�\�\n!p�mk]nq)+B#ʉ����J�س��\'��@\�mA\Z�M�{\�\���\\N�C��0kD]��\��清B��\�Ȗ\�]�\�q�L�)K��#����\�/mm\"S+���YTm�\�`\��\�u�_F�\�kǚP\�(�o\�	Tj��}�Q�\�\�\�X���pILg\�\�j��\Z\�۴\�_٨#\�\'Z�S\�1\�a�\�5\�\�$*gl>�y=_\�x\�\�R��\�Aa\Z�>\�S-@ԝs1�\�\��)oќ�7��3` \�ϧ\����z��hG,pp\"�Q\�\�҅D9��rԅ\n\��ڏ,X�FcmLI\�H�\�\�G��ݧ�\n�R�܂!\�B�xG�\��\��C�qw�&��@A���Nn`n>��j�i��Bun��)\"\�!;�Q0�\�����Y/��s\�L�\�Jo��~�R\�Ƕ�\ZH\�ߝ\�}JD#,\�H\"Uӻғf�\�\�i�O�t�\��>\�횻��!�ϟ�M\�\�z���y;\��æ��5i\�\�n+���\�,xҕ~e�\�x�!\�r[\���V����\�\�&\�o=\�\�Y5�ͳ�9\�\�ۣ�w4\���Ix�����\\�0��6�\"$U��� K�\��Z93\�\�K�l[=\r\�r\�\rb��Kwe*\�-��5k�6��xșS\�A\�c�\�I\�\�Z&\��,\�\�̟\�	\�,X��\�6�G�\0/nm���\�៘-5�]�1xn,�E_�wp\"g�Z��\�Wb\�?\�g�\�8��N�&S~Q��<Y��в*\�Ka\nWۂ˺\�{��F!ٲY@�ۇ1����+���d\�_�\0�cz\�A�=ȍW`��\�I\�nʀC�����;\�\�Ed,y\��^\�W�<�i\�5\�7\�Q_s\�\��4uӂ\�A^�\�\�dĶE��X\��\"�Ji����H��n$%	��>!^\�	�\�h8@i��s�5�\�\nΖPMD\r�\0b\�|\�H�k\�`6�܋\�C\��\���\�ȓ\�HH\re��\�����Q\�N��P_�YSjy���iv�ſ,E\'���\�J�\�H�^q���\�\�9w\0b$�щ�g��0�{q[N\�!�Q��ُ \n�8�H����\n��2j�>\�5=Ͷ�\��\�1��J�?�\'�\�S\ZM*m��yq\�\�\�#M\�k�\�`��u�*}�=�o.\�q�`\�\��t�u�� 2\�}�\�;(Ý1ZȤ�gJ?�\�<6Ɏ1��\\�s�K8t\��\\H��χ4�\�\�!�\�w\0�\��R�Թ��;���4��\�ǶȮz\�ڳE���=�\'�\�*H�2\\��Ǩl\��z\�?4wܟ\���\�x\\RAkSR-m5[�|\�1�\�ʒ	q�\�\�\�#z\�g\�?P��\�-A#t���D�\�Թa��z���۝�D�����I�\�pfG\�R��ƽ;\����n\��\�ÎA6x ���`�$/ʐ�\�:^\�+V�M�4\�\�_�	O��Yzy\Z�ٮ\�1\\ți�\��J��\�\�i��\05�\"	<|�\�T�Uc��G)\0Edz�H\0St\��,�)\�O/l�$\�\�h�?\�\��%-����\���[6d\�/F�g�6\"mR#��-\0��|\�DU�£J���|����BG��\"\�\�\�ʬk�*E=�	&煠�K[��Z6�qڻL��~\�3��3�k�gWE��\�yJ�\�[��\�\�Z\�~\�6$c]y�י�o����������+�����s��4C.��>��ubџ�y��\�ծR!�m\�\�/\�Ў0�Fv\�\Z\ZŴ4@Jq3�K�o{W\�U�t@��A\�S�|B>�\�\�ΐ���s*�:j��v�\�b%�\�jR^R��|��\�8\�\����0`�� PǤ+\��@3~\�O�\���#�	�\�\�\�\�μ�*5e��\�2\�+�͚FR�\'�n�\�\�%\���\��5�\��\�WЙ\�͔�DUlBi}XT\�\�M�Ac�� 1ř�\�g\���K:���A��^�B^�9b^0\"_\�p�_\�\�ƑH\�:�����\r2q͠	A\�\�\�i�B�Z8��	<�/�0��{\�U{z-�\�P?6��\�e��\�`�-ϲDX�\�\�@4a\0�i2\���\�\�4i�\�e���ޯ��}Q�B�\r~\�0g�V70\Z&\�\�c�~4&�b���\�\�9B\�C\�g�����Z)�4�O�<�\�z+_+\�Aݸ\�`\\rs{���%\�\��LOG\�}i��\��`�\nvD:����@�o}�DȊ�Ř��\�Z��!\r56\�!�\�\\�g\��$\�O՟\�u\����9�\nL����\�KT}g��\�f�\�\�2@\�\�\��*��//\�8,_\�\�\�% >ϰ`o?�\\�U�\'�.�z��\�(\�\��W��,1y\��*ǌ\����\�n�}\��\r\�OB\�Z�F�i���<@/\�μe\�\'�f�@��\�\�J@�\�\�Z�&�>Z�lx�\n\�A\�\"uÃ�]\�TE\��A���{mѶ=�Qh\�1��\\+�椌\�D4�ίZ?q��2rC\�֩>T��@tM}z62~E�N\�\\\\:\�C�m\�9J\\)t\�\�\�\�[@)�\0^bD�\�\�9��\�\�#d�\�@�\\\�#v*Á;������dv��t�\�(�\rW\�\�\�\�\��<tQ\�Ķ�=&A�צw\�ǎΚ\�wO���ڢ+��d�|#\\�\�yr4Q��\�էO��b-�����hP��#�MI~�{\�V�2\�\�4\�ѥ�\�f,h���,�u���Ȗ%.�sW��6J�\�P*�lP\"�\�h�q\�$����\�AaS\0GxE{TD�8�0@>\��\�h\�\\�\";\�\�\�R�\�w\�#��3���AU\�h)�ׯO�mtF1�\� fMhgc\�c\��u��{B�\�.�XMl\��^<\�Cx\0\�`�/\�\�8���mc\�\�0z@r�\�\��j\�MUx(\�F\n�Ɓh3�ߺ*d�Y|�Q�汱qNHr1g\�\��w�\�,U�\�I���w�}-,\�n�\�(NyV\�*\�h?�W�\�\�$���i��\n2$\�n\\�9\��\0 \�`�\�;\n\��qpu�1.\��\�Y�\�(\�p)걠{s\��,,\�\0\�3\�\�����,\�}\���Ƌ�\\�T�����J-l��\�\�K9f�O��\�5\Z�\�@�~X5ж}���\�I?OʔN 1q`57}Oܫ�-To���g:/�IB\�T,\�FTQ\�g2<�\�\�\�@�\��2u<\�\�>�dy\�$�Y��@ۭ\�g���b,_q(?�p\�bHו��\�\�-E�-\\R�\�~l~�K�\�\�aV\�[�}\�\�q55�ڛ���3CM�-\n��\�7`�%10�nƳ@d\�A\�on�D�&����g��D��	Uz\�@\�3�8/@Q4�\\\�|v2������Bi\�ilO$��\��\Z/\�\0�mU\�\�N�jj�?�j��P\�\�Q�l�֔���\�\�\\\�ÿt\'�zt\�ݕσK;h߶\����XQ���\�žİ�k�+\\+?�\"p��XԊ+T�\�\'!�\�\�\�l��\�K���Ǣ2\�p������7���m�!ep\'��t\�OgU}V\�\\\�\�]�f\�\\�^�8���\�[�Q\�\�}.`)N�\�X2�2k�g`\�\0��QX2�\�\�\�V\�j�Zm��[h\�W�h�HS��\�ZPgɧ\�S����ҟ�8\�0O6��?u�\�\�\�\��.Phg�	�n�h+�\n\�\�ܖ\�\�r�\�\�S�&��l�͖�t��4]0B�\�v\0��cw����<��0�~>�\�\�/�\�\�Y��\�2�\�\nm\�\�����+\�򃫐\�U��V��_�\�\�~\����h����y\�\�.\��p\"�v.\�\��&Xn\�upT\�\��\�m\�E��a\�\�j��\����\�V�#�\\��<�����\�ˡ|$��n\�\�ݹ�i�\�HvO\����r\�=�ve\�zb�\�Z\��y6�m�\�@A\'��B��:�s�^@x�Kb�s��P�\�}>/\�@��\rv6\�GZr(q��TLH\�ҞB\�\��Uyﲛx;Ʃ����\�$K\�\�CP\r�\r\�\�?8��D\�e���\�o@\n-G�����\��bo)#\"\\l8D^ Ey��U�\�\���~�\��c��aT��y�]\�\"\��1P\�GBU��9z�(\�\�n5K�ZF\�gj5���Т��AH\Z|\����N\�~��.[\�\�ޤ:(�@\�?�u\�8q�\�4i\�uTz^3+N��((�\�\�g�\�s\�\�&ƭ{\�\n\�\�6q\���\�S\�F|9\�Mv�\�\�*��\�\04\��ՠ\�\�:�+O���2\�B CP7�\�>���\�h�u�X�Om�pjI���<;\�Ҳ�L�M\�n\0\��y\�fDXRʭ�\��As7tdm��]Z�;�\�\0��U\�3�8��QQ���F��nnwh��#\��<Iyq\�1�*{7$��q$+t\ZV�k�?\�[\�($�zӶ\�Z�\�2cNgVwqc\�\�%+��Xo��m>~icِ+5\�-T`�#�^Ah>\�\��ő`_\'yC\�#�a�\�g�\�Yn\0��~Л�dJD[\n�u\�m\�p\�[�\�º\�\�\�מּw\�[e�|����$.�;�\�\�\�h�1J�\�.�@+^o�\��%5\�[�\�qج\���\"�q�n+ZRR꡵�t\�H� G1\�K��\\$��a�\�=\�\\=0�if,df?&�R�3Ty9a\�2\�r��I(W\�?J�5\�n\"\�\�!95Qv\�A\�޵\�.�\���\'?�j\�r�Tq0k���Ɇ�.�]y���2�\�\�$+\��W4�~;)*[u�����\�W�\�_i\��\�ٸ6�4h�@�)\�b�K��x\��\�NK��H�T!�Y�\�e�2�:�]�k�\�\�\�\\\�\�t�&\Z�-L�\��:o��a\�/��%UϘs�X\�#mkIk�E�Tnf��#�N\�_�R\�S�#�+Bp֍nM<\�F:nl\�%�f\�<�<\�ɚ�\� �UN�ǒI8��j\�%[ܱ\�d\�\�\�]� D֩\�\�_Ew���\n�X\�`@~3�O@�Y\��\��\�[�\�\� AQף�����\�\�jG��.@�\�ho����΍ߏ��\�K_c\�j��\�*�\��.0�=���\\)\��\��X#�\�N�_\�,Rٜ���e�8}-io _��\�\�i�\�l�1��Kq\�rڱ\��֦6.V���V\�pb�%[ /4���\�4t\�اWX�m9:h��\Z�f����.o\Zb\�g�>Y\�I�va{2�\��\��>�t�\��&��\��\�Ű^�^zyj	o\0\�[j�&C\r0B��nʴ�n\�k�\n\�r�O>�\�W\��$>�l\�S\�4棶KO�\�\�\�<��hV�D�\0�\�H3\�]_\Z�+0f��_��\\L3��C�\�\"%LA�M\�\�\�FV�ڈf塧�B\�NQ���\��\�\�m��q\��:7\"|\rV��g�\�3\0��\�$\��Ô\�\�r^v�Nq��z\��\��z�:\�\n���sNق��+\�/:\�\nN�\�p;�<�����B@zƁA���\�\�`��v�g\� �k�� �\r\�e	Ե\"\���\���0�\'�>�D\�fa\��t�\�\��0\�\�?�\Z��~~,�&uꦩC\��:�q�.�\�H~��/�e��ٳG�\�-\�KY_��3C��\�\��\�0\�Td���\�\� �x1{\\L\�+\"�T/�;iKl�\�m��B���`�k��&��4�4�o\�>��\ZO 8Wi�.,ZE\�$�����=T�9\�nmW¥{\��!>߿Ϳ>>\�:\Zd�\�\�|=�r4�oA<��\�1y3\�-r\�!�I\��A~N��\�X�$�u̟�\�e3�\�PD+\�\Z-�\�M�;C+��\�޷\�e���Ws�Pnϵ�a\�G{��\�\�a(�JYH�u�\�\�,�h:�\�9_m�\�\'\�P�~�\�6۠\�z,��\�������\�Ր�DU�P+y\�a\�ȷq\r3M���\�\�-\�8���\��\ZP�\��[A\�`I��\�^1�݁\r�N-\�\�z OJ\�\�%;\��d�C�\�m\�\���EM\�\�i\�sΡ\��[T ��P3��0,��Sw\���\�\�J&� Z�E�2�\�\�\�\�Ҋ�ֈ����\�A_��X�Aͯ�2؂\�{�+����M�\�\r?^l$�W vC��ϰ|T�a#Ov\�a\�\�`���\�S9�����fe|��5��ݓE)b\�K��ry*j+��]A�0\�\nSP\�Ec\�\��|s\�\�v���u�tL+�s;���ԧa�S\����E�dIIJ�SQ����{\�N�� �\�5�HL$\�`!z6\��\�N��l���-�\no\�\�=\�\ncy��~[�x9k+\'\0�v�\�L��V�|p�z��\�[�Ձ\r�\0e\�I&jl�z\�;[n��#5�\�\Z�Ќ�N�f}�J\Z\�\�N\�\�\�\�\�m�\0z@�\�\�wn�!H\�,5�j$SH~묊���h.�3���8\��d\�H\�픤D�\Z8Ao�\�F{DLsyA�\�i�\��Ǒ�88��\�_�G��e�ye\�7�×+�XMvݐ�\�˘:fM8;�n\�!-�^��\nˡ�,<Q�c\�[]��\�\�\�>�F<�ROY<m.�fC�1)L\'3��7\"\�#��`1�8t\�3OJr�`�D_/qǇb��/���\�Q���Y��B֑G�I\���\"��+�;�8r����`�A\�M v�0�7\�\�\�AO^�C�l\�\�\Zg �;x����x\�\�c\�d\��	_��4\���:#�\�Ҡշ\��_�:�\�\�\�z�s\�m��qF|�ftf-�5\�\�{>���It\�\�Dv�\�\"\�FD\�e\�J\� �C6\������^pQ\r\�j���J�2`�{�\�\��:n�Q_�,Ż�=PF\�\�u}ޱ��C\�\�\�Y�� �%F΁�H\�\�\����?\Z�wT+�\��M<(:\�~�(����#�Kz,B\�\�\�v�\�x/\'�\n�zZ_\�@Ipb\0C�\Z!9n�˟f�߂v>�^w�nx���\"\\��\�\�&�c�.T�\�^Ź�\�\�\�C3OqI��\�\�\�4[ⲱ�7�\�\��\\	O��\�/���T\"���,���\���/��84k�6[x5̨�3���q�e�(`\�4\�\�\�\�Pd�\'�\�\�r� �}ڲ�\�5��1�J�A�>�2 1|EC��eq�4�%|����\�\���\�ç(�\�~#W��\�eM@\�4&�yQ�X��g\�\�	\'�\��o�/���>��\�UĊ�\��a\"ִԋ�&�Ϯ�\�\�I�\�h\�)\�j�\�k7�\�\�a8E�H���W;C�Y�7v�x�\�\�~�p(.ڏ\�B yD����<X\�\�f\��� \�c_CG\�7qA\�W(\��訤�\�t\�GO\�l�Veh�JB9\�_\�5|\'�~��I\�&J\0jI\"{\��x~V\�[����\��#A�\��\�\'\r�q\�W�&�l\�M \�d@�Ѕ9�\�e��\\\�\�\�N�\�\��\�Er�\�)ʋ\�f�hQ[\�\n�\�_�5i�B\�n	ʡh�����y\nI�e�r�$d�ce\nm�!\�G�� @�(\Z\�\�H��<m��k9?#�L�_�+Mف5\�\'�\�F��V \�Tt\�H\�\�Ⱥv\�l��<?\�O�bFP���y�QBa;��E��r�\��\n\�bp���^kh5��\�Fs0�S�`]+k�6˫\�T9n0���3/�\�\�\�qS=3\�\�\�\�g\��T�(�΂\�H\�n4�$��Kv.������\�Zqy�X2\�\"-�K\'E5*�\��v\��rC����p?\�n��g\�:I�[��\�Z�C=�u�\���{��S\�\rOB%L�j\�F;�eL\�\r�>��Qd���\�\n\Z\��\\\Z󶆁7\�\�)M-�\�\�ʶ��up՗�l\\��\�C\�\�\�\�\�}N7�z|�\�)\�B\�\�M~+\�{Ԡ\�aeiaH��n��AN�\�\�\�R�6�@�г�F\�\�\'\�uK[5D`�\�=	\�.N{\��8�\� \�OXvOv��\�\Z~T\�\�l��\��\�mAePާ�\�V+\nZ\�\�gq�ۡ�\�\�\�3�\�M8\�\�z\�&�\�\�@��|f\�i\��jy\�\�\�\�f6�Z�v���B� 1g� {)7��oV�tCg\�`z\"CA\�Z3�p	�05\�W�;\Z�sAB���~T\n{�����ϡ����Խ�4;�\�\�8W7�0\�\�[澅\�n����\�\�NY ʨ��NA@��v\�6�ȩ\�E�rma��\�(\�1 �̈́��(�h�\�M�4\�J\��J�e\�S\���G\�\����\"��\�k@�tu�nHx}i܁�\�\���\�5�n�UC�7q\��qU�*0�:�\�;&�.�L-\�P�q瑚s\��<S �s�4��^�\�p�\�ّ\�`(� =Dc\�\�\�&���㜬�g/g.\'|��[��}�@	\rs\Zx}�$S�\�\0c\�?$8�̀���\�­\�qHfs^\�\�c�kO�t�CBr�A\�n�\0pw�(\"ܵ#\�F�TjQJ�\�W1�Z|tk7:\��u<`�H\�@Ez��q��\�^�{\��]w%�\�&�\�iq�bח��4c\r`z�H��:>�n��/��3�\�,���\\X-\�\�}�Nu�\�o\�a�0��8ƻNYb_���Dw�!9�6\�d&>hX\'FH\�1\�\��\�a˨<J�Ũ֜Dw�d�`��8c��\rqHإ�K\n?/I_�H.�\Z8�\Z�	Ҋ\�\�T\�t\�q���Ra�d�i�\n�\�|{]b�k�5�\����`V�S!�I\�A]I\�\�E�J��=����)\��F�K\�\�v��\�y�_TH�&߭�zG��\\\�p�+j�\�\�\�\�.u\\\�\�\�)�E��\��]<iN2^=�.ڗ\�Ӡg\��\�]���;��iĽH�Ҩ*\�@S[�?\�O��Zg��\�n�H��S\�ޭ�\�~\�̒�wR�\r��0T�M}�\�z��L���qd^/N4\�\�\�C!\�\�*w\�w\�\�\�wv�GU�&ݍ��A�Fu��+٨=t7jvB\�\��(k��\\Xp\��\�?l\�f;-X���JFw:mefd�W\��=/t�/�Z\�&j��\�7sǴ\�*9I!^\�cC��N�5�n�\Z��r0k&�?إ�\�\�:���Ɣ\�\�=R�\�oW���n�I�绊	W\�W\�\n�\�`\�\�\�Y(�\�9�/�%�Ad\��Gwn�&I|�f\�\"��%JRY�UN\�Ac\�o�!ז�\�ҙ����g�\�)B���s@^H�9�N\� 8�G��L��0\�)��(�qߩ�_\�\�-\�Տ\��\�	\��\�\\ҙ��Hd4�bS�ݶ\�:/���-���n\��\'?����<~2_	\�\�@!5\\�9R?E���g7MoPPׇ�\�ch<\�fB\�|\�\�<�\�d�\�V�9;\�\�2�\�Z�\�\�\�\�[��&o�0dq�\neb��4\�\�i�s\���f\�\�z���q�6����J4iV_\Z�ͩ�e8�w��M9 c�)\�h��\�\n\�\�@\\rw\�\�EG����V��o\�Z,EN�\�Rˁq�����\'_\'>{9\�GH�\�h�\�q\'\"�f\�\�h�\�c_�Ǧ/ܰ˘m\0;5V��r#�U,��\�[Rd�)y܀9o>;Es\r��V٧7Xv\�\�\�\�\�z�\Z:w3\�Ƕ�D\��U\�@w���Q͠�\�m\�$�{$U5�C\��\�\�n\�B�m<!�?\�\�g\�\�\r�\�\�L�_�W�\�p��S\Z>��\�I\\��\����\�I\�{3$���dn�k�\��M��݃�\�@���x���d\�s\�\�^�\�w\��<�1\�#Cgܰ���7p}ٺ��g,�\�\�~\�PD(\�=V�!�^o%,�l*[)E����H>�	\"/\��{��o�=�n���\�_��Ӷ�=��\�\�M�\�N\�Q�h?\�\�8\�i\�h_\�pQpQ\�\�\�9G������y\��ߎ��\�ҝ�\�\rN)<kD|W�H\�_3\�\� \�+�\�������Q\�wn\�q����>�3�C2\�rm\'f:�D\�\����	\�\��Wޅ�e\�ɻ�(�@�\�ڔ�W$��\��\��r�O��	چ\�_��ф\�e�\�\�4/� \�O˷�j�\�%\���G\�7�L���Re=\rG\�\�W�\��{�!y��~\�u\�Gd�\�ۘ���=��\�\�abD\�\�{Fyl	͵\�ft;�G���\�#[\�\��֐FA�\�\�\�톨\�ޮ��\�=1UE�^\���F����B��u}\�\�\���_�\"CY\'�\"��/|iA+o8\�S\�nД(���\�\�\�Dd\�\0=�\��&��v�\�ݧ6�\�-�b|�&�n����\�\�\�i,ϸ\��dk�m\�̿I\�2R\�у{XӐ�\�]P���`]�z���2`�����X�94No��u\��\�\�er�yɊ\n\�K\�(\�*���M��u2\�b~\r�\�\�\�E\�[Vo6R�ZCJ{�}f�Y����\�c\�l&�{U�\��O�\�3��\��\�a\�o�İ#�O�Pg��\�U��\�ض�\�7�<\�o8g���_\�(\�&� \�`t��\Z!I\�\�vz.�\�\�M�𷙙9%�c�\�v�B�\�\�~J+UM?\�\��\Z�a5^k�\�\�\��\�\n��\�5�Ɔl�%#���) \0\0��\�\�」E�.|\�MPq�D\\\�\�;J;R4��\�\�× K�eӜ��p��D���{\�с�ݽ���%*��\�\�\������\n3�\�\�倬T�e.Ms\�\�)@��;[<\�-\�\r��$\�sմ��]^\r!�\�+�ꈝ���g�V^���o�0�X�\�2���\��\�$�ꥀD2\�\Z9��Al@YS�2��\�\�x1!\�1�\�i���c\���X}���E҂\�	&A�J�W\'1\��!d9CZ\�\�x�Y�^�\�p�?\�n�\�\�=CX�\�n\�$z���3x\�\�.BȈ�i��c\�V�ׄW��i��2�S\��j\�\�\\V\��M����s�\�S~\�����;}\�\�Mw; �L\�/\�(\�bh\�o,�\� Ș_�H�\Zi�Ѱ\�=0\�en��`�F��h���\�\�6\��k��Dg^�}!\�28\'\�H�D��^\�Ic5��-�\�\\BҔ�X��=9>\�\\HZ\�{���-5����\�\�\�;SR�\�P\�\��DGΗ�f�ԃ\�e8\Z\\j��i�@Q1��\�~dٶ\�(\���ZO��4�\��\�G�<E\��d%b\�P�LiW��\\\�l_,x\�^z\��O�t�78\�\n<f]:\�a6�x��5\�%\�~4�\0;\0q¦a��\\�ND�|\�=OU\�\�\r�ح|��\�#\�\�\��զˏ3\'\�\'��\�c�r�9H\�\��)T\�=�}\"\n(@\�eWR\�\�w|�@֏\0h\�U�\�?}H$�\�L0RP�=ᾪ��)ݘ�!�A�l\"3�K3fh7Fe\�p�e�\�\�I;�cU�5(�dN.\�i�p$\0u��\���w3,/\�l\�FO�\�r &U��\�欸\��zco�_��2��B�\�\�����!F�A\�2%\���S�	�$�\�\�\�\Zi��\�X\�\�\�⬕Q\�[\�\�\���\r�K}j��M��VZwU��xr\�P�b�����8�5��� j\"ϟ\�߉�\�\"&B�Q�\���3�K�\��\�\��7�\�=3o�N�\�%�\�\�\�\��U����j\���\�u�\�-��\�(�\��pnb\�\�đy\�-\nhi\�\�00\��jw�\�	#ǒ.JB���?:�ʳ{秎oS\�9��2\�n\�ٵ��{�C\�U���w\�!-Mx�\n�oY\���A��\�\\\�q9Luz/�F\Z۵�V��\�^���\�s��@�,v \�\�Jv\�\�\�\nh�\nZ�J�<\���\�*Dc��\�\'����7!�IS�Ȍ\0��\�\�O\0{�!\'�8�J_^�L�Z\��j;P\�\��\�\�:\\\��jۢO~^τơ\0��h�\�y_e�\�[��\�\�c��ɐWV<ZD\���3�\\�4�\�\�RE\0��\�?��\�x���#}#ص�)}\��\�\�f��H̏5�����\�\�ag$\�\��σ/i\�;�D�\�ި~��oצ���\�,X\�\�GQ\�8�\�\�fb\�*�Lf\�\�a\�\�̲m!OD#V!Y\�9v\�h�<{Dg��E]��\��\"|\�\'��S\����\�u=	\�hEMC\�\0^\��1#arŀ��T?�i\�~\'\�1\"\n[�~�^;p�\�3��{R1����a%\�V�\�i`f\�B|c<#7)��g��_�u^��<��΢9ΰ\�\�	�7q��}D7v5�aa`���\�0��`\�:�341�\�\nG�xw\\�˄7�oE��\�\��\�+\�7�6Y{��o�dZ�s\��6s*��(��Z\�+�rgE�\�=\��~WW\�D��(��t�,��Z\rF�\��B�\�\�\�-\���s��\'�*/�\�\�y�I��\�Yf[.l�4�E}Ӵ\�P\�(��\�U�c �6\�絹��\��[;Gs\�\Z=\�\�e\�	IC\�\�jO{g \�w���/\�y&�\�\�#\��9Z�x\�\r\�<C�ϙW�o\� ��	�Q[�\0\�[�+����JZ2�@�5�S\�������\Z\�\�\�xm\�\�\�H[�Б\��\�x�bM\�zTj\�[�x�%\�\�:q~L#�:��K�e��B8U^ˈ5�\�WQn�:a����7f\'\�Q���\�a�r\�5�QL���M���}C\�\�b5lS�y]o�ѡ $̧+\�!~y���\��,ȶ�`t�\�P�\� \�q�\����B��\�߿\�����K\�&\�C�Ӥ!\��Uw\�]�>!Ŵ\�!�c/ܒ5�5Z�8�\���Y\�\�Sb��\\��\�l��_�\�eDi\�ca�\�ʷ\�l8���/z�|)q�\��\�\�m\�\��\�\�=\�ٷ�hVg\�S\�H\�\�\�\�F]\�vC\�hL�\"���D\�\�Y�\ZB��yWQA=AV�n1+��3SH���2�E�f�Er�h�l�\�T\�\'~�[���\�Ћ|\�\n\����z,��E\�Ϟ��Y\�J�\�tl\��\�Y��m�\�:\�\�\�eڶB�\�PK,����\�u\�[��v�(�\�f\���\�4}~{]69>SX_\�ԏ9\�\�?JAn$�\�<�1�\�i!\\�\����MèX��v�W�\�n\\띠�\�\�7�8�\�\�\\DX\�:��,%��TQ��#MY#��\�\�J�\�x>��%l�0�j\��JK4M�@kam���Z�OmUT���\\�@\�R\�1כ�\' \�pO�!\�8��\�\�\�\�ZR\�HX\���ޠ\�\�\�\"�BU.i���S\�A\�,��\0\�np�!:F�]6ݿ\��fC��\"4\"\�З\���1\�C׆\�\�N1�j70��WÁ��j��l\��$��2.Q�e�9�\�\0yc �q݆v\�8*\�߮剰�iڦ]U.�\�\��Z�i0ȅ;\�9Nr�����4��Яyړ��\�,^F��8�\�ب���\�4{t�G9\�\��u2\�R�!��!�` f5y.q�G^J\�u\�ZҊ\��E��L.�:=���\�Y�S\r��݊:*\�M\�\�9��y��g7he}c���r�L�\� ��#\�e�{t�f57^>�Z��hU8�\�BS�	\n��\�&�t>1����\��YF\�\�q��ʏӚ\�\�\�\��\�#Q���F�J���+�~\�\�\�0\�\�Jw�$�SĻS�v��\�m>��Mgե��\�,�n�\�\�\�(|Ҝ�M0,\'$f�}1\�r�\����h�B\�\\\�h4H����\�\�Ǟ�K\�\�\���A>GU����\��\�ޗ�`�v%H\�,��\�!���V\�������S>�67f)\�үwV8\'���h��u�\���SQ�Q���\�\�p\05��\�Mq���\�9\�!�,b�\�mu�\�\�\�]l��J�6P8���X�\�ⒽL�\\�ƙ�@a�!骗\�`=3�\Z�+�VC\n����`�\��(e,f\��q\��A\'T�E��O��\�MfC��\�l^\�Qmm-�\�P�\���%lg��\�~�\�?�+^�\�ҍ@\0\�#�K)\�_\'\�iӎR<�\�&D�f�N+\n����\�\��yk\n�˓l)P�\"n\�&�B�?9��o\���\��\"y�\�\�Zk\�F*�5\�8æN�\�9�n��\�\�]mk\��۬�\�\ZgB��%cjr�Ls�J#�șI9Ԓ/V\'\Z\�D+#\r\��	1\�\0�p�s9��ivs�\r}�r�ᔔ��������Y��P>�5�;�Ü\�-N\��X�e\�\�X%�H�L̣���R�\�ї\�B�m\��f\��X\�:S\�I��ٿ&Q\�WT\�\�g#�\�NR�p�C�r	\�\�)1{Ch�a�1E\�7��ܳ3U\�Z�S\0��\�U�<#�&\��\�\�/�0�\0���_\�i�t\�Rh>N�\��9��\�ag\�;{�\�ֵ�Z��\Zjo\r\�D_-\�\��\�7�Ȉ 48TX�!(�|k�\�u�\�^\�x<o)-�߬Q��;���ˆO�д�}7��@?�\���\�\r�k)\���ݭd:c�h.L���\�UP�>�%�uj�Qߝ3m}KY\�X�\�\�\�Ɨ�|VU��n���QaF�+\�\�\Z�\�ɫ_��\� \0m���rd����S�>w�;��P�5��d�\�\�\�\0�\�\\��Q\�\�3E\�Д��n��\�R�\����\�l�\�?-��a8\�4W�pvӞ�C\�^B$\�l\�\\���Ց\��\'�В\�\\���\�&8\�#\�I\�\�s\�K2\�\�u9�\��\�T�ar1�֝\'�\�f�\�A�I�Ja\�\�$`\"4K\�\"�B�,[\03;���\�4\�&)L�\�A̯)6�\�\�2�\�\��d\��(_*F�+``���\n\n\�p\�)-\�+b\Z\�\�OxK\�\�9e��tڈ^+\�\�7\�8��8�i�d�\�+v\�X\�	g$�@r\�G�\�O\�b1��F�\�&�@L�܃�񮆲��z<���ٲ�\�\�0\r��x\n\�\�Y߽�� U�<��\'fw�&t	�\�\n�_!\�\���\�)*\�HJUS�H\�=$\�u���E\�`eQ�=eO�+.5�2J�\�w�!J\�I&u�>u��f�B�C�$�[X��\�|\"��\r�S=\�\�G�Q��\�\�\��>5��\ZEQ=�,	k�ЅX\�>𭄋LO�2\\m�g�Th=�\�! \�J�B�\n\�\�J\�K_��zJ��\�}��\�\�7\0��EZi\"O*\�e�\��\'����\�k�c\�#�wق��\�b�\'�-j\�\�^E\�!l���\'pp.��4j�\�E\�n�\�	���.\0_D�]\�p\Z�eM�\'\'Ij�DN9I�0�[Ag8P\�Փ\�&|\\Ց]�:\�D5�\�K��\Z�ܑ>J~�\�Y��g�\�x�,9�Q�A�4E7��$�ڝ�ʑ_]V�\r~\�\�\\k\�g(�t��xD\����\�\��\�\�)\�7�\0Hӷf�?\� ��@^~:�M[<v�W�EV>\�b\�?R l	�\��h���0n\�0�7��\�=�U?I|\0�%\�Vw9�\�ʱ\��\���s��Z\�Oϰ\�E���\�j&\'\�\�4KF�2(�9�;�FZ[\�sYn���\�5��h��\�n}9Hp�A�D��yKd\�\���:\�\�\�[��\�&~_�=�ڨ\�jWN�e�3\nʧ�2\��k����N6#z��9x��sL\����8��\�jP2\�R��\�\r�\�ߝ\�<�4\�|\���KHM��o\��\�b\�Д\�+�Pg�uO�X�\�t\�0[�\�\�3�9�\�A��#�A\�i�E�\Zn��/\"r \�1�h��\�7��\�(�\n���\�\Z՗ ئ\�P5�u�|\�,$b\��Y\�Ǜ��h#�����\�O�Y\�9����\�#\�\�\\Xl���,=]��)\�246�Q\��\�\'R�H]Od\�&]���\�j\�.�j@�d&\�ۛ\�\\^�?i�����-z�\�QP>��vX�K\r�O\�bS�&wb\nV,!a�k�V�KS\\\��;�9�P�s��<࿠8\�65�]@ \'\Zd�\�\�N\�̤�\�%�\�����o�Lj.�\�����-\�\�\�ݭ�!���u\�$�&�ؗݕ/������I�b�\�\��M1}*�!\�\�(�(���P���7�ۻwb�z-�\�G�4u��j�RUel\��,c{_Є(���?\�^\�r\�}\Zv�X@��ʦ@��ė)��l�R��F`����\�\�^�H�ܙ�8���[a�\��\�B���&\�+ ~�~`C�\Z\�\�9Le�UN\��\�E�$\�=�]�\�&/7�\�P�=�No�\�\�\�=\�3��~�P\����ѮⳢP��\�/\ZT%\�D\�\�b\'��,\�j�^��&C�\n�I������\\;�\'���\�\�\�\�\�� A�B��8EIBZN�=\r.\\q��-\�\'����Q\��&=�(4\ZX�I3��J\���5}9(3ߎ\�\nPV�����8�h\"߼�\�\���jn;�ߐ:qf\�/5�\�v\�WCfNU���*\�B�.z~\�\�/�5$1\�-�\ZU��}b�\�P`�!\���:���\�,)�\�y����s{�\��\�Z\'x)\�)Ͽrq�\n>B?BP,nF\�\rya\�\�ȳB\�.F�\�H�\�\��r?-W�0�\�\n\�܆\�Qڸp��\�W�\�:Ǘ�\�\�\�.\�w�.\�\�(�q�?U\�X�idF�T���%8\�²\'\�\r8�����2�eY�Qo�lJ�=�G�\�&ʮ�\�s_�\�P�\�\�/�\n^Ƥ\�_f\"��:XA?\�\0�~)ٿx\�8\�G\�e�*}��\�`@ޗ���\�\�gu\n{?������!]\�\�S6�\"�OQ�8w�J\���\��=i�l\�y\�\�<\�Lz\�%B\�է����j\�ߵ\�\�X\��\�\�6c8�ܚ\0\���t1wu��\0��{�\�<;�\�&��1\�97>x\�\'3x\��%z2 \�C��\�\��J���\�J��⓾ǂ`���\r��֕ۿ\�\�Q���\��_�Rv�\�{(���l�\�\�\�\�\�,�x�j\�iy\� ̆:\�&\��^�\�S\�w\� �\�2���9P�I7�\�a]]����;\0��70\'�EZ�8^[\�\�\��\���K\�Ml\���DH\�\'�\�T�\�k���N��=I@��H�d\���v�\�J�\�<��J�\�A\�̵�omY\�5\����F\n΍\r��9\���<jT�}-.\�[�LՊ{���Z��^�+�.\�X�\'ְ=�\�d�Á�Y\�\�\�Qm\�y9&0�\�t�\�]\�\�\�\��k&\�uY��\��FG�\�\�v��>�Ҟ���\�g�av�z/�7T\�\��c\�\�b��o�2׀^�\��c\�!K�!�!S�`H5\�INɉ>�\�;0)C̿\���\n{\�\r7�\�{5ښ��!�0�|�;\�n�\�LvV�%��\�W=!�m,X�=�fK�>pL\�\�2\�\�\\�]\�(�޶\�\�(`\�e@��%\���`�Q\�auRxG��0l+`�\�\�ķfLݞj�5:��3�\�\�\�\�S_l\��[Ɉ\�\�!\���SF*3\�&�;\���\�oQK�j�F�� �-\"���׹��T��҂�\�\�V+�+x�1?������\'��n�*=�\��f��Lu\�M&\�\�7\�k;��V�K�l�}��\�����DITc�)DR�\�\�M\��IfɛA�\�N옸;\�b\�3=W$�\��]�cOS\��lND28<��9Dn:\�\�]lXt�\��\�YϦٛ#	XF\�\�\�\�D�$ukB\�8zh�+���\�X\ZȖiM�LU\��x�z鳊�a���9X_w�;��=;�\�Ы�\�\�g|��?g�\�\�õ�A�׋Ξ�R.\�R\�\"|\\\��f\�u�7�y%�H���P�kM\��\��\�L9t9>��HaV�\"\�ˣT���� Y�.L�\��i\�{_�u�D���Z�	[7�\�\�\��-�ԋ��\�n��\�vT#oZ�ՏL\� ^�<��\\�l~\�\�\�6p��u��ӫ\�\\�l	\�x\r_f\�Xp�ύ�7\�\n\�\�å\�\�}x�X�KɆ�K�!\\�\�~����Mg\�<p{�A��d��\��C�\�%�\����}�q\�\�\Z�0\�j\�\�DG�����ӴP�]׭`u��1%8\�\�*X\�/�o@\�E��N\�=���<\�R��+��\'�:��L\�\�YC�Pkkm�\�\� \�D\��\�\�\����W\�\�>�p0�\r\\\�/\�/N\�E1�[�\�{f�&�gLXrЖ���H�@{��\�wfm�MB��$\��H��S8\�{�����7Q���Y�E��j	�\�5��ߦ\�\��VD\0�\�\�sna�fQ��#\�/���ٳ�r}\�\��z,�C�ΰV�h�jS�\�t��?(\�\�\�mn\�\�\�\�\�p\\b\�\�:���O���[9�9j�L:�\�\�\�Ҩ/`\�W)DY�\�u���fC	3(o^�\�\�4�T�{2[�j\�Pfe\��\�\�	�BGv\�^\�Os���>�\�<��/%Ќ\�\�\�\0\n�2���\�?�m\�~@v\�=0?˥����^\�\�P��3v�h��\�K\�z\�C��Jp\�f-��\���1\�զTp\��a\\L\�}Bǁ�v�\�-\�\�\�v������z\�1d��\�W-[�\nC�\�Q,\�Q�\�\�^�\��;pKV\�+NAإ�\�O.7��j�\�\�z;(_4O\���\�Ŝn�b\�4\�u$\�\�j-�v\�6μ�g��x:2Zt?C��G�+b�\�u�\�-�͑�?\0ާD\�K.�Ev�{ehWKeiy�\0s,]�͈;��hQ0~pt\�L�	X�MR3t*\�&\�\�K\�\�6�\�%IL|�\"_\�3�kD�T��cP��L�.�νǯ4\�\�\Z\�\�5O��m`���-R\04fiC�\�u\�AN���\�\�dÆ\�W�R320}Q>W\�x�u�pM�\�݂\Z��h�n;�SI\�������\��5jvu\0צK\�O\�NS�\��/�,\�,�dA���AY��8����[h\��翿y��G\�\�\�K��]*����Uݡ�\�g\��C�oio#M��lѧs{\�ڐ\�\�\�&aICƽ\�o\�z\�\�݃��6G�k\"u�Hކ|\�z��IA��pY�<?�\��\�\�2\�A;ݵ��B&�\�n�\�[.���\�}�C?�^�1�\�\�1��\Z-`a��/N��Z�:+�\�l\�cp�\�.�N\�Ll�JMf�\�\�	�G8\�\�x6\�U@�\�kM��qK���p\�1�$Y�\nV�7 ��!��\���\��\�\�)1Kqp�{TtTZd˒�o\�GM\�ֺu�`z�P�X�M\�.\�<��=�.��e\�X\�QD\�aI][)h\nr\�S�F�5��\�	�5\�#\�\�p\�\�f:v*s�\�zLN�:���\\>#WE;Q\�e\���\�������\�\�|&T\�7K:0$��}�`\�/\n�N�!:�\�,@�����\�d�֓4�\�\�\�!`\��\�#�3�J*c\�*1YmYe���v0\�!�K�S]s4_{.A\"��\�\�hi���]\�qש��˚)�\�V\�\"�Y}���R\�$AKB����\�zQ��\� �v>�c\�fi�|׀�?��ۗOG�9)\�)nz�\�	��z�\�t�H\�$�뉷�1�8�\�>�\�חqMT|\�\Z+� `\n�Uk\�H\�a�f!\�e�/�\�\�ܮ��\�_.^\�@��J�����;%\�)�ܝ{�\�w\�\"==r�|!��3��V�-ֺz�\�\0�\��aZ����&ǁ�ZPKFν����^3�Bg�O˧L\0|�Xͧ�5\�h�k\��B�W���p�,GX\��r�\�\�G�\n�\�3\�y	�V\�\�/\�:�\��d%/ihw\�\��p�A�\�U\"]r\�\���\0$\n\�\�D�o2����:�&_Cj�&l&s\�w��\�\\\�\0F[�ekv�\�:_��*c9q��\�\�@�8���:4�\�cq��yAL��x�\�Ļ\�\r����\Z�cM���VR�\�\�e\�1=\�\�f-\�\�4t\�i�Ծ\�\��~y\�\�i�H�8�@�0\����*\"Z\�\�\�<��\\\��5�1��\�\������Z@\�\�9����1abEP�\�\�IDf�|�<\�z\�Z@\�<W* \Z~�[֟�g\�\�aoq>0�28\�a�lˤt\�͑\�\�\�\\�\�q#���\�\�\"\�>Z��\r�M.�\�c\�D\�\�69�\��Mx9�=��z+\�\�`\�\��\�$\�m\�\� ���\�3R\�.��,���`	k-��q�$LǞ�Jz�0SJ�\��C�\ru��ȶ;\��́�qf��\�}\�\�&,�+�7��\�\�\�\�Lʹ&\���UZ����u\\��\�4b\�)�\��7��u���n\�\��j}}\�\',j\Z���.���Q\��0�Ja��0ې|\�XE{\�]	��b��\�~;A\�֨\�*?BJn�ܠ1�)˹j�)�\�\�k�\�H��\�2������ב2���\'�U⃜tSpa�_\�\0y�+b82�\�0R�\�\�)1��t����\�\�Ug\�n\0m�5bp\�j Ⱦ*�\�W��(rciCW\�	���[\�\�hd�ߊw�c-\'���E\"#�\�\��g�(�\�E,\�jў4c��5գ\�g\Z\�\�\�#⸞@^�\�	VB\\n�[\�G�k-�\�����i\�H|a-\�%�\�{��\�~q�\�P�fL��\�\�\����Z�5\�[\��O_:\���H�~+�\�Y\�3C�7*Ŗg�\\\�\���\�Q����\�^�=ӘH\�!\�d�\Z^vZ�O{2Z��ӫ�<U\�� ���ٵ�n=8\�w��N�\�2��{�\�\�`QV&�\�uQ\�\�0j\�}\�\�ۥ�ZMZ\nN�S\��f���\��\�%\�i\�l;0-Rr\�\�g\�3�\�9�D��\�E\�h\�ʡ�f�C³\�\n�\�ioEf���A)<	\n!���K\r�͑�\�\�x\��\�R\0\�a���}�\�\�\�=\�P\�P��\�@\�\\\�Q{{��Bn6�\��a��Lu\�\�s#�$sׯ��X(%\���:X��ً#\�\�Iz�~�}	\�L�j�Эzz�غy�5�n*��T����6�P}�\�(FfVm�\�\�u買\�4��\��Y\��D�I\�G\���\"{�K\�8K;M	��B݋$2Yw?�A�K^9\�k�\n1_aQ9zoX�_\�\�R�î��\��L�D��L\�|\�f��\�\��\Z/\�\�\�U\\\�	c�j\�\�A���s�쭾Y��+�\'+�p����w9\�\�\��`���%\��>\�=}]`hk�H�\n鑜\�ٚ-\�7V�_�\�^\�o\�H{\�QU�챘�Q\��)E-�J\�)T��ڎ�N�Z8�kf�g\�ļ\Z\�,�>�}�Iʾ~\�ѷ���a\�Փ$M.\�8�s�\"\�7��\�	��\�M&�\�u���èi�=�\�y5�+�\�H�^���J\�\�ȗLA<�X�\�\��J(Ç�Ve%�$�\�Դԥ�)���\�ĕ\�Z�\�\r@��\0%�T�m&t\'\�\�\�\�$oF0�\�\�^#[�\�|�\'�Z\�Iq�\�\��>\�\Z3[\�\�oS\�\�\�\�B.\�O�9\�Yw>�\�\��I☳D�<\�8��\�\�S?��4#�5�\�\rf\n��\�\�d��B\�\�^G�G����\�d\�z\0�\�\�BV\�_��\�4�\�u<\�=��\��W\�[d�Y\�N�H@v\�$o��aR\�n��Sj\�d�nN\�#\�F��\\8P_\��Hf{�Y��\�d��\"Z7}[A.O�%k\�ᥣ\Z�\�WQ��Z�E\���\�\�ut\�9`/Օ3[�Afz.h�\�@��~���2�À!s0Ǖ3�D�\rJ&\�{�l\�\\\�\�\�?[�\��\�N\�B\���=��1\��Q$��|\�\�\�%���\�xԷA\����j*+uR�	j�;\���#Qn#cDx\��D�\�=4P\�6�n�o��m��\�ʂ�^��[� g��\�]�ě{�?��B[\�\�e\�G�>�b\�i��\�\�\�h@�����ô\\�\��̨��L�\�}�\�e\n\�\�\\0\�\�\�~r�A\ZRN�\�o\�\n�p�%<�9\�l\�K\�@�]�\�\'l-\�U])�ݒ�\�.�\�\�eU]6��\�\�,A⡞��\�3Kq\�\���\�\�a)\�m�B4�6\��9�\���\�U�ި\�o\�� {��NV�����K\�lY�`i@\�\��\�\���JK!t-%��h�\�ɵ��}Gk~�7A�n��H�ԭ�z2	�\�C�.��-\�\�Z���A3�X����rN\�tƿ�>�}\��S�$�Kj\�Kcyو5	#\�eg<[\�๜\�2(��u�(�Ym٬X�5rs@�\�Mӹ�D\�3�\�-\�.\�\�N	t��OfΦy\�C1볚�^*\�Z\nD$��\�th9�m�\�`x\�\�ɨs�\��r\��\\����\�o\��\�@\n8O\�V\�J}�Ex\�\�q,Id�B\n���6�\�$�\�\�\�V\']�!X񄟫M��7�1\"�� �)Aq\�kqu\�\�<)�\�\�t�fC�2��F�\Z�\�\�^�#���A�W&bf�\�\�B�5�\�-r�b�M�:g���Bφ��]\�E�\Z\\\��FOW\�\\5\�dV��[gR=���1�[R�/��A�<����\�F⭔G\�PȔ��\�gI\�\���F\\��\�1���VH\�\�M3���\�\��l詳GNL��Է6K�\�}4մ� �\'%x�r\�+G3�5�n	Mk1z�29Ւ\\\�Y\\�\�\�g%��\n�p��;�8!�tYd;�y�j\�\��U�\���\�.�0jd\�\�\�8\�+\�W@��{�4\�῁�h\�\�dWs�vI�[�S٨\'`\�\�!�\�������\�\\;�\�Ս�����F9X�e�x{)�djg�bf�U:M����\�\�q{�\���)\�Xz\�%!%\Z���4Sg.\��H\�\'\'P^�^�#EƯ�\�?�~S�\�\�I�F^��\�k��+�\�\�/L\r�yD�\"3J\��b�K�ų�!د� C�̷�du\�\�-\�}�~�6�؉�\��\�ԁ7\��Y\�`!=\'\��\�s�k�۔Ѓ\�Y��:\�>yc�a\�\0cm\��IيA\�!j\�!\��Yvyfj`\"@6.�\�\��`zD\0����g0\�p�\�\��]\�3��2b�\��ԍ(H�J\�2�������\�y\'\0������Y\�h>�^\�|\�M�R��P�ҡ\\Ԃ\r΋\'\Z�ø�!tE,���\�\����\0q^h�b��Sh�P�(\�g!\��&���3pd�2	�چ�NQ\�n\roc�\�W�o�\�<�˫+Eަ@��\�Q\Z\�T݁;J�Z�)\r����H	\�h;��p�;�8%\0˅F\�!�ŗ�̹D\�\�r\�B��\�55z���\�a�QԪ�B7~kF\�Y\�\�h��dC�\�ϼ\�a\�|�\�/�G�\��	BW�\"\�\�l���\�Zz�OP��T\�o\�Nn�K�\n�7t[d���\0Y\�\�+Վ	9(/�� +�^!-_�\�R=\�J\�wOT��Dp�b�=d}~Wv\�2Cձ\�u�t�hDvՀs@\'q��)Q�4Χb���L�\��&�Z2\"fYDIr�m�\�q6�\�ˢ|�\� �=\�\��on�\�\�K�D$\�,�\�}�e\�Y=�/�L>�7mU6�7J⿂z\�\�l��oY�9!�b\ZR\��\��Η���T*�c��c�gPX\'��`�E�\n]�\�\�\�\�K2\�\�\���:^d�Ն|�b\'��I	 \�%S5\�-e�25?ZW	�\�\�\�|yI��F\'7��\�:\�a4\�?_L\�ڞ	?\\\�[h���h\�;� 0\�\�\�\��\�x�\�E��e�U\��]R\�VJu	�w��\��\'�c��`zg(\�J4���	)~��h�2� A��X�W�Y��ۈ�E{���\Zu�i�Mo\�sdi]�\�\�>�κ\���z��\��� mn��q|`ArV�\'m�ǐ��\�\"Ǟ�g5z�c�\\CJ�[�Q\�Un�\\\��j\�<\�K�I�Y\�c��V&XV���ĭ�}\�\�,Y��7\���<U�-룲�F�^ԎCp��\nH!��l�\�|m�EU`!cx�zH\�\�!�|\�[Yzu�8\��\�ŋ�tҁV u\�?�6 �\\�\���,O\�҈	\� YYJ.#\�\�\�\�d/��\�nߨ#\�I~��E��\�Rf��e\�U���\�>�Ω\0qoU`\�VO\�Y��\��\�D%\�`]�5�ժ��^\�^��=���yaiP\�v�H��@����\"����g\�B\�c\�\��HД{b�GV��#\�\�\�V\�x���jP)\�\�\�IO�犇�)\�\�?r���I���5ǩwm�\�vl��)R$?;gV�Z�\�\�\�\�ğ*\"Ow���\">F��q%��\�Ł\�\rX\���\�g}�c�gH\�\�o\�\�I,+6�P��X�\��� \�pT�q�boW�2�fXZ\�z�c\�\��Z=a7�\�FC\��C-\��Բ/)\��\�ܱ_y2��w\�4R�\�=i\�/`�i\�lucƏ\��}D�\�J��`�S����$Õ�@\�P��U�l�\0!?�\�i\��N<��\�-Yu*PwE�fK�+Kk��_b�:�%\\\�B����ᕕ^.�\0}�ؑkG2\�\�L��ݒ\�(�հ��T\rB\��,�_�Q�,\\*۸m`5Ǡ�1gxe/���-���\�s�I���wzp�\�w\�\�Y�i}8\�:-�[ }\�\�>U�\��U�\nm�\r\��\����|���\����C�t\�\�\�`K�-\�q\��Z��\�\�C\�a\��\�:K��zLg\�.\��*\r\\\n\�%k�bG#\�=�\�@x{\�\"\n�#U(rm\�Ϊ8�1�m\�Ͱ��\���\Z�d\�}���n[�i\�>i���\"m�l\�oJ�w2�o11\�g-1�TˆGE��\�\�=��^pC\�3��`5\�l� [\�\�{�\�-��\".a��оi��j�hkƠۓu\�\�\�\�C�%\�e\����ڭc\�zp�q|%�\�\�fp��\0�\�:�x\�\"!�ot�\�\�3�ǰɏ\�}!/&\�%�W�\Z3�\�DK@Bn\�w\�\0o?��hJ\�qr�y�\r��C�� �H��)\�1�f���IHr\�)˼�7s/0Gq�+iu\np\� �\nYWo\�\0�\"q~l\\�\�f\0$&�?�b�\�\�`��\�\���v���T\�� 4#�_1ӣ�U(\�5uw9�xb4�\�p�dԏ\Z%�(�맭V�]rg΄G���y��\��?%\�ob��x����\�2U��\'S|\��\�\�$k�o�M�t�.�RkI�\n{�,\Z~�\�#�\�\nC�W &\�j{pJ\�\��\��k[$�R� �����~d6Y\�*�˧�Ev�%���\0�\�\�Q��@��/m(\"�\�w4��}\�͏\�_\0���]L/m�u+m\�=A�\�D	C��?C�\�7i(�\�\07N^ǈ\�\�Z��E�;v��޺\�]QMW껮�⯔\��[��w��G;\�]W\�\\s!�\��\0��\�\�Z��\'\rHCx��܌`aJRSo\�\�E��F!�=��@g8W	��\�\�ߛ�\'�adi\�pcj�olA0\0yV�n�\�\�h\0\0\0',0),(2,'Bhramastra','Indian Hindi-language fantasy action-adventure film written and directed by Ayan Mukerji','Ranbir,Alia','3D','2022-10-05','2022-10-15','2022-12-05','Hindi',NULL,0),(3,'RRR','action movie','NTR,raju,aliya','2D','2022-09-25','2022-09-25','2022-10-01','hindi','',0),(4,'RRR','action movie','aliya','3D','2022-09-17','2022-09-17','2022-10-08','English','',0),(5,'PK','logical','amir khan','2D','2022-09-01','2022-09-01','2022-09-18','hindi',NULL,0),(6,'Pk','logical','amir khan','3D','2022-09-01','2022-09-01','2022-09-19','hindi',NULL,0),(7,'Tara','action','gylince','2D','2022-09-07','2022-09-07','2022-09-17','english',NULL,0);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_master`
--

DROP TABLE IF EXISTS `price_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_master` (
  `price_id` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `cat_id` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`price_id`),
  KEY `acasdsads_idx` (`tid`),
  KEY `sdasdasdsad_idx` (`cat_id`),
  CONSTRAINT `catid7362` FOREIGN KEY (`cat_id`) REFERENCES `seat_categories` (`cat_id`),
  CONSTRAINT `tid2243` FOREIGN KEY (`tid`) REFERENCES `theater` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_master`
--

LOCK TABLES `price_master` WRITE;
/*!40000 ALTER TABLE `price_master` DISABLE KEYS */;
INSERT INTO `price_master` VALUES (1,1,1,120),(2,1,2,150),(3,1,3,180),(4,2,1,130),(5,2,2,170),(6,2,3,200),(7,9,1,130),(8,9,2,150),(9,9,3,180);
/*!40000 ALTER TABLE `price_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_cat_seat_allocation`
--

DROP TABLE IF EXISTS `screen_cat_seat_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_cat_seat_allocation` (
  `dummy_scsa_id` int NOT NULL AUTO_INCREMENT,
  `scnid` int NOT NULL,
  `cat_id` int NOT NULL,
  `seats` int NOT NULL,
  PRIMARY KEY (`dummy_scsa_id`),
  KEY `scnid112_idx` (`scnid`),
  KEY `cat_id122_idx` (`cat_id`),
  CONSTRAINT `cat_id122` FOREIGN KEY (`cat_id`) REFERENCES `seat_categories` (`cat_id`) ON UPDATE CASCADE,
  CONSTRAINT `scnid112` FOREIGN KEY (`scnid`) REFERENCES `screen_master` (`scnid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_cat_seat_allocation`
--

LOCK TABLES `screen_cat_seat_allocation` WRITE;
/*!40000 ALTER TABLE `screen_cat_seat_allocation` DISABLE KEYS */;
INSERT INTO `screen_cat_seat_allocation` VALUES (1,1,1,30),(2,1,2,60),(3,1,3,60),(4,7,1,50),(5,7,2,100),(6,7,3,50),(7,8,1,50),(8,8,2,100),(9,8,3,50);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_master`
--

LOCK TABLES `screen_master` WRITE;
/*!40000 ALTER TABLE `screen_master` DISABLE KEYS */;
INSERT INTO `screen_master` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,7,1),(7,7,2),(8,6,1);
/*!40000 ALTER TABLE `screen_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_seat_capacity`
--

DROP TABLE IF EXISTS `screen_seat_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_seat_capacity` (
  `dummy_ssc_id` int NOT NULL AUTO_INCREMENT,
  `scnid` int NOT NULL,
  `total` int NOT NULL,
  `rows_seats` int NOT NULL,
  `columns_seats` int NOT NULL,
  PRIMARY KEY (`dummy_ssc_id`),
  KEY `cascascacasc_idx` (`scnid`),
  CONSTRAINT `cascascacasc` FOREIGN KEY (`scnid`) REFERENCES `screen_master` (`scnid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_seat_capacity`
--

LOCK TABLES `screen_seat_capacity` WRITE;
/*!40000 ALTER TABLE `screen_seat_capacity` DISABLE KEYS */;
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

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `oid` int NOT NULL,
  `cityid` int NOT NULL,
  `tname` varchar(45) NOT NULL,
  `licence` varchar(45) NOT NULL,
  `screens` int NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `cityid_idx` (`cityid`),
  KEY `oid_idx` (`oid`),
  CONSTRAINT `cityid` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`) ON UPDATE CASCADE,
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `theater_owner` (`oid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,1,1,'padama','abcd123',2),(2,2,2,'Mukta','xyz1123',1),(3,1,2,'Pride','pqr1232',1),(6,3,1,'prabhat','pqcderg',1),(7,1,1,'knowwhere','pqcdeasdrg',2),(8,2,2,'PVR','ASDF',1),(9,3,2,'Parvati','cakcasycjbasc',3);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_feedback`
--

DROP TABLE IF EXISTS `theater_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater_feedback` (
  `tfid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `tid` int NOT NULL,
  `tcomment` varchar(300) NOT NULL,
  PRIMARY KEY (`tfid`),
  KEY `cid_idx` (`cid`),
  KEY `tid_idx` (`tid`),
  CONSTRAINT `cid11` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON UPDATE CASCADE,
  CONSTRAINT `tid11` FOREIGN KEY (`tid`) REFERENCES `theater` (`tid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_feedback`
--

LOCK TABLES `theater_feedback` WRITE;
/*!40000 ALTER TABLE `theater_feedback` DISABLE KEYS */;
INSERT INTO `theater_feedback` VALUES (1,1,2,'very goood'),(2,3,1,'wow'),(3,2,7,'worst'),(4,2,1,'average');
/*!40000 ALTER TABLE `theater_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_owner`
--

DROP TABLE IF EXISTS `theater_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater_owner` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `name` varchar(35) NOT NULL,
  `address` varchar(45) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `id_proof` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `id_proof_UNIQUE` (`id_proof`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid1` FOREIGN KEY (`uid`) REFERENCES `login_table` (`uid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_owner`
--

LOCK TABLES `theater_owner` WRITE;
/*!40000 ALTER TABLE `theater_owner` DISABLE KEYS */;
INSERT INTO `theater_owner` VALUES (1,5,'nitin patil','pune','male','7418529630','nitin@mail.com','1234 1235 1234 3126'),(2,8,'Vishakha maner','karad','female','8495625137','vishakha7755@mail.com','789 456 123 654'),(3,9,'dummy','dummy','dummy','dummy','dummy','dummy');
/*!40000 ALTER TABLE `theater_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slots` (
  `slot_id` int NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,'09:45:00','12:45:00'),(2,'13:00:00','16:00:00'),(3,'16:15:00','20:15:00'),(4,'20:30:00','23:30:00'),(5,'23:45:00','01:45:00');
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-20 12:32:06
