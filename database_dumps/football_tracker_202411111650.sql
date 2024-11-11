CREATE DATABASE  IF NOT EXISTS `football_tracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `football_tracker`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: football_tracker
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `broadcaster`
--

DROP TABLE IF EXISTS `broadcaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcaster` (
  `Channel_Name` varchar(128) NOT NULL,
  `Commentator` varchar(128) NOT NULL,
  `Streaming_Link` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Channel_Name`,`Commentator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcaster`
--

LOCK TABLES `broadcaster` WRITE;
/*!40000 ALTER TABLE `broadcaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `broadcaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_position`
--

DROP TABLE IF EXISTS `field_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_position` (
  `Abb` varchar(10) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Description` text,
  PRIMARY KEY (`Abb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_position`
--

LOCK TABLES `field_position` WRITE;
/*!40000 ALTER TABLE `field_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixture`
--

DROP TABLE IF EXISTS `fixture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixture` (
  `fixture_id` int NOT NULL AUTO_INCREMENT,
  `team_1_name` varchar(128) DEFAULT NULL,
  `team_2_name` varchar(128) DEFAULT NULL,
  `stadium_name` varchar(128) DEFAULT NULL,
  `broadcaster_channel_name` varchar(128) DEFAULT NULL,
  `broadcaster_commentator` varchar(128) DEFAULT NULL,
  `match_date` datetime NOT NULL,
  `attendance` int NOT NULL,
  PRIMARY KEY (`fixture_id`),
  KEY `team_1_name` (`team_1_name`),
  KEY `team_2_name` (`team_2_name`),
  KEY `stadium_name` (`stadium_name`),
  KEY `broadcaster_channel_name` (`broadcaster_channel_name`,`broadcaster_commentator`),
  CONSTRAINT `fixture_ibfk_1` FOREIGN KEY (`team_1_name`) REFERENCES `team` (`name`),
  CONSTRAINT `fixture_ibfk_2` FOREIGN KEY (`team_2_name`) REFERENCES `team` (`name`),
  CONSTRAINT `fixture_ibfk_3` FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`Name`),
  CONSTRAINT `fixture_ibfk_4` FOREIGN KEY (`broadcaster_channel_name`, `broadcaster_commentator`) REFERENCES `broadcaster` (`Channel_Name`, `Commentator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixture`
--

LOCK TABLES `fixture` WRITE;
/*!40000 ALTER TABLE `fixture` DISABLE KEYS */;
/*!40000 ALTER TABLE `fixture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `League`
--

DROP TABLE IF EXISTS `League`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `League` (
  `Name` varchar(128) NOT NULL,
  `Country` varchar(128) NOT NULL,
  `Season` int NOT NULL,
  PRIMARY KEY (`Name`,`Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `League`
--

LOCK TABLES `League` WRITE;
/*!40000 ALTER TABLE `League` DISABLE KEYS */;
/*!40000 ALTER TABLE `League` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `Manager_Id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(128) NOT NULL,
  `Last_Name` varchar(128) NOT NULL,
  `DOB` date NOT NULL,
  `Nationality` varchar(128) NOT NULL,
  `team_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Manager_Id`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Player_Id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(128) NOT NULL,
  `Last_Name` varchar(128) NOT NULL,
  `DOB` date NOT NULL,
  `Nationality` varchar(128) NOT NULL,
  `Market_Value` decimal(15,2) DEFAULT NULL,
  `Transfer_Date` date DEFAULT NULL,
  `team_name` varchar(128) DEFAULT NULL,
  `position_abb` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Player_Id`),
  KEY `team_name` (`team_name`),
  KEY `position_abb` (`position_abb`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`position_abb`) REFERENCES `field_position` (`Abb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_captain`
--

DROP TABLE IF EXISTS `player_captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_captain` (
  `Player_Id` int NOT NULL,
  `Captain_id` int NOT NULL,
  PRIMARY KEY (`Player_Id`),
  KEY `Captain_id` (`Captain_id`),
  CONSTRAINT `player_captain_ibfk_1` FOREIGN KEY (`Player_Id`) REFERENCES `player` (`Player_Id`),
  CONSTRAINT `player_captain_ibfk_2` FOREIGN KEY (`Captain_id`) REFERENCES `player` (`Player_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_captain`
--

LOCK TABLES `player_captain` WRITE;
/*!40000 ALTER TABLE `player_captain` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_stat`
--

DROP TABLE IF EXISTS `player_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stat` (
  `stat_name` varchar(128) NOT NULL,
  `value` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  `player_id` int NOT NULL,
  PRIMARY KEY (`stat_name`,`updated_at`,`player_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_stat_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`Player_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stat`
--

LOCK TABLES `player_stat` WRITE;
/*!40000 ALTER TABLE `player_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `name` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL,
  `industry` varchar(128) DEFAULT NULL,
  `website_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_league`
--

DROP TABLE IF EXISTS `sponsor_league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor_league` (
  `sponsor_name` varchar(128) NOT NULL,
  `league_name` varchar(128) NOT NULL,
  `season` int NOT NULL,
  `sponsorship_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sponsor_name`,`league_name`,`season`),
  KEY `league_name` (`league_name`,`season`),
  CONSTRAINT `sponsor_league_ibfk_1` FOREIGN KEY (`sponsor_name`) REFERENCES `sponsor` (`name`),
  CONSTRAINT `sponsor_league_ibfk_2` FOREIGN KEY (`league_name`, `season`) REFERENCES `league` (`Name`, `Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_league`
--

LOCK TABLES `sponsor_league` WRITE;
/*!40000 ALTER TABLE `sponsor_league` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsor_league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_team`
--

DROP TABLE IF EXISTS `sponsor_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor_team` (
  `sponsor_name` varchar(128) NOT NULL,
  `team_name` varchar(128) NOT NULL,
  `sponsorship_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sponsor_name`,`team_name`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `sponsor_team_ibfk_1` FOREIGN KEY (`sponsor_name`) REFERENCES `sponsor` (`name`),
  CONSTRAINT `sponsor_team_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_team`
--

LOCK TABLES `sponsor_team` WRITE;
/*!40000 ALTER TABLE `sponsor_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsor_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `Name` varchar(128) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `City` varchar(128) NOT NULL,
  `Zip_Code` varchar(20) NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Address` (`Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `name` varchar(128) NOT NULL,
  `established_year` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('AC Milan',1899),('Ajax Amsterdam',1900),('Chelsea FC',1905),('FC Barcelona',1899),('FC Bayern Munich',1900),('Juventus FC',1897),('Liverpool FC',1892),('Manchester City FC',1880),('Manchester United FC',1878),('Paris Saint-Germain FC',1970),('Real Madrid CF',1902);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_stat`
--

DROP TABLE IF EXISTS `team_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_stat` (
  `name` varchar(128) NOT NULL,
  `value` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  `team_name` varchar(128) NOT NULL,
  PRIMARY KEY (`name`,`updated_at`,`team_name`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `team_stat_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_stat`
--

LOCK TABLES `team_stat` WRITE;
/*!40000 ALTER TABLE `team_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'football_tracker'
--

--
-- Dumping routines for database 'football_tracker'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_all_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_teams`()
BEGIN
    SELECT * FROM team;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 16:51:06
