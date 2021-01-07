CREATE DATABASE  IF NOT EXISTS `jspfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jspfinal`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jspfinal
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `count` (
  `idcount` int NOT NULL,
  PRIMARY KEY (`idcount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES (3);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `m_id` int NOT NULL,
  `m_account` varchar(99) DEFAULT NULL,
  `m_password` varchar(99) DEFAULT NULL,
  `m_name` varchar(99) DEFAULT NULL,
  `m_address` varchar(99) DEFAULT NULL,
  `m_email` varchar(99) DEFAULT NULL,
  `m_level` varchar(45) DEFAULT NULL,
  `m_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_class` varchar(45) DEFAULT NULL,
  `p_hot` varchar(45) DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `p_stock` varchar(45) DEFAULT NULL,
  `p_price` varchar(45) DEFAULT NULL,
  `p_image` varchar(99) DEFAULT NULL,
  `p_image2` varchar(99) DEFAULT NULL,
  `p_image3` varchar(99) DEFAULT NULL,
  `p_textarea` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'1','0','Nike Air Max 270',NULL,NULL,'NIKE\\casual\\1\\休閒1A.jpg','NIKE\\casual\\1\\休閒1B.jpg','NIKE\\casual\\1\\休閒1C.jpg','Nike Air Max 270 結合 Air Max 180 的特大號鞋舌，以及 Air Max 93 的經典元素。鞋跟配置目前 Nike 最大的 Air 氣墊，締造超柔軟的出色著感和外型。'),(2,'1','1','Nike ZoomX SuperRep Surge',NULL,NULL,'NIKE\\casual\\2\\休閒2A.jpg','NIKE\\casual\\2\\休閒2B.jpg','NIKE\\casual\\2\\休閒2C.jpg','Nike ZoomX SuperRep Surge 專為健身課程和運動計畫打造，助你暢動不歇。無論是跑步機、划船機或肌力訓練，鞋款搭載的 Nike ZoomX 泡棉都能提供靈敏緩震，並透過側邊弧形設計，創造包覆支撐力，為你打造進度超前的訓練表現。'),(3,'1','0','Nike Renew In-Season TR 10',NULL,NULL,'NIKE\\casual\\3\\休閒3A.jpg','NIKE\\casual\\3\\休閒3B.jpg','NIKE\\casual\\3\\休閒3C.jpg','Nike Renew In-Season TR 10 搭載極致舒適的鞋床與泡棉，提供卓越緩震機能和能量回傳效果，可駕馭高強度心肺運動課程。中足束帶整合鞋帶系統，能在高速運動時穩固雙足。'),(4,'2','0','Nike Revolution 5 ',NULL,NULL,'NIKE\\jog\\1\\慢跑1A.jpg','NIKE\\jog\\1\\慢跑1B.jpg','NIKE\\jog\\1\\慢跑1B.jpg','Nike Revolution 5 的柔軟泡棉可為雙腳提供緩震，打造舒適的跑步體驗。輕量編織材質包覆雙足，確保通風舒適。極簡設計可駕馭各種日常場合。'),(5,'2','1','Nike Joyride Dual Run',NULL,NULL,'NIKE\\jog\\2\\慢跑2A.jpg','NIKE\\jog\\2\\慢跑2B.jpg','NIKE\\jog\\2\\慢跑2C.jpg','Nike Joyride Dual Run 閃耀自我魅力。足底的微小泡棉顆粒，結合前足傳統緩震系統，為足部打造超乎想像的服貼感受。'),(6,'2','0','Nike Renew Run 2',NULL,NULL,'NIKE\\jog\\3\\慢跑3A.jpg','NIKE\\jog\\3\\慢跑3B.jpg','NIKE\\jog\\3\\慢跑3C.jpg','Nike Renew Run 2 持續帶來流暢的奔馳體驗。鞋領和鞋舌版型經重新設計，可提升足部支撐力。這款跑鞋兼具舒適感和耐久抓地力，讓天天跑步不再是夢。'),(7,'3','0','Kyrie Irving',NULL,NULL,'NIKE\\bskt\\1\\籃球1A.jpg','NIKE\\bskt\\1\\籃球1B.jpg','NIKE\\bskt\\1\\籃球1C.jpg','Kyrie Irving 無論在場內或場外，都是個創意鬼才。腳上的戰靴不僅要跟上他的靈活球風，更須展現他挑戰自我極限的風格與精神。Kyrie 7 提升球鞋的貼合度、比賽時的腳感和中距離投籃能力，讓各級球員從邁開具爆發力的第一步起，就搶得致勝先機。此款 EP 版本搭載超耐久外底設計，適合室外球場。'),(8,'3','1','Kybrid S2',NULL,NULL,'NIKE\\bskt\\2\\籃球2A.jpg','NIKE\\bskt\\2\\籃球2B.jpg','NIKE\\bskt\\2\\籃球2C.jpg','Kybrid S2 集結 Kyrie 4、5 和 6 版本的精華於一身，打造超越極限的全新籃球鞋體驗。採用裝飾片設計，輕盈且穩固貼合，繫上鞋帶即可牢牢鎖定雙足。專為 Kyrie 打造的 Zoom Air 氣墊與向上延伸至鞋側的鞋底紋路，有助快速切入型球員保持卓越靈敏度，進而發揮最佳表現。此款 EP 版本搭載超耐久外底設計，適合室外球場。'),(9,'3','0','Nike Precision 4',NULL,NULL,'NIKE\\bskt\\3\\籃球3A.jpg','NIKE\\bskt\\3\\籃球3B.jpg','NIKE\\bskt\\3\\籃球3C.jpg','球員若能疾速切入與切出，就能輕鬆突破防守。Nike Precision 4 結合競速造型和貼地設計，讓你在比賽中盡情釋放速度感和敏捷度。');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcart` (
  `s_id` int NOT NULL,
  `p_id` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `m_account` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppinglist`
--

DROP TABLE IF EXISTS `shoppinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppinglist` (
  `l_id` int NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `p_id` varchar(45) DEFAULT NULL,
  `m_account` varchar(99) DEFAULT NULL,
  `l_number` varchar(45) DEFAULT NULL,
  `l_totalprice` varchar(45) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `l_name` varchar(99) DEFAULT NULL,
  `l_email` varchar(99) DEFAULT NULL,
  `l_address` varchar(99) DEFAULT NULL,
  `l_phone` varchar(45) DEFAULT NULL,
  `l_payment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppinglist`
--

LOCK TABLES `shoppinglist` WRITE;
/*!40000 ALTER TABLE `shoppinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-07 13:34:55
