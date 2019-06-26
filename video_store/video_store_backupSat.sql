-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: video_store
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_state` varchar(25) DEFAULT NULL,
  `customer_postal` varchar(10) DEFAULT NULL,
  `customer_number` varchar(20) DEFAULT NULL,
  `customer_balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_number_UNIQUE` (`customer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Sergio Gonzalez','4386 Philli Lane','Peoria','Arizona','85381','404-858-3484',0.00),(2,'Frodo Baggins','921 Reeves St','Malakoff','Texas','75148','430-983-5224',4.20),(3,'Samwise Gamgee','3247 Stewart St','Santa Fe','New Mexico','87505','317-840-6419',0.00),(4,'Peregrin Took','1950 Fleming Way','Avondale','Arizona','85323','434-546-4859',11.37),(5,'Meriadoc Brandybuck','1810 Stroop Hill Rd','Buckeye','Arizona','85340','404-263-0624',12.20),(6,'Gandalf Grey','520 Elkwiew Dr','Albuquerque','New Mexico','87101','772-634-3237',3.31),(7,'Aragorn Strider','246 Court St','Long Beach','California','90805','314-330-8641',0.00),(8,'Legolas Bloom','2794 Parrish Ave','Phoenix','Arizona','85005','410-353-8387',6.78),(9,'Gimli Lockbearer','2916 Blackwell St','Peoria','Arizona','85381','907-317-2608',8.93),(10,'Boromir Bean','1747 Melody Ln','Hollywood','California','90028','757-635-5614',10.71);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rental` (
  `rental_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `checkout_date` varchar(45) DEFAULT NULL,
  `due_date` varchar(45) DEFAULT NULL,
  `return_date` varchar(45) DEFAULT NULL,
  `fee_charge` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rental_id`,`video_id`,`customer_id`),
  KEY `fk_video_id_idx` (`video_id`),
  KEY `fk_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,1,1,'2019-04-12','2019-04-22','checked-out','0'),(2,4,2,'2019-04-02','2019-04-29','checked-out','4.20'),(3,2,4,'2019-03-24','2019-04-04','checked-out','11.37'),(4,15,5,'2019-03-23','2019-04-03','checked-out','12.2'),(5,19,8,'2019-04-10','2019-04-20','checked-out','3.78'),(6,20,8,'2019-04-10','2019-04-20','checked-out','3.00'),(7,11,6,'2019-04-11','2019-04-21','checked-out','3.31'),(8,7,10,'2019-04-07','2019-04-17','checked-out','10.71'),(9,6,9,'2019-04-10','2019-04-20','checked-out','4.00'),(10,13,9,'2019-04-10','2019-04-20','checked-out','4.93');
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `video_name` varchar(255) DEFAULT NULL,
  `video_genre` varchar(50) DEFAULT NULL,
  `video_release_date` date DEFAULT NULL,
  `video_director` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'the Matrix','Action','1999-03-31','Wachowski siblings'),(2,'the Dark Knight','Thriller','2008-07-18','Christopher Nolan'),(3,'Man of Steel','Action','2013-06-14','Zack Snyder'),(4,'the Lego Movie','Comedy','2014-02-07','Dan Lin, Roy Lee'),(5,'John Wick','Action','2014-10-24','Chad Stahelski, David Leitch'),(6,'Superbad','Comedy','2007-08-17','Greg Mottola'),(7,'HeavyWeights','Comedy','1995-02-17','Steven Brill'),(8,'August Rush','Romance','2007-11-21','Kirsten Sheridan'),(9,'Begin Again','Romance','2013-06-27','John Carney'),(10,'the Mighty Ducks','Comedy','1992-10-02','Steohen Herek'),(11,'Elf','Comedy','2003-11-07','Jon Favreau'),(12,'Hellboy','Action','2004-04-02','Guillermo del Toro'),(13,'Interstellar','Drama','2014-10-26','Christopher Nolan'),(14,'Yesteday Was Everything','Documentary','2016-06-30','Matthew Mixon'),(15,'Inception','Thriller','2010-07-13','Christopher Nolan'),(16,'Silence of the Lambs','Drama','1991-02-13','Jonathan Demme'),(17,'Toy Story','Adventure','1995-11-22','John Lasseter'),(19,'the Lord of the Rings: the Fellowship of the Ring','Adventure','2001-12-19','Peter Jackson'),(20,'Back to the Future','Drama','1985-07-03','Robert Zemeckis');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-20 10:30:38
