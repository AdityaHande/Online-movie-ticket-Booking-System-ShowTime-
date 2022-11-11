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
INSERT INTO `movies` VALUES (1,'Bhramastra','Indian Hindi-language fantasy action-adventure film written and directed by Ayan Mukerji','Ranbir,Alia','2D','2022-10-05','2022-10-15','2022-12-05','Hindi',_binary 'RIFF\\t\0\0WEBPVP8X\n\0\0\0 \0\0\0\Û\0\0$\0ICCP\0\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿVP8 *r\0\0*\Ü\0%>=ˆC\"!!8 Ä³\0Y“\æ0}‹8×¨]ı§ü\Çıñ\êúJ\ë\ß*Ÿ`şw\Í\ÇûUÿ¦=‚`ÿe½\Éÿ\Úõ\Éû\Ç\êw÷÷\Şşw\îï¼Ÿ\ì\ß\ï}…?©Àõ\ÊõCı\åöı\Òô\îı\àødş\íÿ‡\Óÿÿ°ÿÿnø0ğ[\ï¾şIó\â?¶ÿ‘ÿyı\ßÛ£ı\ç~±üı_ö>¡.ûÁú¯ğ¹\ßä½¿ÿµ\àÅòıB?\"şşû‡\î¿ø\Ş§©ÿ\Ç\Û±ÿ™ÿ¯ş—\Ø#\Û®ÿ¬ÿû±ş?÷{\èG\ç\àzö3şW\æ\'úŸÿÿ€?\Ìÿªÿ¦ÿû‘şCÿÿüÏ¹¿\âÿ\ÎñLû÷ûü\ß\æ0>À¿ ÿkÿ}şCü\ïşŸó?M\Ü\èÿ[û\İş¯Û\Ó\ß÷¿\Ôÿ¦ı¬ûşcıwı÷øOõú?\Íÿÿÿ\ß÷£ÿó\İO\î‡ÿt\ï\Ùoı·ÿo›÷\Ô\ÈC{µr\à]9b?\ä\ÒR¶Œ2ôZs]ø\ëû\\ ´\ê\Í[¯›qa\Ğ¥c¾ˆû\ï›\×a›T£E‹ø_ô\×=0D@\ŞöK¤Áw˜ô¶L7\è\İ\Õò+1óş\ÉyHğ±´\æG6÷\'/)ÿıVK\í\ã\âş9øp\ÑŸRXõ\Î>\ï\\É¬˜\êc\ë\"÷û BŸ\Æd$0Gõ*\nF\ãhö:b4¨ğp¾|\Ü\Êk„1aği\ÑV\à\İ\Í~˜\Ö\ï\Ø	˜@ˆV‘½V\ÆBÀ ¶\Ü\Éa†\ÈAVid\äw&\ëo\ØÃ‡‰¨\ë\nqTVQÚ‰¡’@-)ù‚j™u7}¡ÀA\n##el\ëÆ“.R¡¶V¥/^÷)nFt]ùzúAvÀ_…ôµÁú‚°Ì‘¥\Æş\Ã>ö\áŒ¦Pš}g\í55öºU:AtON&¦î‰¶~½c`kL\êDk^›s‡nKÍ—G\ÅK\"™¤f¿pFªs.b)x´–¥½C_\î[T\Í\Ğ\Ğ\ãÀ\Å\ä\Ôş>—Dr÷ø‰g§x€\á¾À\â±ê¼¯µ‡«s\Ú*¶øj¢…€\Îr¤õ (\ÉU3±h\r­Q\r\Íj’2°~¸\Ç. xg„F€°³Lƒzf\'/C—tknR@°‚\à‰~ H9\Zr­¹\æ\æ\àr\åŠÇªªÿ\Ìc ²C·‹gŸi*üI\Şjh¶\Z\Î\İ#¿·‰T\İe#Sze\Ü\n&•Q÷ıG	\â¿&\Ë(¼.´°I\ÍSùEˆ\r{3\ß#¶Œi\ØQ\ï¾?¦\ç$¶ş¾/‰r\çwÚ€\Û\Ó*‚ñ4\Å\êp]Z\ê\è	(* –ói†\rÅŠ\ÅóDm\è¸!†ô\Ü\"DbòË$¯¦d%‘»‹²-\Â\îñ…\íü?o;f’Ï©7o½\×%]#y¼alIk™\î‡ú)¼õ$evBC®c\Ç^\äµ!PKö7é¹¡3\'A2\Íİ·	·ğ¹£E§yU¬Wb\ÙÁ\êB6v¸‡Vu«†¥\êYó`û/\égj\ÇDG5SNyo\ÖS§Í¿Ó™$ñÑ¡òª7š\ÏğGdC\'\Ö61,~\'\Ş\á%¢»À((ùK§X\â†q\ìFhÀ(ú\æ\Äÿ˜ÀkCµ@n\ïÇNÿ\éLwcˆ_\æ%Åµûf\é%n\ím¡•°°Y¥8¡$\Ú\ÑN\Ìh»Å´\ávµ„\İ\ä\Ö$1>µD\ÂWÓöi÷e­\Ø7M[\"<#E\ß\n—<Ô¬¢iU\Û\Z\Ê\Ü^:† ğô·”U+‚¬\ä¾\Õ8\Åü0°Òˆ;µhŠ\âÕ—­²¯÷rC‘v\Òz\çæŸˆq¨\ÆX_|0™ıÆ\İúÄ¼\çXq`H\Åøyö‘\Zb$Ş¹9ô¨¦—uĞ†KEœø‡†2–STû1ªªnş\ÊI¢‰6ûX)˜ZÉ¢”™Ë˜*Í¥·yşÈ‚×½µ\Õ`H—³–+4\ì­ô™\ä´ù\Ú#\0¨\éˆ…\äñ\Öİ¢e\Ù{À¨\'0Q‹ò\ĞôvpŠ½€[…£ğ©6”òg³¼q \r7\ÃP\ÔJ$3_ÿVKÖ”]-®\×\Ìb3¹MG\Ê\Ç\ãq\ß\r«´”&$™\'³~l¿’ˆ¢<\'8®¨~şõ´ˆy¢.\î\ïc˜\íª^1©Z|‰|K\í_\Z›[÷\ÂM\r\Z;õMzW-»b\à\"•]MU\×:ğ\Ë<°$‘õ·•w=\ÛrğşúvLÔºˆŒo³|GÁ\ègƒW<KŠ@‚»’»2¶‡#«\â}\é]\×Ü–¶øùD{·ğ<\Ù\à®[\r²‚˜¼ÿ¼:œ#I)@‹\Z\ßú„´‰‘ŒO‹¼÷Êªœv4…\Ï÷:js„Üˆ/F¬gm×…>|µ±ö“\Óv¯<®l\ët;šLJœ´=Í£z\Û\\™ğßÃ·\Ìáº£LƒC1&:™\Ş\ÈX‹†[øk#’›É¼stúc–Î8\îiß»= ‘ \è\çg TT¥xr6\æy\ÜÿwLwZ¤gŸó“H\æX»\ÄøGo’\Í:B’\çlg‚k(>»\Ğ\è;h\Ş\Ê\'\ç©q©I\åØ¹Ô‘\â…¥)\Ù­_ŠINÃ‚÷³·\áp(Ø”r­7¨š‘W\0:q¿‰	µafÀcæ‹¯pƒ¿½i©u_¹W.¶ º\åå™ºa\ëQ¼8MLó0ïµ‚šf¯½\æ#3!z\'\Ë\á†ÄÑ¿`	«g·\àdO´Áw\åFNƒh¼E&ª\Ö\Z$\Ü3Jú\Şsv¹WMP™7NxŞƒú3\å\Ù~s\Ï-–}\İ3™`¡eŠ~X6º\ï*\Övs-¬ªğØ™;\ë‹\Ü\æ\Ä\Ñ\Â\Éö66·gI0Š[×§(\Î\äÀ‹ß€\0şÿÛ·”v—«•NE±\rG=¢f\Ê\'ù°jiúş±\å;\æ\è*‰x\æg+ı…\0‘ş(«\ì²1Í¶¶B¦\Î\Ö®\İTŒı\àõi\â^¨ \Ógñƒ€\áWÉ©®³õ\Â\ê£\ä\é_ÿ.½®K\ä\ç\Ïÿ§ÿ¯÷³\æÍ¸{\ìûS\ìm£N€C\é08}÷•¸ğ\Ñ\è¤!MÀu\Ş\ÄgAÁgn÷¬\Ú9YİŠAÔ›\È\Òy\ë”¨\Z·‰¯˜\ÙQ¦!óa­Œñ\Ğ>;pÜ±~\r+ñF¾¦{®*Pµ}¹h\ã!\r£·<ßœ\Õ\Ìøv1\çI\ÓZ\î]¤\Ê8“Ue©$1‡¿‹\0^a7\Ö/N‰\å5\âgG»\nŒ|gqhR\É>šU\Ê|!˜\ã\Êõ¢\ê\r¶Ppd~CŒNw(U\İ=f­¡~G¼¡±M1.\Ü)J\ç§N\nfŠºb^k}”yA\Êm™±wö;BÄZb5İ¹\Ï\Ì\Û\"b‹eüsvTı\ÕYŒ|\'–Yš\Ô\éO2s¡ğG{.}\Íwš$\ì§\ÃM\ï\ï®A•9»²xnCip¡²¼Ëº\×!\íD4YĞ‚‘ÑŸ!×OWVÔ”ä“µ ¦|–\æ›1\×vj±-•VNÎ·ª\ä\Z®uaÅ§\ÃF„ô\n\ËtùqŒ‰\Ùg|¶zŠq¼e2é¯¶d>\\uKbtˆP$‘‚\Ï\Æø>Ìš¤™Fi\Õ}Ñ‘6yª’—€@™\n\ä\ìLşZ\ÌÃƒó\È{\í©o¨D%Ro@\Öv€ò‹q¶\'¬e­Ã¾^¿Î¸0Ù¯¨Ù¼E\ë~#“f‰\ã\Şrw\Õ	—;•$\È\Â\İ\Í*:Ş°§ù\åÁlD\îX¯®á…‘N´¸P\\kıvcù­¾H¸!¤\É\Û-Zh~\à‰m“•ia.°%$\\Å G6\"×€ \ì”\Ì‹\Ç\'?=c¦ŒC&q\Ò!Û&s¥õÏ®z½\ÎÄ’.G\Öñ\ãBœÀH;`öFw<\0\ÎÆ•gb\ã\æ9›3<ü@\ÎH¦\ÈnlñRòVß—MX\î\'¤£.ÙxK™|l‡sŸ(ş~†j¢•x\å›6~„§3y\r\æK8ûtŒ\Ò\Åş\0•\Å\éf/—–H†\rİŠyJv\ä\í‚A~l8yó&P>\Ç\ÄÔ›¾\ëƒH\Ó-rr‘dû\æaq8‰˜Ÿˆ fN€œ\éµ)X\Éß…Zq8`É»å‘¤’\Ü\Ñ\Z©(UtFYB|ªòüJ\ßx1\Ê?e;\ÄMi·e’k\ím‡PŸ†^eˆO›’y›òˆ\Ó\Î^pÇ–¨¹.qB¶\Æ&\re}3\"&Y¤½SK²\Æk²Ë·RB-Ñ§\ÖC·ƒñ\Ş\\\Í\Æ1ÿ~®/,=‰¨¦	ö}rv®Y\í\"$XY\0L\í\ëx½\ã\í/MÄ®¥/,ß‡Y\é\ÇR~T\Â6\âù—C¨s}\ç\ß}òü–}VO¦••&M¬¡ñ˜¼½­ü{tµ°Rzöe\Ze½À<ˆ\ÒsŒªUy\ç\àÁwuirCƒ…²\×(vD^ş­fC\ÉM—­]Ö=å¸\Z°]”]9c8…\Íbj§&0r®„ıaM«~İƒlC^9„\ézo2#O™\ëP…EŠ\â5s\\\'t¥$O\ç¯\Z6uDN@>m7üxm\æ´?n4¸0 8B6–~\Ñ^şvõ\Èv>ø-ÿ=\Z²D÷uó_YÆ¡y¨°\Ì!limI1K\'q!œv\à&•eÚ¦5[?_­÷@\áÁ:¾/€P\âR—”%Ø#¢\nƒº\ã8Ì˜A\âJ\Ïë¬¼²\Ë\\\ÍD\Ìd;®\à\é­OÚŠ.;‰\Õw„\Ç6*\â¡  ‹I«ı&#\ÍÿŠ¥1 ş¦(<\ÅÕ…¸÷¾?¦\â6ô\×R\îş}—ó\áJBsª4\ËfojÕ¬–c\Íp\ÍfŸ´Ê¾<A\Ã<,\í6U—¼c\Í)X4ûò±ñŠ\æ—\ã¬\ÍLc5k!OñşC?¬\í\â<B¿uu]„/5\ìX€W°\â\èè¬‰c\ç[Šs\íq’5‡\İ´$Š\r!\Z¬y €XTÀTû¬£©W9+\å\ìh<\á¦ \äÕ¥À\ÎrG\ÒAxñŸÀl2û™M6U\Â\Ï2v¬Ÿ*¦÷\È*\Ş\å»™<V¤\Öv–4;\ß#ª£z¼\ç4r.ƒ\îŒï‰’}ıø¤.Ã»‘„ e\0\\—öÀ¬\È¦m\ã\íÛ».D\r„ @D\Ø#\Â)\ã\0)­|:¼ÿ$ ¯\è%ø\ék»››Y{Ã¼	/©\îx%FpH½\×A·9.„¬)É³­¯\'y!ú1x²B†œpm¾ûû½ûKS\ëiQ#‰õ›Si\ì¹°L‘$»3L&2KK= ©®	y4\Z%´ })\ìç‡§•x•)1\à¯ª|\í£üœº\"µ\rc8\èh×¯c fì¸¦\á³ß°g7\î¡$}gƒĞŠv’O\â|\Òp\Ê,­º‰cp\ì\á\ä·\Éw\Ä4\"’ ±” <öÌ‹kª1¨\Í`¨‹µøZ,œ&b{€<…¾O2¢\îû]#?±°jq\ÃûP^7¡€I#X\ßE&3I\ë¢Ğ™è‡‰\ÎT!¤8b¬Ÿ£¼\èy\Úsc\Âğğ¯fš\'ğÙªï·°O¶#\'(j›\ëÀ!\Ô\"µTş\Z_ap—J°,»R\í $ˆdT\ÌQFš\Ñf3\â|rO(M}:¸\Äfv„€\ÊjŠÏ˜\Ëú6ƒ¾˜©ô=\'šG\ÖÀ\ë\05«jPÌ²/3\ÙtU†^ıŒ\é¬f\ãl\ÓZ\ã„Wö¯-ó“§Fóˆ]\Õõ\ÔôZ*¸L‡\î\æ^KN+\Ù\ë÷\"„A9\î\í°£öZZB\Û\ÕM.1 (Rdweq¯\Øw«I´\Üw[7%(o°%a´2?/|‰Jhc$üh£9@¤Y\'\ë°ù¢\"\'ÿ´YİªºË…É…÷an„}úï®ªg¬ b‚g\ZM\ã^Ó˜û\çª\ÊÚ¿>Qi„±˜\nió\×ö½¥?G¯3\æeŠ!\ÇÁ§g\àƒ\Ô9Árk†L\Õygµ\rwk,/œÏ­x£­4\å¾`É¥\ÓEO²\Üc\Ë+À?$\Şw\'X‘©¢œ5V–\Ô\É:¡\Úó§Z1&Ç™\í…g®\êt“»c\ÔG \ÂO\ßNe[˜şA\è|2\ï°Dª—8[%p€SXl˜©\ìƒ…¯\Âp„r‡\ÕN‹¼Yœ@l¯\á\ÅZ\æ\ËDT99¶\ĞÌ°Æ’	)|š‘j{3r\ÂfZ\í¸ú\r8À\ÆA~W77/”ÎšS\ã»ş\Ñe\n\Ï\Êİ„\Ë$¯ŸªˆXªM¶~°¦%½ğ½¯˜¥‘\\Xñ\ë„²b!\ÔıŒ\Ãv\Ûv 7@\nYø—3Ê³\Ü.\à¦\Ò`=nò‹ñ\È:3\Z\å-$¿lŸ|Ú¾uM\Ë]V*\n\çpÁeJöt^¡\à®2Ò§®sz\îf\á\×\ëNº§Ã¡3¾³¢Œ‰\"©%1}\Ï6U\Å\Zƒ\ÑöL\Ò~p úr½\êÃ»\Í&hBI\Ç\ÏUşR?Á­>w\Üv|\Â\í\È^j\á¿“\Ú2\â¤jf9¤-eÚ°)wSù^gû\ru<\Ò{»Z\à…~q\Øj;J_\Ù=\ßô8Q;\ÊÊº–&\r\ç³\ZüR\×\â\Éyÿ_\ä:Š\Ú,=^&§`ÒŒwX\Ä3`ÈÕ§\Ö\îU¼HŸ ¨À½G¥>Óº\í—\Ò+ &™»«Rƒ\Ç%\ç^ø\Êj*ƒú~ÿ\în­\Øû÷v\ÑÎ›_gV\Ør¦:1\ê‡\ä´`\çEz°3‰fuSú÷¬¼[pš«\è&\Ât~k£J}jõûı$ò¥\İV*1H«Ï´\Ö6¥\Ì\ÙuP÷+\ÂlZ|š?Ê·\ÎG/vı®I7g1g)M¦<ŠL;kÅ¢Iõ–7@bk¿¿ş(–vüjŠ—\ÆÓ•­/`;9\ïPñ¤5ŸšX2S³cô\'.^½Guq8õû Qq Ú¢\Ç\02sƒ›Œ¤\â-Ÿ>™8|\r\èşj9õ´ŠŸ±\Ç\Ğ2\ÖZ\İ\Ğ\ËgŠ’À\'^<\ÛC ˜©\ßû°gŠ½«O…M‹^0eıJ\Ë\Ô$\Õ€•\ÖXN0·‡‡xQ¯\r\"±4\Åz\í\ÔŒ»\ï7\àhÎ…\ÅÏ¤ù¬N\èz\×H›õ²2)Šd\É\ë¾\ï¼\å•~—a9PNÁ\Z —\Í\'rù©EA3Q(\ìü\É\ä\\o(\ÇX÷‰yˆxœ[™\"$\ÏPYO×€F¿Ô‹\Ï#\ZûI÷\Z\Ã~wúø7lo\äª3\Üö\Ø~ør¹\èx_\Öıx\Ì\Ì\Ş…\× :XR©\ë,š6[¼R8¿„|i\Ò\æ4\áü(•\×\0¡:šP;z]³ŒP%\"Qk\Ô9÷©¶\Ç\Ü*AH˜\ê9„\ë1é³‡\êªlŸw9‚±p\'±Ş˜\Ô[’y¥ \í\ÄD·*\ŞP¼Ì­\ÉPr\'!¯É€\ä¬u\Ú-“õUpqh\Ö\èO\ÃA,\Ó.”(\Õ¥À@ìTM¶ø\Çö½:“\ï˜û\ÏÉºá¶”†\Æ–\Ë\İp\ì„\"7iu+\Ã\Ï\ãe\İs‘¸8ñW˜\ê\å=8†ß“\Şüƒ4³\×\è:„\ĞÙ±Ÿo®l\ÄRGn0‡ş\å§tm/¹\ß*’Yùb4¨Ë‡ù!ß›gvHÁ,\\õqô?q\Îğf±S#+¼ó®a \Â,`†¡\Ø*\áƒ\Î\rp\Ûfš/\êøğ·|YÍ©gU1	=)F31*\ß)\ïEz¥¸|¥\æ7.]™T€Kö\Ê\\\0cª¸$)+P6\ì)õ’s4 º¿©—\Ş\ç\É\Ñ[†–p¸!q:_\Îe\Õ\ÓP°8\É#®‘q³³[\ìö[Y\ä>¼zNyA¾š{q\İ\Óp¿m-±R¼¯EY\æA>²DR$…iE\ÂjM(\Û:JøF•÷\ÙgF¦\\ 9—…\á\Ò\ê8y•7^,\ê²\Zé«OmS$\åúrn/²İ²¤º|+C¤˜ L€=\ÎBIw´3RiO‰¾\å\Ä_Ì…Wıù·BYH\àƒ7\Äi		õœõx\Í5¡³»fÈ¦‰AIov)ø\'¬K\n‘& |¤}ôÊ·9QÜ\ËÆ†qP\è}‰Î·\ÛY¢C:\ïf¹$‡?=Á¼3U9`wd\Z\"G$&·O;\Åü®‘¸9\ï~\Ì\Æ	v\âÚ‚16\rˆ¢6ÀijÅ³\ÎğÕÚ•¾l‡.\'eš\Úİ‰¹”{õWNd¤½\åüyPM¡³\Ô\ÄxK§\Åÿd\\³ö~¬8¢\ÖöPÄ˜\İ6\İ=ğ›W¢¼zÁ\ÃUõ#\nÇ³º\ÑQ›5\Ú0(ù+ª8>•m\É(»\Íhæ§Ï˜\0Â¢[\ã\Õ\Z?H½‡Nu÷ÿ\í–\ÑQy‡8•šXòó‹\ÃBø	øâ­Afö=\ßtş¹\ÏVHJü\Î\'\àŸoóS,´&ª2¨\áy‡TTF\ïi¶úÊˆMVB7Ä´¹;H±\ëXT\Ô`\0ññ\ì1\ÎP	|ªqS…øC&ûsªL2“²5Ä€È—}\Ì>öŸİ¾\ÒÇ•	\à5m°Š„O\æ}~$7xF)c×¦e·”\Û–kŸˆX\0\è\Í\à\n!p¶mk]nq)+B#Ê‰«õ›şJ¸Ø³½”\'‡°@\ÔmA\Z¥M“{\Î\èûğ¿\\NõC“«0kD]¾‹\ŞŸæ¸…Bª\çÈ–\Ï]«\Ñq¿L)K®÷#»š¦µ\Â/mm\"S+±‰YTm‹\â`\ëñ\Æuğ_F’\ÍkÇšP\×(©o\æ	Tjû}Qú\×\Î\ÄX¹pILg\ä\èj¤¾\Z\ØÛ´\Â_Ù¨#\ã\'Z€S\ä1\Êağ\ï5\í\ä$*gl>÷y=_\Öx\Ô\èR¢ş\ÖAa\Zü>\ĞS-@Ôs1­\Ô\×ù)oÑœ7œı3` \áÏ§\æÁ±µzôó‰hG,pp\"úQ\É\ÈÒ…D9«—rÔ…\n\Ğ÷Ú,X“FcmLI\ÏH•\Ô\ÚGšİ§ú\nÁR¶Ü‚!\äBñxGƒ\Çõ\İóC¼qw÷&†@A”©ŸNn`n>¢j’i‹øBunº¿)\"\ï!;Q0 \Ïô¶ÿY/¿ıs\à¢Lÿ\ÌJo»®~‘R\ÏÇ¶–\ZH\Ãß\Å}JD#,\èH\"UÓ»Ò“f¾\Ó\âišOt´\ÊÁ>\Óíš»œ!şÏŸ§M\æ\è–z¡™ûy;\ÍüÃ¦š‡5i\ä\Ên+³–\ã”,xÒ•~e¿\ßx¨!\Ğr[\Èø‚Vö²Šœ\è\Ö&\ä o=\å\íY5£Í³ğ9\æ\åÛ£¾w4\äüŒIx£†³\\³0‹­6Š\"$U­½¤ K’\æZ93\Ù\İK„l[=\r\Úr\Õ\rb ³Kwe*\Û-œ5k¾6ü®xÈ™S\ÛA\Õcô\ØI\á\ÕZ&\Ñü,\Ä\ÊÌŸ\Ø	\á,X“ª\ë6–Gô\0/nm³´ª\ÒáŸ˜-5ƒ]À1xn,¾E_¹wp\"g—Z‹—\î´Wb\È?\ïg¿\á•8«ğNÀ&S~Qª«<YõõĞ²*\êKa\nWÛ‚Ëº\Ä{ú±F!Ù²Y@ğ•Û‡1œ±­+ƒ¬€d\Ú_ø\0ûcz\ÚA…=oÌW`«¦\ÜI\ÊnÊ€C«¬ ¼;\ì\àEd,y\ä^\ë¡W<¦i\ï5\Ò7\ÜQ_s\Ù\ÛÁ4uÓ‚\àA^\Û\ÃdÄ¶E§•X\Âú\"Ji‹’¹²H¹n$%	£ª>!^\å	Ÿ\Æh8@iÀ°s¶5œ\å\nÎ–PMD\rñ\0b\æ|\èHk\Ğ`6óÜ‹\ëC\ïú\Õøô\åÈ“\àHH\reº£\ï˜üùûQ\á¬NŒP_€YSjy”…ÿivŒÅ¿,E\'²õ\áJ\ïHª^q”­ğ\í\æ9w\0b$´Ñ‰‡g¨ğ0{q[N\å!ùQòôÙ \n8ˆH¢´—ª\nô¡2jŸ>\î5=Í¶ª\Ëù\Æ1¿…J¤?š\'½\ÒS\ZM*m’­yq\Ì\à\Ø#M\ìkª\Æ`¡³u«*}‚=o.\Òq€`\Æ\ïÿt€u¿» 2\Ï}²\ã;(Ã1ZÈ¤úgJ?\Ü<6É1²¢\\»s¶K8t\à‘\\H¡”Ï‡4§\Ú\Ò!¬\ï¼w\0À\ëöRöÔ¹˜¶;¢‰“4ğü\ÍÇ¶È®z\ÂÚ³E´ ®=”\'¹\î¤*H2\\²Ç¨l\ìôz\Ë?4wÜŸ\å»õ\îx\\RAkSR-m5[¿|\é1À\ÍÊ’	q\Î\Ê\Ë#z\æg\Ó?P¹˜\Ò-A#tŸ—ÀD²\è‘Ô¹aûz¾¶˜Û°D¤¶šˆôIÁ\ÏpfG\ÓR½œÆ½;\Ü‡¶¦n\Êô\íÃA6x ¨´¡`‰$/Êš\ã¿:^\Ñ+VùM©4\É\Ë_ş	O§­Yzy\Z—Ù®\Ë1\\È›iº\ÎûJ’ş\à\éiœ°\05©\"	<|¬\ÈTÿUc´G)\0Edz–H\0St\Êø,ğ)\ØO/lÀ$\Ø\ãh„?\è\ïö%-°±‡Ÿ\í²[6d\á/F’g¶6\"mR#ÿ¨-\0¡®|\éDUŠÂ£J ‹ÿ|ŸŠ‰¼BG¶ù\"\Æ\æ®\ÖÊ¬k¨*E=¥	&ç… ˜K[”£Z6òqÚ»Lƒ~\Ñ3™¼3øk¤gWE¤€\ìyJƒ\Û[ˆ\Û\ÍZ\æ~\Æ6$c]y±×™†o¦ğ ü»•¡ÿ+ü¥³üûs‹š4C.ù¼>ú˜ubÑŸıy–û\ÒÕ®R!£m\Ç\åŒ/\ÎĞ0ÁFv\í\Z\ZÅ´4@Jqîˆ3ûKòo{W\ĞUğœt@À¢A\ËS |B>˜\Ì\ÙÎ–œs*‹:j‹v \Úb%‘\ßjR^R–ğ¼|¾†\×8\Î\Ù…ˆ©0`‰€ PÇ¤+\Æù@3~\ØO²\Ú‰#	\Ú\â\Ş\ÍÎ¼‹*5eô\á2\Å+¯ÍšFR—\'n‡\Æ\Í%\×ó¯\×À5ş\èó\ÚWĞ™\ÈÍ”¾DUlBi}XT\é\ìM®AcûŸ 1Å™ƒ\Ïg\Îñğ§¸K:¾°±Ağ©ô^œB^™9b^0\"_\ép²_\Ï\îÆ‘H\â:†¬ô›\r2qÍ 	A\Ò\Ğ\ÊiƒB¹Z8ƒ½	<Œ/óˆ0†‚{\çˆU{z-¢\ÉP?6«\Âe¶À\ë`‹-Ï²DX§\ã\ì@4a\0®i2\àÁ\×\Õ4iƒ\ì¥e‘®¾Ş¯¸º}Q½Bˆ\r~\Ë0g¡V70\Z&\æ\Öc´~4&bÁ¯‡\Ä\â9B\ÅC\Ôgœşˆ¢–Z)œ4­O™<—\Íz+_+\ÖAİ¸\Ç`\\rs{÷·%\á\ÛñLOG\Å}i‰¥\âş`‰\nvD:Šó‹›@´o}÷DÈŠ”Å˜•ú\ÜZ…ñ!\r56\å!“\ã\\¡g\Æ÷$\æOÕŸ\çu\Â“ƒô9™\nL´…¶\ÌKT}g°ø\Îf‹\ì\ß2@\î\Ñ\Øò*§//\Ø8,_\Û\î\ï% >Ï°`o?û\\òU\'€.ªz±\ë(\ã\ÆªW½ğ,1y\Íõ*ÇŒ\à„¢\Ån¿}\Çû\r\çOB\ÄZ‰F³i‚ø•<@/\çÎ¼e\á\'šf‹@…³\Û\×J@«\Ê\ÏZ£&²>Zšlx­\n\ÚA\Ş\"uÃƒª]\çTE\ËúA‰·–{mÑ¶=­Qh\Ã1÷™\\+½æ¤Œ\ãD4¢Î¯Z?q¯±2rC\á¾Ö©>T€@tM}z62~E·N\î\\\\:\áC¼m\ê9J\\)t\×\Ò\ê\é[@)µ\0^bDş\Ö\â9„ò\Ü\Õ#d•\Å@Á\\\Í#v*Ã;«ö“Œ› dv€ôt•\Æ(ˆ\rW\ï¦\í\Ò\â\éı<tQ\ÉÄ¶ù=&A¤×¦w\ËÇÎš\æ«wO€”Ú¢+¥‘d|#\\¤\Îyr4Q·‡\ÂÕ§O‰ÿb-¡’‹°÷hPª¸#úMI~„{\í­V‰2\Å\Ô4\äÑ¥•\àf,h‘Ÿ˜,Áu”¨È–%.ñsWù†6J’\êP*†lP\"›\ßh´q\×$´¿Ÿú\ëAaS\0GxE{TD›8½0@>\Ü…\Öh\è\\£\";\æ\Ù\ìRŸ\Éw\ã#ô3ÿ…­AU\æh)©×¯O§mtF1ˆ\é· fMhgc\Òc\Ôğu{Bº\æ.’XMl\Óò^<\é¾Cx\0\ã`–/\Ä\Ç8š©mc\Ó\â¶0z@rú\ê\Ïûj\ÕMUx(\ãF\n¬Æh3“ßº*dğY|­Qôæ±±qNHr1g\à\Öw–\ê,U§\ïI“ó¢¥w°}-,\Ìnù\É(NyV\í*\èh?‰W¯\à\Ó$‡‡ıi³¹\n2$\Ón\\¸9\Óÿ\0 \å`ö\Î;\n\äúqpu†1.\íô\åYú\ï(\è®p)ê± {s\á„,,\Ñ\0\ê3\É\Ëşª¡µ,\ç}\ÄšıÆ‹—\\µT‰³û©÷J-lõò\ê\é½K9fšO›\ê5\Zƒ\ä@•~X5Ğ¶}ú—£\éI?OÊ”N 1q`57}OÜ«-To–š¼g:/©IB\ïT,\èFTQ\ãg2<ø\Ä\á\Ò@ó\àğ2u<\à\Ö>”dy\İ$«Yšö@Û­\Îg·‹˜b,_q(?™p\æbH×•–·\Ê\Ô-E±-\\Rÿ\à~l~•Kœ\Ù\ëaV\Ö[Š}\×\á£q55¶Ú›½¿ú3CMö-\n«\ï7`·%10•nÆ³@d\ÌA\àon¼Dº&•‚²gğŠD¨»	Uz\Û@\Ş3¹8/@Q4ı\\\Ö|v2‚Œœ¾·Bi\ÂilO$´™\ïğ™\Z/\Ì\0²mU\Ô\ÍNjj¨?ój¼·P\ë\ĞQôlúÖ”Š±ó\æ\ç\\\ÄÃ¿t\'©zt\Ûİ•ÏƒK;hß¶\â°ø©XQ’›¬\ÕÅ¾Ä°£k+\\+?‘\"pŸûXÔŠ+T¬\è\'!¿\ì\Ã\ç‰l²ª\èK€‹öÇ¢2\ëpŒƒ˜Á±ğ7üÿ’m‚!ep\'¤ƒt\çOgU}V\Ø\\\×\Ò]Šf\Õ\\†^ÿ8•õ¦\Ó[šQ\Õ\Ê}.`)N\âX2¿2kÀg`\å\0ª´QX2À\Ì\Ë\ÆV\í‘jµZm’½[h\è¼W˜hHS¶ş\ØZPgÉ§\ßS“‰‰ŒÒŸ8\Ä0O6ÿ»?uş\ç„\ë\î\Úö.Phgö	ªn¯h+¤\n\Ñ\æÜ–\ï™\Ír¹\Ñ\ÑS&ÁœlÁÍ–ƒt¤ò4]0Bƒ\Ùv\0“cwÀö§<š°0ò~>¡\Ã\Û/ü\Õ\ÄY“ñ\Ú2ú\â\nm\ç\ÈÁø˜…+\èòƒ«\à¼U¼ Vƒ¾_¡\İ\×~\ïÁ¯hø±û‹y\Ï\ä.\ãŒ€p\"õv.\ï—\êı&Xn\çupT\ç\Ûñ\ïm\ÌE¿Ša\Ä\Öj‰º\Êğƒ…\ÓV˜#¨\\©ñ<¶«’¿¬\ÈË¡|$n\í\Òİ¹ıi•\ÕHvO\ãƒ—ˆr\æ=‘ve\Æzb¾\ŞZ\Ş¾y6®mƒ\í@A\'¢‰B’¬:÷s^@x£Kb»sŒP‘\Í}>/\á¬@²·\rv6\ã¶GZr(q¸TLH\ËÒB\Ì\íıUyï²›x;Æ©†¼§\Û$K\Ü\ÄCP\rª\r\Ø\Ê?8¾ûD\ße‰„ı\äo@\n-G›¸³¦¾\íµbo)#\"\\l8D^ EyˆóUš\Ë\İ¹ƒ~\Ñòcø’aTºøy˜]\Ê\"\Ìñ1P\æ·GBU”9z°(\Ó\İn5KıZF\ægj5­üµĞ¢–‘AH\Z|\Âˆ¹÷N\è~«¤.[\ï\ÈŞ¤:(€@\Ë?ºu\ç8qğ\ä4i\ĞuTz^3+N¾±((±\æ\Ïg­\îs\ç\Ê&Æ­{\é\n\Ó\í«¦6q\ÏøÁ\ÏS\ÎF|9\ä¥Mv\ß\ÓÂ„*Àƒ\Ì\04\Ëóî™¸Õ \ê\Ö:¤+O­§—2\èB CP7ÿ\Ñ>ş†À\çhu˜XœOm›pjIñ²½<;\ÄÒ²›L‹M\ån\0\ÜÀy\ÃfDXRÊ­¿\ç¸As7tdm«]Zş;ü\ë\0•´U\î¦3‹8ÁıQQÁü‹F‚·nnwhŸ’#\è½ò<Iyq\ï1ı*{7$•–q$+t\ZV¹k¡?\Ğ[\Ü($‘zÓ¶\ÍZ‹\Û2cNgVwqc\Ø\Ö%+‰ÀXo“¡m>~icÙ+5\Õ-T`ø#³^Ah>\É\×ÀÅ‘`_\'yC\Ì#‚a»\Õg‚\ÌYn\0‰ò~Ğ›dJD[\n›u\Ãm\á¨p\Ö[©\ØÂº\Ù\×\åï¬¾w\Ä[e¥|¸Àš…$.¸;¦\ç\ä°\åh¼1Jòˆ\í.…@+^o\é¬À%5\Û[ \ÍqØ¬\ÅŒö\"õq†n+ZRRê¡µó—t\ÉHÿ G1\ê„KùÁ\\$‹õa­\Ğ=\İ\\=0Šif,df?&Rô3Ty9a\Ø2\ÛrùøI(W\Ş?JŠ5\î¿n\"\êœ\â!95Qv\ßA\ã–Şµ\à.œ\Õú´\'?‰j\ÎrŒTq0kş¹‡É†.¸]y…ü2Š\í’\Ö$+\â»W4ş~;)*[u”˜°¿õ\ÎW•\ï_i\çş\ÈÙ¸6ƒ4hˆ@§)\ÜbşK†·x\çö\ÛNK°¹HóT!Y\êe2ª:ş]ûk¶\ë\æ\ß\\\á\ät¦&\Zñ-L»\àú:o˜Ÿa\Ú/²©%UÏ˜s“X\ë#mkIkŠE¥Tnf­‚#¸N\Å_¢R\ÔS¹#À+BpÖnM<\ÊF:nl\à¡%†f\Ç<<\ÛÉšò\Î UN¹Ç’I8ü‹j\Æ%[Ü±\êd\å\Å\Ë]ö DÖ©\Ë\Ú_Ew«™¾\n±X\ä„`@~3°O@ Y\Òô\Âø\æ[œ\â\İ AQ×£Á¬¹°°\Ë\ŞjG³.@·\Ñho­ûÿ§Îß»‰\ÒK_c\ëjš€\à*\ã½.0=ƒ¿´\\)\ç£ù\êºğ±­X#‰\ÓNû_\Ã,RÙœ‘š²e8}-io ï…Š_„¾\ä\ÍiÁ\ìl¹1¥µKq\ÏrÚ±\ÖÿÖ¦6.V—V\åpbğ%[ /4¦º»\ã4t\èØ§WXm9:h«¹\Z†f¬ƒ.o\Zb\çŠg®>Y\ÊI¦va{2\Öú\âÿ>²t´\Ø&¦³\î§\ÚÅ°^ş^zyj	o\0\ß[j±&C\r0BınÊ´ôn\Êkş\n\âr¢O>œ\ÚW\ì²ÿ$>·l\ÇS\ã4æ£¶KO„\Æ\Õ\É<ŸÁhV¼Dœ\0†\ÙH3\í]_\Z–+0f_ş«\\L3£„C÷\×\"%LA‰M\Ó\Ê\ÃFV¾Úˆfå¡§÷B\àNQÀ¢ı\İô\âµ\Óm‡q\ëò:7\"|\rVøôg¸\ã3\0ı•\Ç$\ÆöÃ”\Ò\År^v‹Nq¬‚z\Ş÷\ëøzö:\ç\n½‚ôsNÙ‚ú‰+\â/:\İ\nNñ°\Ãp;§<ª°¯­B@zÆAšÁ—\Å\Æ`“ôvˆg\ï »k­¶ “\r\Çe	Ôµ\"\â÷Œ\îõ0\'>şD\áfa\çğtö\Û\ÏÁ0\ã\æ?\Z~~,¤&uê¦©C\èô:¡q›.ÿ\ÍH~Áş/¼e ÿÙ³Gœ\Ñ-\ÑKY_˜ø3C—¡\Ø\Ò•\Í0\ÈTd•‹†\ì\å ºx1{\\L\ä“+\"ñ²T/‡;iKl¼\àm“BÀ¢`¹kı»&ø¶44o\ê>¸†\ZO 8Wi.,ZE\Ğ$©‚­‚õ=T¨9\ÄnmWÂ¥{\Â€!>ß¿Í¿>>\ç:\Zdñ\Í\Ş|=…r4›oA<©•\î1y3\á-r\æ!óI\ÊõA~N»\êXõ$°uÌŸ¯\ïe3¤\âPD+\Ã\Z-Ÿ\ÊMµ;C+¶ª\ÊŞ·\Ìe—®Ws¸PnÏµ²a\ÃG{²ñ\î´\Ûa(£JYH¹uŠ\ã\Ë,h:‹\æœ9_mø\â\'\ßP„~ø\è6Û \Öz,ó·û\×ø£şö¼‘\ëÕğDUP+y\éa\ÙÈ·q\r3M¸”‹\Ú\Ñ-\Ò8²ö“\ÏÀ\ZPı\Ş–[A\Ä`Iğ‚\æ^1ıİ\r©N-\ì\ïz OJ\Ì\Æ%;\ÓüdŒC‚\æm\Í\ÓÿEM\á\Çi\ÇsÎ¡\áñ[T €òP3«0,°¶Sw\Êù€\Õ\ÒJ&¹ Z§E«2Ÿ\Ñ\î\Ã\ìÒŠ–Öˆ’›ñÀ\çA_ú«XœAÍ¯·2Ø‚\Ä{¹+ô‰‘ªM³\İ\r?^l$‡W vC÷Ï°|T»a#Ov\ïa\ã\Ä`¡§ \ÏS9şª´¤fe|°˜5¯õİ“E)b\æK§”ry*j+—ª]Aı0\Ç\nSP\áEc\Ú\íö|s\Ô\ávğò¹u€tL+šs;©’üÔ§a—S\×À¼E¾dIIJ•SQûùù‹{\èN’› ™\á¥5¿HL$\Ş`!z6\Şö\ÈN¹…l¶€Œ- \no\ß\æ“=\Ú\ncy¯©~[Àx9k+\'\0¨v°\éLšVõ|p™zö\İ[¥Õ\r‹\0e\ÄI&jl•z\ÂÍ¾[n¦#5¦\Í\Z²ĞŒ²Nõf}ùJ\Z\æ†\ÖN\Ñ\Ë\Ö\Î\Ôm¾\0z@Š\é•\Ôwnº!H\Ú,5¥j$SH~ë¬Šù§ÿh.–3––±8\ë¿d\êH\Æí”¤D¨\Z8Ao‚\ÒF{DLsyAñ\Úiò\ç±Ç‘·88üş\Ğ_¦Gº€e’ye\ç¾7¡Ã—+ÀXMvİù\ÚË˜:fM8;—n\Ä!-^ş†\nË¡À,<Q–c\Ã[]“À\à\è\ì>óF<”ROY<m.òfC²1)L\'3­—7\"\ë#³°`1›8t\Ô3OJr¬`òD_/qÇ‡b¼¡/¢°\äQ²Ÿ’Y¥„BÖ‘G£I\Æ²³\"Ÿ€+¬;ô8r‡ƒ‚ª`±A\ÈM v÷0–7\Ã\ì\ÉAO^ûC¦l\Ì\î\Zg ô;x‹šù˜x\â\ãc\èd\è÷	_¹ğ4\Ïÿµ:#“\ìÒ Õ·\Ğö_¿:\è\à\×z›s\ìmº–qF|²ftf-…5\Õ\Î{>…ûIt\È\ÈDvı\Ş\"\äFD\åe\ÒJ\Ú ğC6\àô‰ªõ¤ƒ²^pQ\r\Äj±—¯J¼2`°{†\ì\îò:n¼Q_,Å»¯=PF\Ñ\Ùu}Ş±¦‘C\ä\è\âYş‘ “%FÎH\ä\Ö\æòüş?\Z¿wT+õ\ÇıM<(:\×~š(Š—‰ò#šKz,B\á\Â\ìv½\íx/\'¥\nôzZ_\Ë@Ipb\0C›\Z!9núËŸf³ß‚v>û^wœnx„³›\"\\¹¿\ç\ãŠ&‰cš.T»\Ø^Å¹Á\Í\É\êC3OqI¾“\Ğ\İ\Æ4[â²±7¨\Ù\ìú\\	O‰±\Ô/„¿T\"¦ƒ­,Š’ö\Æó”ğ/µ©84kó6[x5Ì¨Á3ƒ‚q‹e†(`\Ù4\ï„\î‚\Ø\ŞPd’\'½\Ø\ër¿ ¥}Ú²§\ã«5ñ©1œJ‚Aû>£2 1|EC’“eqş4²%|úÿ\Ö\ã¢¦‘\ÍÃ§(­\ê~#W…¸\ÃeM@\Ç4&î´¢ñyQğX›ùg\Ã\ï	\'ó\Ïıo¤/€²¾>‰ \áUÄŠ˜\Ö·a\"Ö´Ô‹³&ùÏ®ş\à\ìI¨\Íh\Ş)\Ğjª\Îk7¯\æ\îa8EÀH÷ò§óW;C¥Y‡7vªx¬\Ô\Û~®p(.Ú\ÛB yD¨³÷Á<X\Ç\Óf\ë­— \ìc_CG\İ7qA\ÇW(\ÛÁè¨¤©\Ãt\ÉGO\ÏlòVehÁJB9\Ã_\Ù5|\'³~­ıI\Ø&J\0jI\"{\İñx~V\æ[ù£€\Ô¥#A—\Ñõ\È\'\rüq\è¿Wª&½l\ëM \Ìd@øĞ…9\Úeşş\\\ç†\Û\çNœ\Õ\Ş•\ÆErı\É)Ê‹\éfhQ[\ë\n•\Ò_¯5i«B\ên	Ê¡hö»ƒÁy\nIe–r$d²ce\nm–!\îGõ @(\Z\ß\ËHö¥<mŒˆk9?#„L›_+MÙ5\â²\'€\ÏF¡—V \éTt\åH\Ê\âÈºv\Ãl™ğ<?\ÆO®bFP®¦»yºQBa;²¦Eør \êó\n\ëbpú¼²^kh5µ™\íFs0€S‡`]+k•6Ë«\àT9n0Œğ3/¹\á\Ô\éqS=3\Ë\Ğ\Å\Êg\È·T©(¦Î‚\ãH\Ín4ó$‹–Kv.µö³¢„÷\ËZqy®X2\ä\"-¬K\'E5*³\Ëğv\î¦œrCÁŒº™p?\Çn­›g\Ä:Iü[­\ÚZ©C=ºu¶\é¾{¸S\î\rOB%L½j\ÚF;úeL\É\r‹>±Qd–­\ä\n\Z\ãŠü\\\Zó¶†7\è\â)M-ü\ã¹\äÊ¶²‹upÕ—ùl\\³š\ÑC\Ô\Ê\Í\ë\é}N7z|·\Ï)\ÙB\Ç\ÍM~+\Õ{Ô \ÄaeiaHµ‡n¬AN¨\É\é\ĞR¨6@¹Ğ³¾F\Ü\ì\'\ÒuK[5D`±\È=	\Ë.N{\ÂÁ8²\É \ÓOXvOvŸû\í\Z~T\æ\ãl–¤\àû\ÖmAePŞ§Ÿ\éV+\nZ\Ñ\éšgqŠÛ¡·\î\å\È3®\ÎM8\ê™\Âz\ï&Œ\Ä\ä@ùœ|f\Ği\È½jy\×\×\Ò\Âf6ºZóvƒœºBô 1g· {)7”oVtCg\Ò`z\"CA\ÕZ3£p	“05\ÍW¤;\Z·sAB˜ÿ‡~T\n{“ˆ ›†Ï¡¿–‡Ô½ 4;Á\Ù\à8W7ı0\Ç\ï[æ¾…\à©nŒÁõ•\ã\ÒNY Ê¨¯²NA@À»v\â6»È©\ËEörmaü‡\Ï(\İ1 §Í„ª™(­h¨\ÔMõ4\ËJ\áşJôe\áŸS\ì¶G\è\Ğ³•¼\"¢›\Èk@½tu–nHx}iÜş\Í\éôû\Ö5§n UC¾7q\ÎşqUğ¿*0ª:\á;&¢.¢L-\ÄPšqç‘šs\Ïı<S  s÷4„®^õ\Ípò\ÄÙ‘\à`(„ =Dc\ä\ã\Ü&¯ãœ¬®g/g.\'|ÿ‹[‘¡}½@	\rs\Zx}€$Sû\Ç\0c\Ú?$8ùÍ€Àˆˆ\ÑÂ­\ÖqHfs^\Î\çc£kOºtCBr˜A\Én›\0pwº(\"Üµ#\ïFñ–TjQJ£\ÑW1²Z|tk7:\à„u<`ºH\ç³@Ez‘ùqúû\É^÷{\ìù]w%…\ê&€\Øiq»b×—ø˜4c\r`z÷H¡ø:>­nüü/ù—3¬\Ø,ùô™\\X-\Ä\Ø}øNu©\ŞÂo\Äa‰0³À8Æ»NYb_‚”õDw¶!9£6\Éd&>hX\'FH\Ç1\î\Üğ\ÒaË¨<J­Å¨ÖœDwd¨`Šˆ8cª\rqHØ¥‚K\n?/I_ùH.¬\Z8¤\Z±	ÒŠ\Ç\ÕT\àt\ÆqÀ¦Radiø\n\İ|{]b®kˆ5ş\×Á¡‘`V—S!›I\íA]I\È\èE¨Jº=©÷š†)\ÌüF‚K\ì\ÖvÁ¹\ây‘_TH”&ß­ÿzG¸œ\\\Èpô+j“\Ú\Û\â\Õ.u\\\İ\è\æ)„E—¶\Üù]<iN2^=ƒ.Ú—\ÍÓ g\Ãò\Å]Š³ù;·€iÄ½H†Ò¨*\Ó@S[?\èO¥¬Zg³œ\Ún‘Hš‚S\æŞ­§\å~\éÌ’šwRú\ršŠ0T±M}©\ïz¨ûL˜¼¶qd^/N4\áŒ\ã\ÆC!\Ú\İ*w\Òw\×\é\ÆwvüGU°&İúşA‘Fuı¨+Ù¨=t7jvB\ì\èş(k­µ\\Xp\Éñ»\á·?l\àf;-X©ğ÷JFw:mefdúW\Ùş=/t¾/òZ\Û&j’\ï7sÇ´\ì*9I!^\àcC½÷Nº5¬nÀ\ZŸr0k&‚?Ø¥«\Ä\ä:÷ñ¢•Æ”\İ\é=Rµ\äoW»÷ŠnüIç»Š	W\æW\â\nğ\Å`\Ú\í\ÙY(ø\É9ñ†œ/©%¤Ad\ÆôGwn¥&I|‹f\Ş\"««%JRY¶UN\İAc\ío—!×–Ÿ\ÌÒ™Œû‚ªgş\Õ)B¢‰°s@^H­9ıN\Ü 8ùG‡³L©û0\ç)€Á(’qß©ş_\ï\Û-\ÒÕ\ÇÀ\ä	\â¯\×\\Ò™ø´Hd4¦bS¦İ¶\ä:/³-®¦ôn\İó\'?€š¬™<~2_	\ë\ç@!5\\ 9R?E„µ“g7MoPP×‡‘\ãch<\èfB\Ì|\ã\ß<\Üd®\îV9;\Ï\Ä2—\ØZµ\é\Ñ\é\ß[š³&oƒ0dqŸ\nebôº4\å\ìišs\èù°f\å\Òz’´™qô6«—J4iV_\Z‹Í©òe8§wœ«M9 cº)\Åhµ¬\á³\n\×\È@\\rw\Õ\ëEG§¯»„Vƒo\êZ,EN–\ÈRËqœ‘”Ÿº\'_\'>{9\æGH‹\Şhˆ\ãq\'\"›f\Ô\éhğ\Üc_œÇ¦/Ü°Ë˜m\0;5V‹ğr#U,€\Ë[Rd¸)yÜ€9o>;Es\r¸VÙ§7Xv\Ñ\î\á\Ì\Âz\Z:w3\ËÇ¶–D\Üğ´U\â@w…ø·QÍ  \äm\Æ$¥{$U5’C\éò“\Ê\Ûn\ÛBım<!²?\Ø\èg\ï\Ù\rğ\â\×Lğ_‹W˜\äp °S\Z>¾¦\ÄI\\¶“\èûªş\ÓI\Å{3$¡º–dn«k»\ŞöM°ÿİƒ±\Ç@şx¾­õd\ãs\à\Ş^†\Ğw\ìü<ˆ1\Å#CgÜ°€³™7p}Ùºº·g,«\Ô\Ã~\ç‘PD(\è=Vò!ù^o%,ÿl*[)Eªö¹‘H>Š	\"/\à{÷»o•=´n²¤ù\Ü_¨¼Ó¶”=¹±\ß\ìMª\İN\ÌQ€h?\Ø\Ë8\íi\Óh_\ëœpQpQ\Æ\Æ\Ò9G ı«šƒy\ë©ß™¨\å’Ò \Ù\rN)<kD|WôH\ã_3\Ö\Î \é+ø\é”ŒªÀ†Q\ëwn\áq¦¥ô¹>3»C2\årm\'f:D\ã\Ùø¢®	\Ñ\ÈüWŞ…¶e\æÉ»ı(·@‰\ÔÚ”¯W$™¥\åó\î™‰r¢O´“	Ú†\Ã_°›Ñ„\âe¹\î\Ô4/™ \ÄOË·°j½\ê%\ËÁÀG\Ç7ûLø½Re=\rG\Ô\ì€Wü\ßğ·{‰!y²¨~\àu\ãGd’\ÌÛ˜‡”…=££\Õ\ÍabD\Ş\ß{Fyl	Íµ\Äft;°G¡¤\ê#[\è¡\éÖFA®\È\ç\Ïí†¨\ÍŞ®ü«\ä=1UE^\×ø¿Fş±‹ºB£»u}\Ì\ß\Ïö’_–\"CY\'ò\"››/|iA+o8\ÊS\ànĞ”(“¡\Ë\í\ÌDd\Ó\0=ù\ä¡·&¡ˆvƒ\Úİ§6\î-©b|ƒ&ğ™ n·•¾ˆ\Õ\Õ\Ãi,Ï¸\äòdküm\ËÌ¿I\ä2R\à½Ñƒ{XÓñ—\Æ]PÁ·°`]z”¦•2`¹œ«ó‚®X·94No¯†u\Åö\ì\ÏerªyÉŠ\n\î¬K\å(\Ê*²»ñ®M¹¹u2\ëb~\rö\ê\è\ĞE\×[Vo6RöZCJ{¼}f¬YŸ§¦¤\ëc\Âl&§{Uó\í÷Oş\å3¤›\à‡\äa\ì½oñÄ°#òO¦Pg«±\ãU“\ìØ¶\á7ª<\æ£o8g…š»_\İÂ—(\Ø&• \Ş`tˆ‰\Z!I\â\Ëvz.ÿ\Õ\ÒMğ·™™9%©c¤\Ùv¸Bô\îŒ\Â~J+UM?\Ï\è—ó‰\Zœa5^k\Å\×\ãü\å\nª\æ5«Æ†l“%#€¦²) \0\0ò±\ß\åã€Eú.|\çMPqŒD\\\Ä\Ì;J;R4ù–\Î\ÂÃ— K™eÓœ¥üpDœ·ˆ{\é½Ñ¶İ½ ±%*š˜\ë\ß\áš­†°„\n3˜\Ø\îå€¬Tğe.Ms\å\Ã)@Ÿ•;[<\Ì-\é\r¯µ$\îsÕ´Œ¥]^\r!\Ê+°êˆ•ˆg¡V^õø—oŠ0X¡\Ù2¼½·\Çô\ãŸ$§ê¥€D2\Ş\Z9¾Al@YS¬2ô‘\ì\Øx1!\ì1›\æ±iµ¡ˆc\É†ºX}¢‰òEÒ‚\é	&A¦J®W\'1\İŠ!d9CZ\ê\Ëx•Y¶^¸\ã¸p—?\àn¡\Ö\ì=CX¾\Ón\Ñ$zùõó¨‚3x\ï\é.BÈˆ¨i¿¢c\ÛV…×„Wø‘i‚õ2¾S\Éùj\Ê\É\\V\ê«öM˜ùş¬s\ÅS~\äóúõ›;}\İ\â“Mw; –L\Ò/\æ(\Çbh\Öo,ÿ\ì È˜_²H³\Zi’Ñ°\Ñ=0\ïenöş`•F”£h¤¡‹\â\Í6\Üºk¸­Dg^¿}!\ê28\'\éHšDµ^\íIc5·À-ù\è\\BÒ”øXõ”=9>\Ë\\HZ\ë{€ÿ¬-5©®ù\Ï\Æ\Ò;SR„\ÙP\ä\É÷DGÎ—„f´Ôƒ\Õe8\Z\\j§¤i•@Q1´ü\Ò~dÙ¶\îƒ(\ã©ZOŸ§4ğ\Ø‰\ïG˜<E\Úód%b\äP®LiW„\\\Òl_,x\Â^z\âûO˜t¢78\Å\n<f]:\Êa6ñx ¬5\Í%\Õ~4¯\0;\0qÂ¦a š\\NDõ|\Û=OU\Â\á\rŠØ­|òù\ï#\Ü\Å\ÂğÕ¦Ë3\'\ã\'€\Écr·9H\æ\Öş)T\â=ª}\"\n(@\àeWR\Ê\Üw|ô@Ö\0h\ÅU­\Ã?}H$ş\ÕL0RPñ‘=á¾ª¤…)İ˜!üA¥l\"3²K3fh7Fe\Òpe·\ç\ïI;ŠcUû5(¾dN.\Íi¥p$\0u•§\Ûş•w3,/\Ãl\ÊFO§\àr &Uÿö\Üæ¬¸\ê°zcoñ_õú2…Bò¦\È\ï÷†²!FA\í2%\ßÁšS¤	¥$š\É\Ì\ä\Zi©µ\ÙX\ã\Ô\Óâ¬•Q\Ä[\È\Ò\Ê»‹\r—K}j‚²M“¢VZwU¡—xr\ä½Pğbû†©¶‹8Ÿ5—õ j\"ÏŸ\Õß‰¸\Å\"&B›Qö\ß‹3²K\Ñ£\Ò\Ó7œ\Ú=3oœN±\Å%ñ¢\ç\Î\é\ÊªU‹‚ıœj\Æù˜\Ìu»\ã-‡ó\ê(\Ñªpnb\Í\ÈÄ‘y\Ó-\nhi\å\â00\Æójwğ\Ù	#Ç’.JBƒˆ·?:ùÊ³{ç§oS\Ï9«»2\ãn\êÙµş½{‹C\ÖUˆµw\è°!-Mx‡\n¿oY\ÑıœA¤”\Ú\\\Ñq9Luz/½F\ZÛµ¢V¥‹\Ğ^ôı„\Ìs”@¡,v \ï\éJv\è\É\Õ\nh\nZ–J<\Ó²\Û*Dc®£\İ\' ™7!µIS¶ÈŒ\0•\âª\ÔO\0{‹!\'ö8õJ_^õLò¤Z\îñj;P\Ü\Ïòª\Õ\ïœ:\\\ÛùjÛ¢O~^Ï„Æ¡\0·œh³\áy_e±\Ó[¯\Ü\Úcœ€ÉWV<ZD\Æûò3º\\¢4¼\ã\ØRE\0£\â?«¬\Íxù¥ˆ#}#Øµ¡)}\îü\Ø\áf‚œHÌ5±¢– »\ã¼\åºag$\ç\ì÷Ïƒ/i\è;¡D¶\äŞ¨~÷…o×¦”º©\Å,X\ä\äGQ\Ï8ù\Ñ\äfb\è*öLf\ã\Ça\Å\ëÌ²m!OD#V!Y\İ9v\æh <{Dgµ‰E]†•\Şò\"|\ê\'ÀS\Ñõú´\àu=	\ĞhEMC\Ñ\0^\Ç°1#arÅ€º¤T?ˆi\É~\'\Æ1\"\n[‘~©^;pñ\Ã3«š{R1» •a%\ïV\×i`f\ÈB|c<#7)¹ˆg¥©_ıu^÷¹<—ùÎ¢9Î°\Ë\Â	£7q—¦}D7v5‚aa`ş®™\È0µ†`\Ë:‰341§\Ş\nGúxw\\¹Ë„7‡oE—÷\é\äò\Ù+\Ñ7‡6Y{½ûoüdZ¥s\Ûú6s*¢ó(üòZ\È+¯rgE•\Ì=\ÓÂ›•~WW\ÏDı›(¨tğ,¶µZ\rFÿ\İÁB„\Ù\Ë\×-\àŠ«sôü\'¢*/¿\Ù\ÆyõIûˆ\ÑYf[.l4«E}Ó´\ØP\Æ(©º\ÏUñc œ6\ãçµ¹º\æ‚ò[;Gs\Ù\Z=\Ú\Ğe\Ğ	IC\ß\ĞjO{g \äwÁûõ/\Óy&ı\Å\Í#\Öñ´9ZŠx\Ù\r\Ñ<CğÏ™WŒo\Ê ô•	óQ[§\0\ë[+ûª…ıJZ2û@­5±S\Ñı¾¬¥ÿ¢\Z\î\ãƒ\Æxm\Ä\Ò\ÃH[§Ğ‘\ï‚À\åx¿bM\ìzTj\æ“[úx¢%\å\Ù:q~L#…:À¶Ke÷ÁB8U^Ëˆ5—\ÊWQn»:aú¾øÀ7f\'\ïQ³´­\Ôaõr\æ5ô„QLø·ğMö¹«}C\Ï\ä‚b5lS´y]oÑ¡ $Ì§+\Î!~y–€§\Úö,È¶»`t§\ê¿P’\Ê \ßq\ìùš÷B®‰\Ùß¿\áö¬K\î&\ã‚CúÓ¤!\ÃùUw\Å]¬>!Å´\Î!¨c/Ü’5ö5Z£8•\ê†´Y\ç\åSb€ú\\‰ø\é¡lºñ_¨\ĞeDi\ëca¬\ìÊ·\Èl8¿¸¨/z¤|)q«\Ğğ\Ş\Ãm\Í\Úğ‘\ã–\è=\êÙ·ºhVg\×S\ïH\Ù\Ä\Ğ\èŸF]\ÎvC\íhL«\"¯ğ€D\Ğ\ØY¾\ZBŒ¾yWQA=AVşn1+§ÿ3SH†• 2EğfEr»h¦l½\çT\ë²\'~µ[¯”¨\ØĞ‹|\Ù\n\Ùÿ¼·z,»£E\àÏÀ‘Y\ÜJˆ\Ätl\Ê—\ÚY˜’mú\İ:\ì\ç\äeÚ¶B¹\è€PK,ıõ²­\Èu\Ú[µvı(—\Õf\Ú–¨\æ4}~{]69>SX_\ãÔ9\å\è?JAn$ \Å<ñ1ü\Ói!\\ñ¿œ\Ä‡ºŒMÃ¨X¤¢v¥Wô\ìn\\ë ı\Ê\Ş7´8¥\ê„\É\\DX\Ö:­ğ,%¢ºTQ¿#MY#´¸\Ø\î½J·\Òx>ö©%l…0“j\ÒŸJK4Mˆ@kam³÷Z°OmUT®—Á\\°@\ÆR\İ1×›§\' \ÕpOš!\à8ş¡\Ï\Í\î¿\ÆZR\ßHX\ç©ğŞ \Ó\Ï\ï\"ÁBU.i€ôõS\ÖA\Ó,²\0\ænp¼!:F¯]6İ¿\È…fCü\"4\"\ÆĞ—\î¡÷1\ÈC×†\Û\ÃN1»j70©WÃò°öjl\Ìø$¸‡2.Q†eº9³\Ï\0yc “qİ†v\Í8*\çß®å‰°–iÚ¦]U.…\İ\Ñ¥Zi0È…;\İ9Nr€õ˜¸4©¹Ğ¯yÚ“»œ\ë,^Fû¯8†\ÓØ¨¨ü‹\Ñ4{t¹G9\İ\ÜÀu2\ìRø!€!¼` f5y.qµG^J\ï½u\ÌZÒŠ\ÃúEüL.¬:=úüü\ÄY¬S\rŠ»İŠ:*\áM\ß\Ã9‰•yùô‚g7he}c¢½®r˜Lü\à »‚#\íe·{t’f57^>öZŸhU8µ\åBS§	\n¨‰\Ì&—t>1¾›«™\İ´YF\æ\Üq£†ÊÓš\ë•\ë\Î\Îş\ä#Q”·F§J¢ñ+§~\Ş\í\Ì0\ä\ÅJw™$®SÄ»S±vª\Èm>¤MgÕ¥©‚\Ï,³nñ\Ê\á\Æ(|ÒœM0,\'$f½}1\Ùr—\ßıŸ—h£B\Ê\\\éh4Hˆºõ„\Â\ÍÇòK\î\É\äõúA>GU‘ª¡’\×…\æŞ—«`†v%H\Ü,¤´\ê!‡ñ‚V\ë†÷õ½»õS>ù67f)\ÂÒ¯wV8\'»‡¬hœóuŒ\áô˜SQÁQ¢“ò\Ü\Ëp\05’ˆ\ïMq°€\Ê9\Ç!¢,bƒ\ïmuŸ\í\ê«\Õ]l¾²JŠ6P8ù£ùX´\ââ’½L£\\Æ™º@a¸!éª—\Ö`=3‡\Z¯+¼VC\n‡ûÁ°`Á\Úğ¼(e,f\áµq\ÕüA\'T’E«O±ğ\ÕMfC¶•\ä™l^\ÎQmm-¼\çP—\æ¡ùª%lg\Õ~\Ã?™+^\ĞÒ@\0\Ü#K)\ä_\'\ÓiÓR<ÿ\æ&DfµN+\n›…³\Ë\Ñøyk\n›Ë“l)P¡\"n\Ö&ùBŒ?9™o\Éª\Õı\"yö\ç\åZk\ÖFÂ€*ñ5\ê8Ã¦N°\ç¶9¤n –\Ö\È]mk\ÊòœÛ¬\Ö\ZgB—%cjrLsJ#—È™I9Ô’/V\'\Z\ÔD+#\r\×û	1\Û\0¼pÀs9§°ivs‰\r}¯r—á””ŠŒÿˆ³‘ÿ´Y§P>¾5‚;ñŒÃœ\Ù-N\ÍşX„e\Ä\ÚX%ƒHüLÌ£µ¨„R\ÎÑ—\ÂB¶m\é£f\ÍÀX\È:S\ÑI»®Ù¿&Q\ÍWT\Ì\Óg#„\ÈNR„p¸Cür	\Ó\å)1{Ch°a—1E\È7™´Ü³3U\ÍZŠS\0¼¨\àU•<#§&\Úı\å\Â/”0‚\0ù³_\Ûiöt\ĞRh>N—\Úö9®‘\Íag\Ö;{ü\ĞÖµ÷Z¥\Zjo\r\ÆD_-\ì\à‚\à7’Èˆ 48TX!(ò|k–\ëu¬\Ñ^\æx<o)-šß¬Qµ¢; £ˆË†O¡Ğ´…}7¡ú@?\ÄÀğ\Õ\r»k)\ïÿ¸İ­d:c§h.L½À\äUP¬>ƒ%¶ujŸQß3m}KY\áX\à\İ\ëÆ—ı|VU¤n²†QaF¾+\Å\å\Z©\ÚÉ«_“ø\Ñ \0m’õœrdıô¾S²>w¬;Ÿ£Pÿ5€d¶\ë\İ\İ\0û\Û\\¾‚Q\ï\Ï3E\ÜĞ”ş¿n’«\ÛR›\Ìø¨º\êl®\Ä?-¼…a8\Ó4W¾pvÓ„C\Ä^B$\Ël\Ê\\Š›¬Õ‘\Íó\'ùĞ’\é’\\·‹\Ë&8\Ş#\ÉI\ã\Ùs\ÒK2\Ø\Óu9ó\ÆÂ•\ÎT“ar1€Ö\'ô\Ìfú\ÓAI¬Ja\ß\Ô$`\"4K\ï\"µB…,[\03;¬õ©\í4\á&)L”\ÈAÌ¯)6­\Í\ëˆ2•\è\äıd\á›ò(_*F¬+``†‰ÿ\n\n\Üp\â)-\ì¥+b\Z\ä\ÔOxK\Ñ\ì9eŸ¶tÚˆ^+\Û\ï7\É8£À8±i°dù\å+v\ëX\ê€	g$¢@r\ÏG©\ÖO\Ûb1ˆ°F»\ß&›@LøÜƒ›ñ®†²óz<…‚ùÙ²\Å\Ş0\r¹¢x\n\Ò\ÜYß½¶„ U·<û \'fwŒ&t	õ\ê\n¬_!\ç\Óô¦\ç)*\ËHJUS‰H\â=$\Íuø†—E\Ş`eQô=eO+.5’2J’\áw˜!J\ì¼I&uü>u¾Àf‘BœC§$¶[XŒ—\ä|\"öø\r¢S=\ì\ÔG¢Q“’\ãŠ\Ë\Çù>5’³\ZEQ=ˆ,	küĞ…X\Ö>ğ­„‹LO²2\\m¢g¡Th=¬\î! \îJŒBˆ\n\æ\ÊJ\èK_‚³zJú”\ç¥}‰€\ãœ\Ä7\0­™EZi\"O*\Ée¢\æ¬©\'¿‰ù¯\Ók™c\Ú#‚wÙ‚ª¯\î£bø\'ÿ-j\â\Ï^E\ç´!l¯µğ\'pp.€û4j”\ÒE\ßn€\É	™ö¥.\0_D•]\Ëp\Z‘eM\'\'Ij—DN9I¾0¾[Ag8P\äÕ“\î&|\\Õ‘]:\ÎD5²\íK¾ø\Z©Ü‘>J~£\ä€Y†ògô\ãx®,9”Q…A†4E7¸¤$‡Ú‹Ê‘_]Vù\r~\Ã\Ã\\k\ç´g( t¡·xD\ä ÿ†ü\ê\âš\Í\Ê)\à7ú\0HÓ·f²?\ä ‘@^~:ıM[<vµWEV>\Âb\İ?R l	ù\Ãúh®õµ0n\Â0‹7ş†\ã=ÁU?I|\0ğ%\ÚVw9÷\ÙÊ±\Øü\Ïƒ…sZ\ÛOÏ°\ÃEü¤Œ\Öj&\'\Ë\á4KF’2(¾9³;ñFZ[\åsYn“¢²\Ú5±õh±ø\Ön}9HpƒAşDŒ€yKd\ë\ĞÁ˜:\Æ\Ç\ß[ş\Ì&~_÷=³Ú¨\ÕjWN³e‰3\nÊ§ô2\Ãk•›©N6#z™³9x‘sL\Îú½À8˜ò\á‰jP2\ÜR¨ÿ\ï¶\rñ\ìœß\ç<¶4\Ó|\Îø—KHM’‰o\íœù\Ób\ØĞ”\Î+’PgóuOX\Ît\Ú0[§\ß\ç39ÿ\ÆAõ# A\ä¥i®E°\Znû/\"r \Ô1ùh…À\×7¬–\È(ˆ\n‚úı\á\ZÕ— Ø¦\ØP5…uõ|\æ,$b\ÚúY\ÙÇ›¶óh#¹øş„¿\çO¹Y\ï¶9«Œ¯†\Ğ#\ß\æ\\Xl…ò,=]…¥)\Ü246üQ\Ğ÷\Ü\'R‘H]Od\Â&]ˆ‡û\ê†j\Í.¹j@¥d&\×Û›\Ç\\^¸?i’‚‹´¿-z\ÊQP>¤¼vX¶K\rŒO\èbSñ&wb\nV,!aœk¢VKS\\\Òş;¨9¢P€s±ù<à¿ 8\Ã65¾]@ \'\Zd¦\ç\ÙN\ÒÌ¤¨\Ê%‰\àøôœšoó™Lj.š\íş®ÿ­-\Õ\Ç\îİ­¶!¤øÀu\ë$¹&—Ø—İ•/·¯ô½²ƒI¾b§\ç\ÄõM1}*ğ!\Ş\å(Á(õ§ıP£õŒ7Û»wbòz-”\éG¥4u†²j±RUel\éŸ,c{_Ğ„(® ¶?\Ë^\ìr\Ë}\Zv¯X@‚üÊ¦@½‚Ä—)ò‚l†R·–F`õ§°Š\Ê\á•^”H‚Ü™ó8•óŸ[a\Ûü\åB²ó÷&\Ø+ ~÷~`C½\Z\Ê\Î9Le‰UN\Äş\ÂE±$\Õ=¸]–\é&/7¥\ÜP¼=·No \Õ\ï\È=\È3—ñ…~P\ÊùºŒÑ®â³¢P¸ù\á/\ZT%\âD\ä\Ãb\'¼ñ,\ëj§^ı°&C÷\n‰IŸ¾˜¥\\;±\'œ…­\è\Ú\Ô\É\ì³ AÿB¿¬8EIBZN…=\r.\\q½‘-\Ò\'ğı‹µQ\ØÀ&=£(4\ZXùI3‹J\å®Á¥5}9(3ß\È\nPV…™¢¡Á8’h\"ß¼™\è\Ü¹ıjn;†ß:qf\Ò/5¬\Ãv\àWCfNUº¼¨*\ËBƒ.z~\Ş\æ/µ5$1\Ø-ƒ\ZUº¥}b®\çP`‹!\Úø›:š³­\Ç,)ó\Ùyœ€†¥s{¥\æò\íZ\'x)\å)Ï¿rq\n>B?BP,nF\×\rya\Â\ŞÈ³B\ë.F‚\ÉH¯\ß\Ìôr?-Wœ0“\ï\n\îÜ†\ÈQÚ¸pÁ±\ÚW¿\ç:Ç—¥\ä\É\ë.\Şw¸.\Ü\Ş(¨qˆ?U\ÕXöidFò¢Tÿ¢²%8\ÈÂ²\'\å\r8Ÿöıô§2ÿeY§QoñlJƒ=—G½\Ï&Ê®ò\ês_«\âPœ\è\å/ğ\n^Æ¤\Ë_f\"¥ô:XA?\Ñ\0±~)Ù¿x\Â8\ïG\Äeù*}ô²\Ù`@Ş—™Œñ\é\Ägu\n{?¼®ı­!]\Ö\æS6Ÿ\"´OQˆ8wJ\æû‘\äğ=i´l\Ãy\å\Ñ<\ÑLz\Ï%B\ÅÕ§¶‰«˜j\İßµ\Å\ê‘X\ê²¨\Ğ\Ë6c8¡Üš\0\Ï™t1wu½’\0„­{¥\Ñ<;†\é&´²1\êš97>x\Ó\'3x\íô%z2 \ãCóû\ï‡\ÌÿJ¹ş\ŞJ‰â“¾Ç‚`£¾´\r¡‘Ö•Û¿\Õ\ÊQú¼\ÍŸ_üRv½\Ò{(œ™´l¨\Î\Ï\Ø\ß\Ğ,Šx•j\åiy\È Ì†:\ã&\æ©^°\ĞS\íw\àª ´\Ş2©Áÿ9P€I7‡\Úa]]ù—¯Ÿ;\0²»70\' EZ—8^[\é\İ\è¾\Öô¥K\ËMl\ëû™DH\Í\'¤\ÒT‹\èk†„¬N·¨=I@õ§Hˆd\ãÀòv‹\ÙJ—\É<‘¨Jú\ÕA\ÑÌµ›omY\Ô5\ØòÀõF\nÎ\rÀ9\Øû‘<jTñ}-.\â[LÕŠ{½ö¦Z€ô^ü+û.\áX¥\'Ö°=š\êdóÃ£Y\à\Ñ\ëQm\ßy9&0¸\ätô\ë]\Ì\Õ\ç•\çòk&\ÔuYŸª\ÄÀFG†\Ø\İv·>µÒ¼¾\íg«avüz/¶7T\Ù\Ûûc\ê\íb øo 2×€^«\ãûc\Ù!K¦!˜!S›`H5\ŞINÉ‰>¹\Õ;0)CÌ¿\Ïù›\n{\á\r7§\ì{5Úš¹!÷0¬|†;\Ùn‰\äLvVœ%û˜\ÍW=!¼m,X”=üfKû>pL\Ş\Ş2\Ó\Ç\\À]\Ê(Ş¶\å\Ä(`\ã›e@€%\áÁ‚`¨Q\ËauRxG½‡0l+`\É\ÕÄ·fLİjŸ5:ÿ3ö\å\ç\Û\ÂS_l\ÖÁ[Éˆ\îœ\Ò!\Øö SF*3\È&;\Ş¾µ\ÊoQKûj­Fıú À-\"÷­¯×¹òñT¸šÒ‚º\Ç\ÜV+‰+x«1?¾¶Œù„\'Á“nª*=³\Èó³šfş¹Lu\ÏM&\í\Ë7\êk;û¾V‹Kˆlû}´ú\àı”±™DITc)DR»\Õ\âM\Êò‹IfÉ›A›\àNì˜¸;\ï¨b\ç3=W$ \Üğ]øcOS\á‡lND28<–ğ9Dn:\Õ\ã]lXtğ\ß«\ì‚YÏ¦Ù›#	XF\Ğ\ê\Â\ÕDÿ$ukB\Í8zh¶+©ˆ£\ïX\ZÈ–iMôLU\Õ²x´zé³Š•a®µ€9X_wÀ;„–=;½\ÒĞ«†\Ê\Èg|ô?g¤\ì\íÃµ»A±×‹ÎR.\İR\Ø\"|\\\æşf\Éu­7”y%H¿ŸP¯kM\Ø¢\íø\äL9t9>óòHaVı\"\êË£T¡ı‚¨ Yù.LŸ\Ã†i\Å{_³u˜Dú…‰Z	[7€\à\ë½\äñ¶-¼Ô‹™¤\İnŒ\ÄvT#oZœÕL\Ò ^±<®‰\\ól~\Ñ\ï\à6p²õuŠœÓ«\ë\\˜l	\Şx\r_f\ÊXp¾Ï‡7\Ú\n\î\ÚÃ¥\Û\ê§}xX‚KÉ†K½!\\­\îº~€¡‚¶Â…Mg\æ§<p{õAùd¤\éñC…\ï%›\àÀ€–}˜q\Ô\à\Z‚0\êj\åœ\ßDG¯†‰…¯Ó´Pš]×­`u¼û1%8\ç\ç*X\ï/—o@\æ¡Eµ…N\í=ğô—<\éRÁ’+ø–\'±:Ÿ“L\Ä\ÛYCşPkkmº\Ë\Î \ÜDÂ˜\æó\Ç\ä\Ûı£óW\à\Ò>ñp0ò\r\\\ä/\å/N\âE1[ò\Æ{fğ&ªgLXrĞ–µúH•@{±\ä±wfm…MBñı$\ÚòH§´S8\È{§ş¿¾¶7Q¸³¨YE§ j	ú\å5¤¯ß¦\ç\èVD\0±\İ\âsna¡fQ‹€#\Î/¥‚ôÙ³€r}\Ì\è¶z,÷C°Î°V‹h¢jS‘\åtöø?(\È\Æ\êmn\à\Ô\Â\Ø\Îp\\b\Â\Ã:™“øO³³ı[9½9j…L:À\Ğ\ã\æ¹Ò¨/`\ØW)DYÀ\ßuö°¶fC	3(o^•\Ä\Õ4ôT{2[şj\ÛPfe\Äÿ\Ü\Î	ñBGv\Ä^\ÅOs³©>¼\ã<œ¬/%ĞŒ\İ\Ó\è\0\nÿ2»ö‚\Ó?¬m\Å~@v\ã=0?Ë¥­—¤^\ì\ïP3v¾h¤‹\ÉK\Êz\çCöƒJp\Íf-©¸\ßˆœ1\ÔÕ¦Tp\Ùûa\\L\ß}BÇœvş\Õ-\Ù\á\àv·¯ „z\Ë1d÷±\ÄW-[„\nC\çQ,\ÍQ˜\Ü\Ü^Á\çğ;pKV\Ô+NAØ¥¨\ÆO.7§–j¶\Ö\Ëz;(_4O\ëø¼\ÄÅœnÿb\æ 4\Æu$\á\çj-±v\ã6Î¼®g…½x:2Zt?C¶†G+b\ÜuŒ\İ-£Í‘–?\0Ş§D\ÃK.úEvŠ{ehWKeiy‡\0s,]ªÍˆ;„ğºhQ0~pt\ÂL¸	X¦MR3t*\æ&\Ç\éK\ê\Ú6«\Ã%IL|\"_\Ù3ˆkD‰T¨¤cPû‚L”.®Î½Ç¯4\Ñ\á\Z\ë\ç5O¼ó¬¥m`¡À-R\04fiCü\Ôu\çAN„Œÿ\Æ\ÓdÃ†\íW£R320}Q>W\îx·u³pMÿ\Îİ‚\Zü«hÀn;…SI\çöŠüö®¾\æö5jvu\0×¦K\âO\ÃNSö\Í/†,\ì,«dAöúAYıµ8»¦ù¿[h\á„óç¿¿yù–G\ä\Û\æ™K·ÿ]*“—øUİ¡ª\Îg\ĞƒC±oio#M·¯lÑ§s{\ÙÚ\ß\é\Î&aICÆ½\æo\Ìz\×\îİƒƒ¾6GŸk\"uˆHŞ†|\Şz òIA…¡pYş<?œ\Üş\ä\Í2\ÄA;İµ…‡B&£\Ên­\ë[.¡½®\é}±C?ş^¬1‰\İ\å1«”\Z-`aÀı/NZ¹:+¹\él\Åcp¥\Ç.²N\âLl÷JMfˆ\Ô\Ü	³G8\Ê\äx6\ÔU@·\ÑkMõ‚qKŠºŸp\â1ñ$Y‡\nVª7 •º!¢±\Ñış\Êğ\İ\Û)1Kqp°{TtTZdË’°o\ë†GM\êÖºuœ`zPX”M\Í.\ë<”–=Ÿ.¿¯e\ÅX\×QD\ÇaI][)h\nr\ÍS–F€5ÿ˜\à	µ5\è„#\Û\Ãp\ß\Îf:v*s«\ÏzLNú:¿¦–\\>#WE;Q\Ée\äö°\à»‹ ¬•½\Ä\î|&T\Ñ7K:0$¤¸}`\é/\n¾N”!:ÿ\î,@¡Ÿ“¦Š\Şd Ö“4ˆ\å»\Ú\ì!`\Îú\è#š3±J*c\Ï*1YmYe™„õv0\Â!ŒK¦S]s4_{.A\"ÀŸ\Â\Êhiš‹¹]\íq×©ıŸËš)\ÆV\ß\"œY}ù¶R\É$AKBœ…± \ïzQ±–\Ø šv>¡c\Çfiû|×€?¥•Û—OGœ9)\Ä)nzû\ï	•”z¶\Ùt¦H\Ğ$¸ë‰·Œ1ğ8‰\Ì>œ\î×—qMT|\Ö\Z+¼ `\nóUk\×H\å’a§f!\Èe·/Ÿ\ï\áÜ®”¾\Å_.^\å@öùJù„ü¿²;%\İ)òÜ{¤\Úw\ã\"==rö|!ˆ˜3°´V‹-ÖºzÁ\Ö\0ó©\ëùaZ¯œ¦&Ç“ZPKFÎ½³€¥^3®BgóOË§L\0|÷XÍ§5\èhók\É„B¿WÁŸŒp®,GX\ÙÁr\ì\ÆG‘\n’\Ò3\Ğy	¿V\ß\å/\ï:\Õød%/ihw\È\İòp—A\ÌU\"]r\ç\Ùûñ¾–\0$\n\Ë\èD–o2„ª‰ô:û&_Cj‹&l&s\ëw¨Á\Û\\\ä\0F[õekv¬\Â:_±¸*c9q­¹\İ\Ô@÷8¿•À:4£\ïcqŠ½yAL†µx \âÄ»\Â\rº¾ù\ZıcM»ñşVR©\Ì\íe\Ø1=\Â\ïf-\Ë\ì4t\ŞiŠÔ¾\Ô\Ô÷~y\Ş\Ûi´Hü8›@®0\ãú£÷*\"Z\É\ì\É<°ı\\\Òı51¢›\×\ëï ƒ™¹ô³‡Z@\Â\ë9ªÀ¨´1abEPó\Ú\êIDf¤|¿<\Ğz\îZ@\Ö<W* \Z~»[ÖŸ…g\Ó\ïaoq>0”28\ìaœlË¤t\ÒÍ‘\á\Ø\í\\ö\Şq#³·ô\Ú\Ê\"\í>Zû¯\rM.³\ëc\ÙD\ä\Õ69¯\È÷Mx9¤=¥²z+\Ñ\à`\Ë\æó‡\å$\Ím\ë®\ß üÁô\Ü3R\æ.¶,ù¯`	k-š‚q‚$LÇ˜Jz0SJ\æüC³\ru²œÈ¶;\àÍ±qfƒ’\Í}\ã\Ä&,‚+˜7µœ\å£\Ó\è\ÒLÊ¹&\ßü“UZ²±·øu\\·û\Ù4b\ì‘)¡\êù7¦£u“–ôn\ã\Óıj}}\ê\',j\ZŒ·±.€­µQ\Ş¥0¬Ja¾¥0Û|\ÎXE{\âœ]	´ºbˆ—\È~;A\éÖ¨\à*?BJnõÜ 1—)Ë¹j±)™\à\ék˜\ŞHş·\Å2­‡¶‚—×‘2”’«\'UâƒœtSpaó_\í\0y•+b82¥\î0R”\Û\İ)1¯t¶ˆòñ\Ä\ëUg\Ën\0m5bp\âj È¾*¨\îW‡(rciCW\Ï	ƒŒÁ[\Ü\Ôhd‚ßŠwşc-\'ö‰­E\"#¿\Ü\Ëûgƒ(õ\ËE,\ØjÑ4c´ 5Õ£\èg\Z\í\Î\á#â¸@^·\Å	VB\\n„[\ËG¢k-™\Öş›‰²i\äH|a-\ê%ó\É{†¿\é~q©\àP¦fLó®ı\È\Ã\ëú¤¼Z5\É[\èıO_:\ËúƒH¯~+ô\äY\İ3C¾7*Å–g¶\\\Ñ\æı»\ï§Q¨œŒ\á^Š=Ó˜H\È!\èd¨\Z^vZˆO{2Z¥Ó«<U\Ë« „½Ùµ«n=8\ŞwŒõN˜\â2{¶\ê\Ô`QV&‡\ÍuQ\è¶\î0j\Ñ}\ç\çµÛ¥”ZMZ\nN›S\Äüf±ù±\É÷\â%\Üi\Ül;0-Rr\å\ïg\Ï3²\ãœ9¹D›¶\àE\î¤h\ÏÊ¡fCÂ³\×\nş\ÇioEf½†A)<	\n!¾¯ÿK\r¬Í‘…\Û\Ïx\İø\ïR\0\İaù®™}„\í…\í\Ñ=\êP\ÏP«ú\æ@\ï\\\í–Q{{¡¨Bn6÷\Ä¯a•¼Lu\Ã\âs#$s×¯™ôX(%\í§:X‹ôÙ‹#\ç\ØIz~ }	\íL…j£Ğ­zzºØºy“5¸n*™T»ø²ÿ6ºP}±\Õ(FfVm¸\Ü\ëuè²·\Ê4Œ­\ÍğµY\éî¶¡şDšI\ŞG\Ìø£\"{«K\Å8K;M	¯¿Bİ‹$2Yw?’AˆK^9\×kŒ\n1_aQ9zoX³_\à\ŞR®Ã®€˜\ÆµLªD­”L\î¦|\àfƒ‡\Ó\Ñ³\Z/\á\Ò\èU\\\ß	c¸j\İ\íA·‘©s©ì­¾Yµ¦+¡\'+p‘…ƒüw9\Ú\Û\ï½ó`ô›Œ%\àø>\Õ=}]`hk”Hµ\né‘œ\ÃÙš-\î7Vø_•\È^\ìo\éH{\ÅQUğì±˜ˆQ\Åÿ)E-ğ±J\ß)T¤øÚ©N›Z8ökf¬g\åÄ¼\Z\ì,>¨}IÊ¾~\ëÑ·¯£Ša\è­Õ“$M.\Ñ8«s\"\â7ñ™\Ä	Ÿ«\ÇM&¼\Æuüô¤Ã¨i÷=ö\Ğy5¹+ğ³\ÕH^õ¿¢J\ê\ÄÈ—LA<®X…\î\çòJ(Ã‡¹Ve%$›\ÃÔ´Ô¥°)¤ùò\ÙÄ•\ÍZ¥\Ö\r@À£\0%¡Tšm&t\'\Ş\è´\á\Û$oF0²\í\Ú^#[“\é|\'‹Z\çIqş\Ù\Ú–>\Ì\Z3[\Ø\ÙoS\í\ã\à\ÃB.\×O³9\æšYw>”\Ä\Ü÷Iâ˜³Dº<\á8¼\×\ÕS?ÿú4#›5Ÿ\é\rf\n„Á\Ñ\ÎdøòB\Ú\Â^G´G€şªº\ßd\Úz\0›\à\ê¸BV\î_ô\ß4¦\Âu<\Ä=´Œ\ÑóW\Ì[d¶Y\ÈN½H@v\ä$o³´aR\ÈnñSj\Åd€nN\î#\ÒFó³\\8P_\ÜÿHf{œY«\Ãd°¸\"Z7}[A.O—%k\İá¥£\Zò€\ÕWQúÀZõE\éùö\ë\Âut\×9`/Õ•3[¼Afz.h¿\İ@Œ·~š…¬2†Ã€!s0Ç•3­D\rJ&\Ö{ºl\İ\\\ãŒ\İ\Ç?[¨\Øğ\ÜN\ÊB\Äù©=…¦1\à¸Q$ƒ­|\é\ë·\í%…”¿\İxÔ·A\ÇÁj*+uR–	j¦;\ï‡#Qn#cDx\ÜøDû\Ù=4P\İ6¡n†oû¯m¶ú\í³Ê‚–^—[´ g¬¤\Ñ]…Ä›{©?B[\Î\Íe\ìGÿ>»b\Äi\Ç\Ò\àh@¶ˆ™üˆÃ´\\·\å´¬Ì¨¶L‘\ï}‰\äe\n\Ö\Ø\\0\Ô\Ì\â~r—A\ZRNÀ\âo\Ó\n‘pÀ%<œ9\êl\ëK\Ú@©]¾\ç\'l-\ÚU])Šİ’£\å.•\æ\åeU]6°÷\Å\ëš,Aâ¡’\Î3Kq\Ê\Üø¨\Ì\éa)\àmıB4º6\ß±9ñ\Ú´™\é‘U¥Ş¨\Ëo\è {ªšNV‹Ÿ…ùòK\İlYú`i@\İ\êø\Û\Åğ¿üJK!t-%œüh©\âÉµúô}Gk~¶7A÷nõ¦H›Ô­¦z2	\ã¸C¦.—‹-\Ä\ËZ¼’£A3ªX¯…ü·rN\ÍtÆ¿„>»}\æöS£$ôKj\åKcyÙˆ5	#\ãeg<[\Èà¹œ\ã2(•¥u¿(¿YmÙ¬Xñ5rs@ˆ\ìµMÓ¹³D\Ö3\ë-\Ï.\ì\ÅN	t¨ˆOfÎ¦y\ÃC1ë³šñ^*\ÏZ\nD$¹³\Öth9µmÀ\ä`x\Ç\éÉ¨s™\Ë˜r\×±\\ùÁ¼š\Õo\ìû\é@\n8O\ĞV\ÌJ}µEx\Ë\ãq,Id½B\n·’¬6 \é$¥\ã¾\ï™\âV\']œ!Xñ„Ÿ«M÷–7ù1\"„³ ñ)Aq\àkqu\Æ\×<)Œ\Ö\Ét–fCÿ2 ıF\Z¥\ä\é^„#µ±öAµW&bf’\Ê\ÛB¤5ñˆ\Ï-rºbƒM“:gªù°BÏ†ô–]\ÌE\Z\\\ÎúFOW\Å\\5\×dV©[gR=õ¹1Œ[R§/‚šA‹<‘ÿ¿‹\ÖFâ­”G\ÅPÈ”…²\ØgI\Ğ\çùºF\\÷¬\í1ŠóµVH\ä\ÜM3€ıƒ\Ú\åülè©³GNL½­Ô·6K\Ì}4Õ´Œ ü\'%xr\Ö+G3©5¨n	Mk1z÷29Õ’\\\ÕY\\ú\Ì\íg%‚†\np€‡;¯8!®tYd;‹y²j\×\ïÀU„\á€‰\å.ø0jd\â\Û\Ê8\×+\ÖW@—{¯4\æá¿¥h\â\ÃdWs¸vI¡[¶SÙ¨\'`\Æ\é!–\Îó”¢’ƒ\Æ\\;—\ßÕ¦–«F9Xex{)¯djgbføU:M«š‰£\Ê\ãq{\êù™)\ÛXz\è%!%\Z§°£4Sg.\â´H\ç\'\'P^ª^›#EÆ¯‘\ë£?Ÿ~SŠ\ê…\ÊIªF^­\ÊkùÀ+‹\í†\Ù/L\r¬yD°\"3J\ÆôbK…Å³£!Ø¯² CˆÌ·šdu\â¡\Ó-\É}µ~‚6µØ‰“\Ôü\ŞÔÂ„7\×úY\Ê`!=\'\á§\æs”k‰Û”Ğƒ\ÌYøÿ:\İ>yca\ï\0cm\ÒùIÙŠA\Ø!j\é!\ÌÁYvyfj`\"@6.\î°\ìø`zD\0˜¨£g0\ép‡\î\åó]\è3¦œ2b¾\ÓÔ(H¨J\ä2ú»Š‰¡\Ñy\'\0õ¨õ°ğY\ìh>—^\ß|\ÉMµR­ƒPóÒ¡\\Ô‚\rÎ‹\'\Z¿Ã¸ò!tE,±´Ÿ\Ú\Èšı\0q^h‚b§§ShúP¡(\åg!\à&†¿Ÿ3pd§2	Ú†üNQ\ân\rocş\İW o¯\Ó<‘Ë«+EŞ¦@ûğ\è”Q\Z\ÌTİ;J÷Zº)\r¬¥†H	\İh;‹pº;˜8%\0Ë…F\×!»Å—Ì¹D\Î\ïr\ŞB‰ï¶\Ä55zŒÿ‡\ÃaƒQÔª¡B7~kF\ŞY\×\×h…•dCõ\ÛÏ¼\Åa\È|®\Ú/²Gª\ïú	BW»\"\ç¯\ìl£œŠ\æZzƒOP…™T\ío\ïNnÿK¥\n¯7t[d“±\0Y\Í\í¬±+Õ	9(/¶š +¥^!-_ƒ\ÚR=\ÈJ\ÏwOTöDp²b™=d}Â›~Wv\è2CÕ±\×uƒthDvÕ€s@\'Â™qû)QŸ4Î§bõ°”L˜\Úÿ&·Z2\"fYDIr¬m±\ìq6›\ÅË¢|ı\Õ ¨=\Ü\Ä¬on„\Ù\ïKD$\Î,µ\à¾}úe\ÜY=¹/ªL>ú7mU6©7Jâ¿‚z\Ì\í¯lş”oYŸ9!Áb\ZR\Ï \í­Î—ùûT*cÀcgPX\'™‹`²E§\n]ô\Ì\ß\è\ë½K2\İ\â\éÿ:^d³Õ†|»b\'ü¸I	 \Ú%S5\Í-eœ25?ZW	»\â\í\à|yI»³F\'7º¸\Ú:\Îa4\ì?_L\êÚ	?\\\Í[h†·®h\Û;‡ 0\Ú\Ì\Å\íÀ\ëx¶\íEÀeµU\ãÁ]R\ãVJu	¬w“\Òù\'µcğ€`zg(\ØJ4‚¿	)~÷Šh‘2 A¤ºXµWüY¤¡Ûˆ¹E{ƒ›»\Zu’i´Mo\Êsdi]·\ä\Ğ> Îº\Æ÷z¾\æøô mn‡óq|`ArV¦\'mºÇŒ\Û\"Ç‰g5z¡c¿\\CJ¬[ûQ\ËUn‹\\\Åój\Ç<\åK¨IÁY\Åc¨V&XV–ôÄ­ú}\å\à,YÀ”7\çùø<U€-ë£²ªF¾^ÔCp¸…\nH!¹ñ©l÷\ê|mœEU`!cxózH\Û\É!š|\ì¥[Yzuø8\îÁ\ã¾Å‹”tÒV u\İ?ø6 †\\¿\ßÀ‹,O\ÏÒˆ	\Í YYJ.#\Ş\Ù\á\çd/¡ü\Înß¨#\ç‡I~¥ƒE½\é©Rf•›e\ÃU³ƒ\Ø>øÎ©\0qoU`\ŞVO\ÇYœ¼\Êó§\é‘D%\â`]ü5øÕª†ñ›^\ë°^³¼=˜˜‘yaiP\ív„H©‰@‡½ö\"û­«¥g\ïB\Óc\Ê\ĞûHĞ”{bœGV’¼#\Ë\Ì\ï‚V\Åx€®”jP)\ç\Ì\ÂIO­çŠ‡µ)\Ã\Ü?r§ö—Iôı¥5Ç©wm·\Üvl‹¢)R$?;gVô€Z•\ê\é\É\ßÄŸ*\"Ow¸µş\">Föq%«™\ĞÅ\ã\rX\è«ü\Çg}¿c“gH\â¦\ßo\Ò\âI,+6£P‰²X½\×ü‚ \èpT¿q£boW–2³fXZ\Æz–c\ë\êşZ=a7º\ÂFC\Îô‰C-\äÿÔ²/)\Ïø\ÙÜ±_y2şúw\í©4Rğ\Õ=i\Õ/`i\İlucÆ\Ã’}DÁ\ÜJº¢`¡Sı˜ÿ°$Ã•»@\ê¥P§¬Ul†\0!?°\æi\ÅûN<ş®\á-Yu*PwEôfK+Kk¿û_b“:¨%\\\ÉBú—ğ…á••^.„\0}ªØ‘kG2\×\ÅL¨şİ’\Ñ(²Õ°ğºúT\rB\Îó,õ_¥Q“,\\*Û¸m`5Ç „1gxe/†ğ-¤–¡\és¹I¡¬“wzpğ\æw\Â\àYši}8\Ù:-ô[ }\Ä\Ö>U´\ÙóU‘\nm•\r\á°\Îö½«|´œ·\Æü†ŸC¤t\Ï\ç\å`K€-\Şq\åğZ”ı\Í\ì§C\İa\Å®\Ì:K–şzLg\è¤.\Îº*\r\\\n\Ë%k‰bG#\Ù=£\Ë@x{\å\"\nò‰#U(rm\åÎª8¬1¦m\ËÍ°«´\ÜÁ¥\Z‹d\Ğ}›²—n[ôi\Ê>i°ˆŸ\"mšl\ÎoJ©w2½o11\İg-1†TË†GE•ó\Õ\Ú=ùƒ^pC\Ü3ˆ’`5\Şlô [\î¶\å{¬\á-­·\".aú³Ğ¾i«j³hkÆ Û“u\Ù\Ë\æ\ë‚C»%\Üe\æı„üÚ­c\Ózp¶q|%ô\í\Ãfp“®\0¦\Ş: x\Ô\"!²ot\î\Î3ûÇ°É\Ş}!/&\Ã%ûW°\Z3¦\áDK@Bn\Åw\Ù\0o?ö§hJ\Èqr y°\r¨œCö§ ó¢H£¶)\ê1ğªfÿ‚›IHr\ë)Ë¼µ7s/0Gq¥+iu\np\Ş ½\nYWo\Å\0€\"q~l\\À\Äf\0$&¢?¢b£\Õ\Ê`šµ\Ş\î±†vÿ‹ÀT\Ğ 4#õ_1Ó£—U(\ê5uw9€xb4À\Ğp¨dÔ\Z%‰(ë§­V”]rgÎ„Gô§ñy®¾\Åü?%\åob¸„x– ¿Œ\Ü2Uº¦\'S|\äŒÁ\ì\á$kòo—M·t›.¶RkI\n{,\Z~ò\Ó#ó\ïº\nC÷W &\æj{pJ\ê\ÄÀ\êök[$›R Š‚° ¬~d6Y\×*˜Ë§ŸEvó%Á°ü\0\â\æQÀ@/m(\"—\Ôw4¨£}\ÏÍ\Ã_\0º¡¬]L/mó°u+m\æ=A™\ÉD	C–•?C•\í7i(µ\Î\07N^Çˆ\Ş\ÓZ·…E°;v½½Şº\ã]QMWê»®˜â¯”\æº[ú¢w‹ºG;\ç]W\Ò\\s!¿\à’\0½ğ\ß\ÍZ«­\'\rHCx€¡ÜŒ`aJRSo\î\ÚEõ›F!õ=º¢@g8W	¶¿\Â\Øß›µ\'ğadi\æpcj¿olA0\0yVñn¸\ã\Çh\0\0\0',0),(2,'Bhramastra','Indian Hindi-language fantasy action-adventure film written and directed by Ayan Mukerji','Ranbir,Alia','3D','2022-10-05','2022-10-15','2022-12-05','Hindi',NULL,0),(3,'RRR','action movie','NTR,raju,aliya','2D','2022-09-25','2022-09-25','2022-10-01','hindi','',0),(4,'RRR','action movie','aliya','3D','2022-09-17','2022-09-17','2022-10-08','English','',0),(5,'PK','logical','amir khan','2D','2022-09-01','2022-09-01','2022-09-18','hindi',NULL,0),(6,'Pk','logical','amir khan','3D','2022-09-01','2022-09-01','2022-09-19','hindi',NULL,0),(7,'Tara','action','gylince','2D','2022-09-07','2022-09-07','2022-09-17','english',NULL,0);
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
