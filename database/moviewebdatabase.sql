-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: movieswebdb
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
  `id_comments` tinyint NOT NULL AUTO_INCREMENT,
  `content_comments` text NOT NULL,
  `date_comments` date NOT NULL,
  PRIMARY KEY (`id_comments`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'This movie is awesome','2020-02-19'),(2,'I love this movie','2020-02-23'),(3,'another comment','2020-03-20'),(4,'to much adrenaline','2020-04-20'),(5,'Bad idea for a friday nigth','2020-04-29'),(6,'Im still shakin! Excellent movie!','2020-04-30');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `idmovies` int NOT NULL,
  `comments_id_comments` tinyint NOT NULL,
  PRIMARY KEY (`idmovies`,`comments_id_comments`),
  UNIQUE KEY `idmovies_UNIQUE` (`idmovies`),
  KEY `fk_movies_comments1_idx` (`comments_id_comments`),
  CONSTRAINT `fk_movies_comments1` FOREIGN KEY (`comments_id_comments`) REFERENCES `comments` (`id_comments`)
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
-- Table structure for table `movies_has_users_has_comments`
--

DROP TABLE IF EXISTS `movies_has_users_has_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_has_users_has_comments` (
  `movies_idmovies` int NOT NULL,
  `users_has_comments_users_id_users` tinyint NOT NULL,
  `users_has_comments_comments_id_comments` tinyint NOT NULL,
  PRIMARY KEY (`movies_idmovies`,`users_has_comments_users_id_users`,`users_has_comments_comments_id_comments`),
  KEY `fk_movies_has_users_has_comments_users_has_comments1_idx` (`users_has_comments_users_id_users`,`users_has_comments_comments_id_comments`),
  KEY `fk_movies_has_users_has_comments_movies1_idx` (`movies_idmovies`),
  CONSTRAINT `fk_movies_has_users_has_comments_movies1` FOREIGN KEY (`movies_idmovies`) REFERENCES `movies` (`idmovies`),
  CONSTRAINT `fk_movies_has_users_has_comments_users_has_comments1` FOREIGN KEY (`users_has_comments_users_id_users`, `users_has_comments_comments_id_comments`) REFERENCES `users_has_comments` (`users_id_users`, `comments_id_comments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_has_users_has_comments`
--

LOCK TABLES `movies_has_users_has_comments` WRITE;
/*!40000 ALTER TABLE `movies_has_users_has_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_has_users_has_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id_permissions` tinyint NOT NULL AUTO_INCREMENT,
  `name_permissions` varchar(15) NOT NULL,
  PRIMARY KEY (`id_permissions`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Administrator'),(2,'Registred');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` tinyint NOT NULL AUTO_INCREMENT,
  `name_users` varchar(20) NOT NULL,
  `lastname_users` varchar(20) NOT NULL,
  `email_users` varchar(25) NOT NULL,
  `nickname_users` varchar(15) NOT NULL,
  `avatar_users` varchar(20) DEFAULT NULL,
  `password_users` varchar(20) NOT NULL,
  `description_users` text NOT NULL,
  `created_users` date DEFAULT NULL,
  `permissions_id_permissions` tinyint NOT NULL,
  PRIMARY KEY (`id_users`),
  KEY `fk_users_permisions1_idx` (`permissions_id_permissions`),
  CONSTRAINT `fk_users_permisions1` FOREIGN KEY (`permissions_id_permissions`) REFERENCES `permissions` (`id_permissions`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roberto','Vargas','rvargas@gmail.com','rvargasadm','photo-adm.png','admin123','administrator of this web','2020-01-17',1),(2,'Maria','Gamarra','mgama@gmail.com','marig','photo-mg-png','1234','cat lover and movies','2020-02-12',2),(3,'Dario ','Gerez','dariogrz@gmail.com','dariz','photo-dg.png','abcd','student, a litle shine, in love of my dog','2020-03-15',2),(4,'Paula','Perez','paulap@gmail.com','paupe','photo-pp.png','0000','Traveler. Love pop corn and a good movie','2020-04-20',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_comments`
--

DROP TABLE IF EXISTS `users_has_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_comments` (
  `users_id_users` tinyint NOT NULL,
  `comments_id_comments` tinyint NOT NULL,
  PRIMARY KEY (`users_id_users`,`comments_id_comments`),
  KEY `fk_users_has_comments_comments1_idx` (`comments_id_comments`),
  KEY `fk_users_has_comments_users1_idx` (`users_id_users`),
  CONSTRAINT `fk_users_has_comments_comments1` FOREIGN KEY (`comments_id_comments`) REFERENCES `comments` (`id_comments`),
  CONSTRAINT `fk_users_has_comments_users1` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2020-05-13 17:32:59
