-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: mwdbcomit
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `idComments` tinyint NOT NULL AUTO_INCREMENT,
  `comments_content` varchar(99) NOT NULL,
  `comments_date` timestamp(6) NOT NULL,
  `users_idUsers` tinyint NOT NULL,
  `movies_idMovies` tinyint NOT NULL,
  PRIMARY KEY (`idComments`),
  KEY `fk_comments_users1_idx` (`users_idUsers`),
  KEY `fk_comments_movies1_idx` (`movies_idMovies`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'its a great movie, i recommended ','2020-01-02 03:00:00.000000',1,1),(2,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa','2020-02-01 03:00:00.000000',2,1),(3,'wwwwwwwwwwwwwwwwwwwww','2020-02-14 03:00:00.000000',1,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacs`
--

DROP TABLE IF EXISTS `contacs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacs` (
  `idcontact` tinyint NOT NULL AUTO_INCREMENT,
  `subject_contact` varchar(45) NOT NULL,
  `content_contact` varchar(99) NOT NULL,
  `date_contact` timestamp(6) NOT NULL,
  `users_idUsers` tinyint NOT NULL,
  PRIMARY KEY (`idcontact`),
  KEY `fk_contacs_users1_idx` (`users_idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacs`
--

LOCK TABLES `contacs` WRITE;
/*!40000 ALTER TABLE `contacs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `idMovies` tinyint NOT NULL,
  `users_idUsers` tinyint NOT NULL,
  PRIMARY KEY (`idMovies`),
  KEY `fk_movies_users1_idx` (`users_idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUsers` tinyint NOT NULL AUTO_INCREMENT,
  `users_name` varchar(15) NOT NULL,
  `users_lastname` varchar(15) NOT NULL,
  `users_email` varchar(30) NOT NULL,
  `users_nickname` varchar(12) NOT NULL,
  `users_password` varchar(10) NOT NULL,
  `users_avatar` varchar(20) DEFAULT NULL,
  `users_description` varchar(99) DEFAULT NULL,
  `users_created` timestamp(6) NOT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roberto','Vargas','rave17491@gmail.com','rave17420','vargas91','imgrv.png','Admin of movieweb','2020-05-20 03:00:00.000000'),(2,'Laura','Frias','lfrias@gmail.com','laufrias','frias90','imglf.png','Student and movies lover','2020-05-20 03:00:00.000000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_comments`
--

DROP TABLE IF EXISTS `users_has_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_comments` (
  `users_idUsers` tinyint NOT NULL,
  `comments_idComments` tinyint NOT NULL,
  KEY `fk_users_has_comments_comments1_idx` (`comments_idComments`),
  KEY `fk_users_has_comments_users1_idx` (`users_idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_comments`
--

LOCK TABLES `users_has_comments` WRITE;
/*!40000 ALTER TABLE `users_has_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20  0:55:07
