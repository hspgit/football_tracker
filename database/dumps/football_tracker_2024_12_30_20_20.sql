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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `team_1_name` varchar(128) NOT NULL,
  `team_2_name` varchar(128) NOT NULL,
  `stadium_name` varchar(128) NOT NULL,
  `match_date` date NOT NULL,
  `attendance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`team_1_name`,`team_2_name`,`match_date`),
  KEY `team_2_name` (`team_2_name`),
  KEY `stadium_name` (`stadium_name`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`team_1_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`team_2_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `game_ibfk_3` FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('Arsenal','Aston Villa','Villa Park','2024-10-01',42682),('Arsenal','Tottenham Hotspur','Emirates Stadium','2023-07-02',60260),('Aston Villa','Brentford','Villa Park','2022-06-14',42682),('Aston Villa','Chelsea','Villa Park','2022-06-14',42682),('Aston Villa','Newcastle United','Villa Park','2023-07-02',42682),('Athletic Club','Barcelona','Camp Nou','2022-01-03',99354),('Athletic Club','Barcelona','San Mamés','2022-06-27',53289),('Athletic Club','Espanyol','San Mamés','2022-01-03',53289),('Athletic Club','Espanyol','RCDE Stadium','2023-06-22',40500),('Atlanta United','Chicago Fire','Soldier Field','2023-03-13',61500),('Atlanta United','Chicago Fire','Soldier Field','2024-11-03',61500),('Barcelona','Espanyol','RCDE Stadium','2024-10-07',40500),('Barcelona','Real Betis','Camp Nou','2024-12-03',99354),('Barcelona','Real Madrid','Santiago Bernabéu','2024-12-03',81044),('Barcelona','Real Sociedad','Camp Nou','2024-10-07',99354),('Brentford','Chelsea','Stamford Bridge','2024-10-01',40742),('Brentford','Manchester United','Old Trafford','2023-07-02',74879),('Chelsea','Manchester City','Etihad Stadium','2023-07-02',53600),('DC United','Atlanta United','Mercedes-Benz Stadium','2022-06-14',71000),('DC United','Chicago Fire','Soldier Field','2022-06-14',61500),('Espanyol','Athletic Club','San Mamés','2023-06-21',53289),('Espanyol','Real Betis','RCDE Stadium','2022-06-27',40500),('Espanyol','Real Betis','Benito Villamarin','2023-06-22',60721),('Espanyol','Real Madrid','Santiago Bernabéu','2024-12-03',81044),('Espanyol','Valencia','RCDE Stadium','2024-12-03',40500),('Fulham','Liverpool','Craven Cottage','2022-06-14',25700),('Fulham','Liverpool','Craven Cottage','2024-10-01',25700),('Inter Miami','Chicago Fire','Soldier Field','2022-06-14',61500),('Inter Miami','DC United','Audi Field','2023-03-13',20000),('Inter Miami','DC United','DRV PNK Stadium','2024-11-03',19500),('LA Galaxy','New York Red Bulls','Red Bull Arena','2022-06-14',25000),('Liverpool','Fulham','Anfield','2023-07-02',54074),('Manchester City','Manchester United','Old Trafford','2024-10-01',74879),('Manchester United','Manchester City','Old Trafford','2022-09-15',74879),('New York Red Bulls','Orlando City','Red Bull Arena','2023-03-13',25000),('Newcastle United','Tottenham Hotspur','St James Park','2022-09-15',52305),('Newcastle United','Tottenham Hotspur','St James Park','2024-10-30',52305),('Orlando City','Portland Timbers','Providence Park','2022-06-14',25218),('Real Madrid','Real Sociedad','Santiago Bernabéu','2023-06-21',81044),('Real Sociedad','Valencia','Mestalla','2024-12-03',49865),('Seattle Sounders','LA Galaxy','Lumen Field','2024-11-03',72000),('Seattle Sounders','Toronto','BMO Field','2023-03-13',30000),('Valencia','Real Madrid','Santiago Bernabéu','2024-12-03',81044),('Valencia','Villarreal','Mestalla','2022-06-27',49865),('Valencia','Villarreal','Mestalla','2023-06-21',49865),('Villarreal','Sevilla','Estadio de la Ceramica','2024-12-08',23500);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league` (
  `name` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES ('La Liga','Spain'),('Major League Soccer','United States'),('Premier League','England');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_team`
--

DROP TABLE IF EXISTS `league_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_team` (
  `league_name` varchar(128) NOT NULL,
  `team_name` varchar(128) NOT NULL,
  `season` int NOT NULL,
  `matches_played` int NOT NULL DEFAULT '0',
  `wins` int NOT NULL DEFAULT '0',
  `losses` int NOT NULL DEFAULT '0',
  `goals_scored` int NOT NULL DEFAULT '0',
  `goals_conceded` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`league_name`,`team_name`,`season`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `league_team_ibfk_1` FOREIGN KEY (`league_name`) REFERENCES `league` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `league_team_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_team`
--

LOCK TABLES `league_team` WRITE;
/*!40000 ALTER TABLE `league_team` DISABLE KEYS */;
INSERT INTO `league_team` VALUES ('La Liga','Athletic Club',2022,3,2,0,6,4),('La Liga','Athletic Club',2023,2,0,1,5,6),('La Liga','Athletic Club',2024,0,0,0,0,0),('La Liga','Barcelona',2022,2,0,1,2,3),('La Liga','Barcelona',2023,0,0,0,0,0),('La Liga','Barcelona',2024,4,2,1,12,10),('La Liga','Espanyol',2022,2,1,1,4,4),('La Liga','Espanyol',2023,3,1,0,6,5),('La Liga','Espanyol',2024,3,1,2,7,7),('La Liga','Real Betis',2022,1,0,1,1,2),('La Liga','Real Betis',2023,1,0,0,0,0),('La Liga','Real Betis',2024,1,0,1,0,5),('La Liga','Real Madrid',2022,0,0,0,0,0),('La Liga','Real Madrid',2023,1,1,0,4,1),('La Liga','Real Madrid',2024,3,2,1,15,11),('La Liga','Real Sociedad',2022,0,0,0,0,0),('La Liga','Real Sociedad',2023,1,0,1,1,4),('La Liga','Real Sociedad',2024,2,1,0,5,4),('La Liga','Sevilla',2022,0,0,0,0,0),('La Liga','Sevilla',2023,0,0,0,0,0),('La Liga','Sevilla',2024,1,0,0,2,2),('La Liga','Valencia',2022,1,0,0,2,2),('La Liga','Valencia',2023,1,0,1,2,4),('La Liga','Valencia',2024,3,1,2,10,12),('La Liga','Villarreal',2022,1,0,0,2,2),('La Liga','Villarreal',2023,1,1,0,4,2),('La Liga','Villarreal',2024,1,0,0,2,2),('Major League Soccer','Atlanta United',2022,1,0,1,1,3),('Major League Soccer','Atlanta United',2023,1,1,0,4,1),('Major League Soccer','Atlanta United',2024,1,0,0,2,2),('Major League Soccer','Chicago Fire',2022,2,0,2,3,7),('Major League Soccer','Chicago Fire',2023,1,0,1,1,4),('Major League Soccer','Chicago Fire',2024,1,0,0,2,2),('Major League Soccer','DC United',2022,2,2,0,8,4),('Major League Soccer','DC United',2023,1,0,0,2,2),('Major League Soccer','DC United',2024,1,1,0,4,2),('Major League Soccer','Inter Miami',2022,1,1,0,2,0),('Major League Soccer','Inter Miami',2023,1,0,0,2,2),('Major League Soccer','Inter Miami',2024,1,0,1,2,4),('Major League Soccer','LA Galaxy',2022,1,0,1,2,4),('Major League Soccer','LA Galaxy',2023,0,0,0,0,0),('Major League Soccer','LA Galaxy',2024,1,1,0,4,2),('Major League Soccer','New York Red Bulls',2022,1,1,0,4,2),('Major League Soccer','New York Red Bulls',2023,1,0,0,2,2),('Major League Soccer','New York Red Bulls',2024,0,0,0,0,0),('Major League Soccer','Orlando City',2022,1,0,1,2,3),('Major League Soccer','Orlando City',2023,1,0,0,2,2),('Major League Soccer','Orlando City',2024,0,0,0,0,0),('Major League Soccer','Portland Timbers',2022,1,1,0,3,2),('Major League Soccer','Portland Timbers',2023,0,0,0,0,0),('Major League Soccer','Portland Timbers',2024,0,0,0,0,0),('Major League Soccer','Seattle Sounders',2022,0,0,0,0,0),('Major League Soccer','Seattle Sounders',2023,1,0,0,2,2),('Major League Soccer','Seattle Sounders',2024,1,0,1,2,4),('Major League Soccer','Toronto',2022,0,0,0,0,0),('Major League Soccer','Toronto',2023,1,0,0,2,2),('Major League Soccer','Toronto',2024,0,0,0,0,0),('Premier League','Arsenal',2022,0,0,0,0,0),('Premier League','Arsenal',2023,1,0,0,2,2),('Premier League','Arsenal',2024,1,1,0,2,0),('Premier League','Aston Villa',2022,2,2,0,8,4),('Premier League','Aston Villa',2023,1,1,0,4,2),('Premier League','Aston Villa',2024,1,0,1,0,2),('Premier League','Brentford',2022,1,0,1,2,4),('Premier League','Brentford',2023,1,1,0,4,0),('Premier League','Brentford',2024,1,0,0,2,2),('Premier League','Chelsea',2022,1,0,1,2,4),('Premier League','Chelsea',2023,1,0,1,0,2),('Premier League','Chelsea',2024,1,0,0,2,2),('Premier League','Fulham',2022,1,0,0,4,4),('Premier League','Fulham',2023,1,0,1,1,2),('Premier League','Fulham',2024,1,1,0,5,2),('Premier League','Liverpool',2022,1,0,0,4,4),('Premier League','Liverpool',2023,1,1,0,2,1),('Premier League','Liverpool',2024,1,0,1,2,5),('Premier League','Manchester City',2022,1,1,0,5,2),('Premier League','Manchester City',2023,1,1,0,2,0),('Premier League','Manchester City',2024,1,1,0,3,2),('Premier League','Manchester United',2022,1,0,1,2,5),('Premier League','Manchester United',2023,1,0,1,0,4),('Premier League','Manchester United',2024,1,0,1,2,3),('Premier League','Newcastle United',2022,1,1,0,5,2),('Premier League','Newcastle United',2023,1,0,1,2,4),('Premier League','Newcastle United',2024,1,0,0,2,2),('Premier League','Tottenham Hotspur',2022,1,0,1,2,5),('Premier League','Tottenham Hotspur',2023,1,0,0,2,2),('Premier League','Tottenham Hotspur',2024,1,0,0,2,2);
/*!40000 ALTER TABLE `league_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(128) NOT NULL,
  `team_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Erik','ten Hag','1970-02-02','Netherlands','Manchester United'),(2,'Mikel','Arteta','1982-03-26','Spain','Arsenal'),(3,'Pep','Guardiola','1971-01-18','Spain','Manchester City'),(4,'Jurgen','Klopp','1967-06-16','Germany','Liverpool'),(5,'Mauricio','Pochettino','1972-03-02','Argentina','Chelsea'),(6,'Eddie','Howe','1977-11-29','England','Newcastle United'),(7,'Ange','Postecoglou','1965-08-27','Australia','Tottenham Hotspur'),(8,'Unai','Emery','1971-11-03','Spain','Aston Villa'),(9,'Marco','Silva','1977-07-12','Portugal','Fulham'),(10,'Thomas','Frank','1973-10-09','Denmark','Brentford'),(11,'Carlo','Ancelotti','1959-06-10','Italy','Real Madrid'),(12,'Xavi','Hernandez','1980-01-25','Spain','Barcelona'),(14,'Jose','Luis Mendilibar','1961-03-14','Spain','Sevilla'),(15,'Manuel','Pellegrini','1953-09-16','Chile','Real Betis'),(16,'Imanol','Alguacil','1971-07-04','Spain','Real Sociedad'),(17,'Ernesto','Valverde','1964-02-09','Spain','Athletic Club'),(18,'Ruben','Baraja','1975-07-11','Spain','Valencia'),(19,'Quique','Setien','1958-09-27','Spain','Villarreal'),(20,'Luis','Garcia','1975-09-01','Spain','Espanyol'),(21,'Greg','Vanney','1974-06-11','USA','LA Galaxy'),(22,'Wayne','Rooney','1985-10-24','England','DC United'),(23,'Troy','Lesesne','1983-09-04','USA','New York Red Bulls'),(24,'Brian','Schmetzer','1962-08-18','USA','Seattle Sounders'),(25,'Giovanni','Savarese','1971-07-14','Venezuela','Portland Timbers'),(26,'Gonzalo','Pineda','1982-10-19','Mexico','Atlanta United'),(27,'Oscar','Pareja','1968-06-10','Colombia','Orlando City'),(28,'Bob','Bradley','1958-03-03','USA','Toronto'),(29,'Frank','Klopas','1966-09-01','USA','Chicago Fire'),(30,'Gerardo','Martino','1962-11-20','Argentina','Inter Miami');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(128) NOT NULL,
  `market_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jersey_number` int NOT NULL,
  `position_abb` varchar(10) NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Ederson','Moraes','1993-08-17','Brazil',50000000.00,31,'GK'),(2,'Ruben','Dias','1997-05-14','Portugal',75000000.00,3,'CB'),(3,'John','Stones','1994-05-28','England',45000000.00,5,'CB'),(4,'Kyle','Walker','1990-05-28','England',15000000.00,2,'RB'),(5,'Joao','Cancelo','1994-05-27','Portugal',50000000.00,7,'LB'),(6,'Rodri','Hernandez','1996-06-22','Spain',85000000.00,16,'CDM'),(7,'Ilkay','Gundogan','1990-10-24','Germany',15000000.00,8,'CM'),(8,'Kevin','De Bruyne','1991-06-28','Belgium',85000000.00,17,'CAM'),(9,'Bernardo','Silva','1994-08-10','Portugal',80000000.00,20,'RW'),(10,'Jack','Grealish','1995-09-10','England',90000000.00,10,'LW'),(11,'Erling','Haaland','2000-07-21','Norway',180000000.00,9,'ST'),(12,'Aaron','Ramsdale','1998-05-14','England',25000000.00,1,'GK'),(13,'William','Saliba','2001-03-24','France',35000000.00,12,'CB'),(14,'Ben','White','1997-10-08','England',50000000.00,4,'CB'),(15,'Kieran','Tierney','1997-06-05','Scotland',30000000.00,3,'LB'),(16,'Takehiro','Tomiyasu','1998-11-05','Japan',25000000.00,18,'RB'),(17,'Thomas','Partey','1993-06-13','Ghana',45000000.00,5,'CDM'),(18,'Martin','Ødegaard','1998-12-17','Norway',70000000.00,8,'CM'),(19,'Bukayo','Saka','2001-09-05','England',100000000.00,7,'RW'),(20,'Gabriel','Martinelli','2001-06-18','Brazil',60000000.00,11,'LW'),(21,'Gabriel','Jesus','1997-04-03','Brazil',75000000.00,9,'ST'),(22,'Kai','Havertz','1999-06-11','Germany',75000000.00,29,'CAM'),(23,'André','Onana','1996-04-02','Cameroon',35000000.00,24,'GK'),(24,'Diogo','Dalot','1999-03-18','Portugal',25000000.00,20,'RB'),(25,'Raphaël','Varane','1993-04-25','France',40000000.00,19,'CB'),(26,'Lisandro','Martínez','1998-01-18','Argentina',50000000.00,6,'CB'),(27,'Luke','Shaw','1995-07-12','England',28000000.00,23,'LB'),(28,'Casemiro','','1992-02-23','Brazil',60000000.00,18,'CDM'),(29,'Bruno','Fernandes','1994-09-08','Portugal',75000000.00,8,'CM'),(30,'Mason','Mount','1999-01-10','England',55000000.00,7,'RB'),(31,'Marcus','Rashford','1997-10-31','England',90000000.00,10,'LW'),(32,'Antony','Matheus','2000-02-24','Brazil',60000000.00,21,'RW'),(33,'Rasmus','Højlund','2003-02-04','Denmark',70000000.00,11,'ST'),(34,'Heung-Min','Son','1992-07-08','South Korea',45000000.00,7,'LW'),(35,'James','Maddison','1996-11-23','England',70000000.00,10,'RB'),(36,'Cristian','Romero','1998-04-27','Argentina',65000000.00,17,'CB'),(37,'Richarlison','','1997-05-10','Brazil',35000000.00,9,'ST'),(38,'Yves','Bissouma','1996-08-30','Ivory Coast',35000000.00,8,'CM'),(39,'Guglielmo','Vicario','1996-10-07','Italy',35000000.00,1,'GK'),(40,'Dejan','Kulusevski','2000-04-25','Sweden',55000000.00,21,'RW'),(41,'Pedro','Porro','1999-09-13','Spain',45000000.00,23,'RB'),(42,'Destiny','Udogie','2002-11-28','Italy',45000000.00,13,'LB'),(43,'Rodrigo','Bentancur','1997-06-25','Uruguay',35000000.00,30,'CM'),(44,'Micky','van de Ven','2001-04-19','Netherlands',55000000.00,37,'CB'),(45,'Emiliano','Martínez','1992-09-02','Argentina',27000000.00,23,'GK'),(46,'Matty','Cash','1997-06-07','Poland',65000000.00,2,'RB'),(47,'Lucas','Digne','1993-07-20','France',14000000.00,12,'LB'),(48,'Tyrone','Mings','1993-03-13','England',15000000.00,5,'CB'),(49,'Diego','Carlos','1992-03-30','Brazil',12000000.00,3,'CB'),(50,'Ezri','Konsa','1998-01-23','England',23000000.00,4,'CB'),(51,'Pau','Torres','1997-01-16','Spain',23000000.00,14,'CB'),(52,'John','McGinn','1994-10-18','Scotland',30000000.00,7,'CM'),(53,'Douglas','Luiz','1998-05-09','Brazil',25000000.00,6,'CM'),(54,'Leon','Bailey','1997-08-09','Jamaica',30000000.00,31,'RW'),(55,'Ollie','Watkins','1996-12-30','England',70000000.00,11,'ST'),(56,'Nick','Pope','1992-04-19','England',35000000.00,22,'GK'),(57,'Kieran','Trippier','1990-09-19','England',12000000.00,2,'RB'),(58,'Sven','Botman','2000-01-12','Netherlands',45000000.00,4,'CB'),(59,'Bruno','Guimarães','1997-11-16','Brazil',70000000.00,39,'CM'),(60,'Sandro','Tonali','2000-05-08','Italy',60000000.00,8,'CM'),(61,'Joelinton','','1996-08-14','Brazil',50000000.00,7,'CM'),(62,'Harvey','Barnes','1997-12-09','England',38000000.00,15,'LW'),(63,'Miguel','Almirón','1994-02-10','Paraguay',22000000.00,24,'RW'),(64,'Callum','Wilson','1992-02-27','England',10000000.00,9,'ST'),(65,'Alexander','Isak','1999-09-21','Sweden',45000000.00,14,'ST'),(66,'Anthony','Gordon','2001-02-24','England',30000000.00,10,'LW'),(67,'Bernd','Leno','1992-03-04','Germany',12000000.00,1,'GK'),(68,'Kenny','Tete','1995-10-09','Netherlands',8000000.00,2,'RB'),(69,'Issa','Diop','1997-01-09','France',15000000.00,31,'CB'),(70,'Calvin','Bassey','1999-12-31','Nigeria',10000000.00,3,'CB'),(71,'Antonee','Robinson','1997-08-08','United States',8000000.00,33,'LB'),(72,'Harrison','Reed','1995-01-27','England',7000000.00,6,'CM'),(73,'Andreas','Pereira','1996-01-01','Brazil',10000000.00,18,'CAM'),(74,'Harry','Wilson','1997-03-22','Wales',9000000.00,8,'RW'),(75,'Raúl','Jiménez','1991-05-05','Mexico',5000000.00,7,'ST'),(76,'Carlos','Vinícius','1995-03-22','Brazil',6000000.00,12,'ST'),(77,'João','Palhinha','1995-07-09','Portugal',40000000.00,26,'CDM'),(78,'Mark','Flekken','1993-06-13','Netherlands',12000000.00,1,'GK'),(79,'Aaron','Hickey','2002-06-10','Scotland',18000000.00,2,'RB'),(80,'Ethan','Pinnock','1993-05-29','Jamaica',8000000.00,5,'CB'),(81,'Ben','Mee','1989-09-21','England',2000000.00,16,'CB'),(82,'Rico','Henry','1997-07-08','England',15000000.00,3,'LB'),(83,'Christian','Nørgaard','1994-03-10','Denmark',16000000.00,6,'CDM'),(84,'Mathias','Jensen','1996-01-01','Denmark',14000000.00,8,'CM'),(85,'Bryan','Mbeumo','1999-08-07','Cameroon',22000000.00,19,'RW'),(86,'Yoane','Wissa','1996-09-03','DR Congo',15000000.00,11,'LW'),(87,'Kevin','Schade','2001-11-27','Germany',20000000.00,7,'RW'),(88,'Igor','Thiago','2001-06-26','Brazil',25000000.00,9,'ST'),(89,'Alisson','Becker','1992-10-02','Brazil',70000000.00,1,'GK'),(90,'Virgil','van Dijk','1991-07-08','Netherlands',55000000.00,4,'CB'),(91,'Trent','Alexander-Arnold','1998-10-07','England',80000000.00,66,'RB'),(92,'Mohamed','Salah','1992-06-15','Egypt',85000000.00,11,'RW'),(93,'Luis','Díaz','1997-01-13','Colombia',45000000.00,7,'LW'),(94,'Cody','Gakpo','1999-05-07','Netherlands',55000000.00,18,'CM'),(95,'Alexis','Mac Allister','1998-12-24','Argentina',40000000.00,10,'CM'),(96,'Dominik','Szoboszlai','2000-10-25','Hungary',70000000.00,8,'CM'),(97,'Diogo','Jota','1996-12-04','Portugal',45000000.00,20,'LW'),(98,'Harvey','Elliott','2003-04-04','England',35000000.00,19,'CAM'),(99,'Darwin','Núñez','1999-06-24','Uruguay',70000000.00,9,'ST'),(100,'Reece','James','1999-12-08','England',60000000.00,24,'RB'),(101,'Enzo','Fernández','2001-01-17','Argentina',120000000.00,8,'CM'),(102,'Mykhailo','Mudryk','2001-01-05','Ukraine',40000000.00,10,'LW'),(103,'Christopher','Nkunku','1997-11-14','France',65000000.00,18,'CM'),(104,'Raheem','Sterling','1994-12-08','England',55000000.00,17,'LW'),(105,'Marc','Cucurella','1998-07-22','Spain',40000000.00,3,'LB'),(106,'Benoît','Badiashile','2001-03-26','France',35000000.00,4,'CB'),(107,'Conor','Gallagher','2000-02-06','England',40000000.00,23,'CM'),(108,'Wesley','Fofana','2000-12-17','France',55000000.00,33,'CB'),(109,'Thiago','Silva','1984-09-22','Brazil',5000000.00,6,'CB'),(110,'Noni','Madueke','2002-03-10','England',30000000.00,31,'RW'),(111,'Thibaut','Courtois','1992-05-11','Belgium',60000000.00,1,'GK'),(112,'Dani','Carvajal','1992-01-11','Spain',25000000.00,2,'RB'),(113,'Eder','Militão','1998-01-18','Brazil',65000000.00,3,'CB'),(114,'David','Alaba','1992-06-24','Austria',40000000.00,4,'CB'),(115,'Ferland','Mendy','1995-06-08','France',25000000.00,23,'LB'),(116,'Eduardo','Camavinga','2002-11-10','France',85000000.00,12,'CM'),(117,'Federico','Valverde','1998-07-22','Uruguay',90000000.00,15,'CM'),(118,'Jude','Bellingham','2003-06-29','England',120000000.00,5,'CAM'),(119,'Rodrygo','Goes','2001-01-09','Brazil',80000000.00,11,'RW'),(120,'Vinícius','Júnior','2000-07-12','Brazil',150000000.00,7,'LW'),(121,'Joselu','','1990-03-27','Spain',10000000.00,14,'ST'),(122,'Marc-André','ter Stegen','1992-04-30','Germany',45000000.00,1,'GK'),(123,'Jules','Koundé','1998-11-12','France',60000000.00,23,'RB'),(124,'Ronald','Araújo','1999-03-07','Uruguay',70000000.00,4,'CB'),(125,'Andreas','Christensen','1996-04-10','Denmark',35000000.00,15,'CB'),(126,'Alejandro','Balde','2003-10-18','Spain',50000000.00,28,'LB'),(127,'Gavi','','2004-08-05','Spain',90000000.00,6,'CM'),(128,'Pedri','González','2002-11-25','Spain',100000000.00,8,'CM'),(129,'Frenkie','de Jong','1997-05-12','Netherlands',85000000.00,21,'CM'),(130,'Raphinha','','1996-12-14','Brazil',60000000.00,22,'RW'),(131,'Robert','Lewandowski','1988-08-21','Poland',20000000.00,9,'ST'),(132,'Ansu','Fati','2002-10-31','Spain',50000000.00,10,'LW'),(133,'Jan','Oblak','1993-01-07','Slovenia',40000000.00,13,'GK'),(134,'José María','Giménez','1995-01-20','Uruguay',35000000.00,2,'CB'),(135,'Stefan','Savic','1991-01-08','Montenegro',15000000.00,15,'CB'),(136,'Reinildo','Mandava','1994-01-21','Mozambique',8000000.00,23,'LB'),(137,'Nahuel','Molina','1998-04-06','Argentina',25000000.00,16,'RB'),(138,'Koke','Resurrección','1992-01-08','Spain',15000000.00,6,'CM'),(139,'Rodrigo','De Paul','1994-05-24','Argentina',35000000.00,5,'CM'),(140,'Yannick','Carrasco','1993-09-04','Belgium',25000000.00,21,'LW'),(141,'Antoine','Griezmann','1991-03-21','France',25000000.00,8,'ST'),(142,'Ángel','Correa','1995-03-09','Argentina',30000000.00,10,'RW'),(143,'Álvaro','Morata','1992-10-23','Spain',25000000.00,9,'ST'),(144,'Loïc','Badé','2000-04-11','France',15000000.00,22,'CB'),(145,'Kike','Salas','2002-04-12','Spain',3000000.00,32,'CB'),(146,'Marcão','Teixeira','1996-06-05','Brazil',12000000.00,6,'CB'),(147,'Tanguy','Nianzou','2002-06-07','France',15000000.00,14,'CB'),(148,'Valentín','Barco','2004-07-23','Argentina',8000000.00,3,'LB'),(149,'Adrià','Pedrosa','1998-05-13','Spain',7000000.00,18,'LB'),(150,'Juanlu','Sánchez','2003-05-06','Spain',4000000.00,25,'CM'),(151,'Gonzalo','Montiel','1997-01-01','Argentina',12000000.00,29,'RB'),(152,'Jesús','Navas','1985-11-21','Spain',2000000.00,16,'RB'),(153,'Lucien','Agoumé','2002-02-09','France',5000000.00,20,'CDM'),(154,'Youssef','En-Nesyri','1997-06-01','Morocco',25000000.00,15,'ST'),(155,'Rui','Silva','1994-02-07','Portugal',12000000.00,13,'GK'),(156,'Youssouf','Sabaly','1993-03-05','Senegal',5000000.00,23,'RB'),(157,'Marc','Bartra','1991-01-15','Spain',4000000.00,5,'CB'),(158,'Diego','Llorente','1993-08-16','Spain',8000000.00,6,'CB'),(159,'Romain','Perraud','1997-09-22','France',7000000.00,15,'LB'),(160,'Johnny','Cardoso','2001-09-20','USA',5000000.00,18,'CM'),(161,'Sergi','Altimira','2001-08-25','Spain',3000000.00,21,'CM'),(162,'Pablo','Fornals','1996-02-22','Spain',15000000.00,8,'RB'),(163,'Ez','Abde','2001-12-17','Morocco',10000000.00,11,'LW'),(164,'Vitor','Roque','2005-02-28','Brazil',25000000.00,9,'ST'),(165,'Cédric','Bakambu','1991-04-11','DR Congo',5000000.00,17,'ST'),(166,'Álex','Remiro','1995-03-24','Spain',25000000.00,1,'GK'),(167,'Igor','Zubeldia','1997-03-30','Spain',22000000.00,5,'CB'),(168,'Jon','Pacheco','2001-01-08','Spain',15000000.00,20,'CB'),(169,'Aritz','Elustondo','1994-03-28','Spain',5000000.00,6,'CB'),(170,'Sergio','Gómez','2000-09-04','Spain',10000000.00,3,'LB'),(171,'Aihen','Muñoz','1997-08-16','Spain',8000000.00,3,'LB'),(172,'Hamari','Traoré','1992-01-27','Mali',6000000.00,18,'RB'),(173,'Martín','Zubimendi','1999-02-02','Spain',50000000.00,4,'RB'),(174,'Mikel','Merino','1996-06-22','Spain',50000000.00,8,'CM'),(175,'Takefusa','Kubo','2001-06-04','Japan',30000000.00,14,'RW'),(176,'Mikel','Oyarzabal','1997-04-21','Spain',50000000.00,10,'LW'),(177,'Unai','Simón','1997-06-11','Spain',25000000.00,1,'GK'),(178,'Óscar','De Marcos','1989-04-14','Spain',2000000.00,18,'RB'),(179,'Dani','Vivian','1999-07-05','Spain',15000000.00,3,'CB'),(180,'Yeray','Álvarez','1995-01-24','Spain',20000000.00,5,'CB'),(181,'Yuri','Berchiche','1990-02-10','Spain',3000000.00,17,'LB'),(182,'Mikel','Vesga','1993-04-21','Spain',8000000.00,6,'CM'),(183,'Oihan','Sancet','2000-04-25','Spain',25000000.00,8,'RB'),(184,'Iñaki','Williams','1994-06-15','Spain',25000000.00,9,'RW'),(185,'Nico','Williams','2002-07-12','Spain',40000000.00,11,'LW'),(186,'Gorka','Guruzeta','1996-09-12','Spain',8000000.00,12,'ST'),(187,'Iker','Muniain','1992-12-19','Spain',10000000.00,10,'RB'),(188,'Giorgi','Mamardashvili','2000-09-29','Georgia',45000000.00,25,'GK'),(189,'Cristhian','Mosquera','2004-06-27','Spain',30000000.00,3,'CB'),(190,'Yarek','Gasiorowski','2005-01-10','Spain',15000000.00,24,'CB'),(191,'César','Tárrega','2002-01-31','Spain',4000000.00,15,'CB'),(192,'Mouctar','Diakhaby','1996-12-19','Guinea',15000000.00,4,'CB'),(193,'Luis','Rioja','1993-10-16','Spain',4000000.00,22,'LW'),(194,'Diego','López','2002-02-13','Spain',12000000.00,16,'RW'),(195,'Fran','Pérez','2002-08-12','Spain',6000000.00,23,'RW'),(196,'Sergi','Canós','1997-02-02','Spain',2500000.00,7,'RW'),(197,'Germán','Valera','2002-03-16','Spain',2000000.00,30,'RW'),(198,'Hugo','Duro','1999-11-10','Spain',5000000.00,19,'ST'),(199,'Pepe','Reina','1982-08-31','Spain',1000000.00,1,'GK'),(200,'Kiko','Femenía','1991-02-02','Spain',3000000.00,2,'RB'),(201,'Raúl','Albiol','1985-09-04','Spain',1000000.00,3,'CB'),(202,'Jorge','Cuenca','1999-11-17','Spain',5000000.00,4,'CB'),(203,'Alberto','Moreno','1992-07-05','Spain',3000000.00,18,'LB'),(204,'Dani','Parejo','1989-04-16','Spain',5000000.00,10,'CM'),(205,'Etienne','Capoue','1988-07-11','France',3000000.00,6,'CDM'),(206,'Álex','Baena','2001-07-20','Spain',25000000.00,16,'LW'),(207,'Ilias','Akhomach','2004-04-16','Spain',3000000.00,11,'RW'),(208,'Ayoze','Pérez','1993-07-29','Spain',8000000.00,22,'ST'),(209,'Thierno','Barry','2002-01-12','Guinea',6000000.00,9,'ST'),(210,'Joan','García','2001-05-04','Spain',10000000.00,1,'GK'),(211,'Omar','El Hilali','2003-09-12','Morocco',5000000.00,23,'RB'),(212,'Leandro','Cabrera','1991-06-17','Uruguay',1200000.00,6,'CB'),(213,'Sergi','Gómez','1992-03-28','Spain',1000000.00,3,'CB'),(214,'Brian','Oliván','1994-04-01','Spain',2000000.00,14,'LB'),(215,'Pol','Lozano','1999-10-06','Spain',4000000.00,10,'CM'),(216,'Pere','Milla','1992-09-23','Spain',3000000.00,11,'RB'),(217,'Jofre','Carreras','2001-06-17','Spain',2000000.00,17,'RW'),(218,'Javier','Puado','1998-05-25','Spain',8000000.00,7,'LW'),(219,'Alejo','Veliz','2003-09-19','Argentina',15000000.00,9,'ST'),(220,'Martin','Braithwaite','1991-06-05','Denmark',8000000.00,12,'ST'),(221,'Jonathan','Bond','1993-05-19','England',1000000.00,1,'GK'),(222,'Julián','Aude','2003-03-24','Argentina',3500000.00,3,'LB'),(223,'Gastón','Brugman','1992-09-07','Uruguay',2000000.00,5,'CDM'),(224,'Martín','Cáceres','1987-04-07','Uruguay',400000.00,22,'CB'),(225,'Mark','Delgado','1995-05-16','USA',1500000.00,8,'CM'),(226,'Riqui','Puig','1999-08-13','Spain',5000000.00,6,'CM'),(227,'Douglas','Costa','1990-09-14','Brazil',3000000.00,10,'RW'),(228,'Chicharito','Hernández','1988-06-01','Mexico',4000000.00,14,'ST'),(229,'Dejan','Joveljić','1999-08-07','Serbia',2500000.00,9,'ST'),(230,'Efraín','Álvarez','2002-06-19','Mexico',1200000.00,26,'LW'),(231,'Julian','Araujo','2001-08-13','USA',3000000.00,2,'RB'),(232,'Christian','Benteke','1990-12-03','Belgium',4687500.00,20,'ST'),(233,'Mateusz','Klich','1990-06-13','Poland',2093588.00,43,'CM'),(234,'Gabriel','Pirani','2002-04-12','Brazil',731700.00,10,'RB'),(235,'Pedro','Santos','1988-04-22','Portugal',490000.00,7,'LW'),(236,'Russell','Canouse','1995-06-11','USA',650000.00,6,'CDM'),(237,'Jared','Stroud','1996-07-10','USA',272500.00,8,'RW'),(238,'Aaron','Herrera','1997-06-06','Guatemala',845220.00,22,'RB'),(239,'Lucas','Bartlett','1996-07-26','USA',89716.00,3,'CB'),(240,'David','Schnegg','1998-09-29','Austria',506250.00,28,'LB'),(241,'Tyler','Miller','1993-03-12','USA',450000.00,1,'GK'),(242,'Derrick','Williams','1993-01-17','Ireland',700000.00,5,'CB'),(243,'Carlos','Coronel','1997-12-29','Brazil',800000.00,1,'GK'),(244,'Kyle','Duncan','1997-08-08','USA',1200000.00,6,'RB'),(245,'Sean','Nealis','1997-04-13','USA',2000000.00,15,'CB'),(246,'Andrés','Reyes','1999-09-08','Colombia',9600000.00,4,'CB'),(247,'John','Tolkin','2002-07-31','USA',32000000.00,47,'LB'),(248,'Daniel','Edelman','2003-04-28','USA',14400000.00,75,'CDM'),(249,'Peter','Stroud','2002-04-23','USA',3200000.00,5,'CM'),(250,'Lewis','Morgan','1996-09-30','Scotland',1425000.00,11,'RW'),(251,'Dante','Vanzeir','1998-04-16','Belgium',1489767.00,13,'ST'),(252,'Julian','Hall','2008-03-24','USA',182241.00,9,'ST'),(253,'Cameron','Harper','2001-11-19','USA',800000.00,17,'LW'),(254,'Stefan','Frei','1986-04-20','Switzerland',300000.00,24,'GK'),(255,'Yeimar','Gómez Andrade','1992-06-30','Colombia',2500000.00,28,'CB'),(256,'Jackson','Ragen','1998-09-24','USA',2000000.00,25,'CB'),(257,'Nouhou','Tolo','1997-06-23','Cameroon',2000000.00,5,'LB'),(258,'Alex','Roldan','1996-07-28','El Salvador',1500000.00,16,'RB'),(259,'João','Paulo','1991-03-08','Brazil',3000000.00,6,'CDM'),(260,'Albert','Rusnák','1994-07-07','Slovakia',4000000.00,11,'CM'),(261,'Cristian','Roldan','1995-06-03','USA',2500000.00,7,'RW'),(262,'Jordan','Morris','1994-10-26','USA',3000000.00,13,'LW'),(263,'Raúl','Ruidíaz','1990-07-25','Peru',4000000.00,9,'ST'),(264,'Obed','Vargas','2005-08-05','USA',1500000.00,73,'CM'),(265,'Aljaz','Ivacic','1993-12-29','Slovenia',800000.00,31,'GK'),(266,'Miguel','Araujo','1994-10-24','Peru',850000.00,2,'CB'),(267,'Dario','Zuparic','1992-05-03','Croatia',1200000.00,13,'CB'),(268,'Claudio','Bravo','1997-03-13','Argentina',3000000.00,5,'LB'),(269,'Juan','Mosquera','2002-01-01','Colombia',1500000.00,29,'RB'),(270,'Diego','Chará','1986-04-05','Colombia',500000.00,21,'CDM'),(271,'Cristhian','Paredes','1998-05-18','Paraguay',1400000.00,22,'CM'),(272,'Sebastian','Blanco','1988-03-15','Argentina',750000.00,10,'RB'),(273,'Santiago','Moreno','2000-04-21','Colombia',4000000.00,30,'RW'),(274,'Felipe','Mora','1993-08-02','Chile',2000000.00,9,'ST'),(275,'Franck','Boli','1993-12-07','Ivory Coast',3500000.00,99,'ST'),(276,'Brad','Guzan','1984-09-09','USA',100000.00,1,'GK'),(277,'Ronald','Hernández','1997-09-21','Venezuela',450000.00,2,'RB'),(278,'Derrick','Williams','1993-01-17','Ireland',500000.00,3,'CB'),(279,'Luis','Abram','1996-02-27','Peru',3000000.00,4,'CB'),(280,'Andrew','Gutman','1996-10-02','USA',900000.00,15,'LB'),(281,'Santiago','Sosa','1999-05-03','Argentina',2500000.00,5,'CDM'),(282,'Thiago','Almada','2001-04-26','Argentina',18000000.00,23,'RB'),(283,'Brooks','Lennon','1997-09-22','USA',1500000.00,11,'RW'),(284,'Giorgos','Giakoumakis','1994-12-09','Greece',8000000.00,7,'ST'),(285,'Edwin','Mosquera','2001-07-27','Colombia',1200000.00,21,'LW'),(286,'Machop','Chol','1998-11-15','USA',500000.00,30,'LW'),(287,'Pedro','Gallese','1990-02-23','Peru',2000000.00,1,'GK'),(288,'Robin','Jansson','1991-11-15','Sweden',1000000.00,6,'CB'),(289,'Rodrigo','Schlegel','1997-04-03','Argentina',800000.00,15,'CB'),(290,'Rafael','Santos','1998-04-07','Brazil',600000.00,3,'LB'),(291,'Kyle','Smith','1992-01-09','USA',500000.00,24,'RB'),(292,'César','Araújo','2001-04-02','Uruguay',3000000.00,5,'CDM'),(293,'Mauricio','Pereyra','1990-03-15','Uruguay',1500000.00,10,'RB'),(294,'Facundo','Torres','2000-04-13','Uruguay',12000000.00,17,'RW'),(295,'Iván','Angulo','1999-03-22','Colombia',2000000.00,77,'LW'),(296,'Ercan','Kara','1996-01-03','Austria',3500000.00,9,'ST'),(297,'Duncan','McGuire','2000-11-06','USA',800000.00,13,'ST'),(298,'Sean','Johnson','1989-05-31','USA',500000.00,1,'GK'),(299,'Richie','Laryea','1995-01-07','Canada',2000000.00,22,'RB'),(300,'Sigurd','Rosted','1994-07-22','Norway',1000000.00,17,'CB'),(301,'Raoul','Petretta','1997-03-24','Italy',800000.00,28,'LB'),(302,'Jonathan','Osorio','1992-06-12','Canada',3000000.00,21,'CM'),(303,'Michael','Bradley','1987-07-31','USA',1200000.00,4,'CDM'),(304,'Federico','Bernardeschi','1994-02-16','Italy',8000000.00,10,'RW'),(305,'Lorenzo','Insigne','1991-06-04','Italy',15000000.00,24,'LW'),(306,'Deandre','Kerr','2003-11-29','Canada',1000000.00,29,'ST'),(307,'Adama','Diomande','1990-02-14','Norway',700000.00,99,'ST'),(308,'Kosi','Thompson','2003-01-01','Canada',600000.00,47,'RW'),(309,'Chris','Brady','2004-03-03','USA',1000000.00,34,'GK'),(310,'Arnaud','Souquet','1992-02-12','France',800000.00,2,'RB'),(311,'Rafael','Czichos','1990-05-14','Germany',1200000.00,5,'CB'),(312,'Carlos','Terán','2000-09-24','Colombia',1500000.00,4,'CB'),(313,'Miguel','Navarro','1999-02-26','Venezuela',1000000.00,6,'LB'),(314,'Gaston','Gimenez','1991-07-27','Paraguay',2000000.00,30,'CDM'),(315,'Brian','Gutierrez','2003-06-19','USA',5000000.00,17,'CM'),(316,'Xherdan','Shaqiri','1991-10-10','Switzerland',7500000.00,10,'RB'),(317,'Maren','Haile-Selassie','1999-03-13','Switzerland',1500000.00,77,'RW'),(318,'Kei','Kamara','1984-09-01','Sierra Leone',200000.00,23,'ST'),(319,'Kacper','Przybylko','1993-03-25','Poland',800000.00,11,'ST'),(320,'Drake','Callender','1997-10-07','USA',2000000.00,1,'GK'),(321,'DeAndre','Yedlin','1993-07-09','USA',3000000.00,2,'RB'),(322,'Sergii','Kryvtsov','1991-03-15','Ukraine',1500000.00,27,'CB'),(323,'Jordi','Alba','1989-03-21','Spain',5000000.00,18,'LB'),(324,'Sergio','Busquets','1988-07-16','Spain',7000000.00,5,'CDM'),(325,'Benjamin','Cremaschi','2005-03-02','USA',1000000.00,30,'CM'),(326,'Facundo','Farías','2002-08-28','Argentina',8000000.00,11,'RB'),(327,'Robert','Taylor','1994-10-21','Finland',1500000.00,16,'LW'),(328,'Lionel','Messi','1987-06-24','Argentina',50000000.00,10,'RW'),(329,'Leonardo','Campana','2000-07-24','Ecuador',4000000.00,9,'ST'),(330,'Luis','Suárez','1987-01-24','Uruguay',6000000.00,9,'ST');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_stat`
--

DROP TABLE IF EXISTS `player_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stat` (
  `player_id` int NOT NULL,
  `team_1_name` varchar(128) NOT NULL,
  `team_2_name` varchar(128) NOT NULL,
  `match_date` date NOT NULL,
  `goals_scored` int NOT NULL DEFAULT '0',
  `yellow_card` int NOT NULL DEFAULT '0',
  `red_card` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`player_id`,`team_1_name`,`team_2_name`,`match_date`),
  KEY `team_1_name` (`team_1_name`,`team_2_name`,`match_date`),
  CONSTRAINT `player_stat_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_stat_ibfk_2` FOREIGN KEY (`team_1_name`, `team_2_name`, `match_date`) REFERENCES `game` (`team_1_name`, `team_2_name`, `match_date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stat`
--

LOCK TABLES `player_stat` WRITE;
/*!40000 ALTER TABLE `player_stat` DISABLE KEYS */;
INSERT INTO `player_stat` VALUES (3,'Chelsea','Manchester City','2023-07-02',0,1,0),(3,'Manchester United','Manchester City','2022-09-15',0,1,0),(4,'Chelsea','Manchester City','2023-07-02',0,1,0),(4,'Manchester City','Manchester United','2024-10-01',2,0,0),(5,'Chelsea','Manchester City','2023-07-02',0,1,0),(5,'Manchester United','Manchester City','2022-09-15',0,1,0),(6,'Manchester United','Manchester City','2022-09-15',0,1,0),(7,'Chelsea','Manchester City','2023-07-02',2,0,0),(7,'Manchester United','Manchester City','2022-09-15',2,0,0),(8,'Manchester City','Manchester United','2024-10-01',1,0,1),(8,'Manchester United','Manchester City','2022-09-15',3,0,0),(9,'Manchester City','Manchester United','2024-10-01',0,0,1),(13,'Arsenal','Aston Villa','2024-10-01',2,0,0),(14,'Arsenal','Aston Villa','2024-10-01',0,1,0),(15,'Arsenal','Aston Villa','2024-10-01',0,1,0),(16,'Arsenal','Tottenham Hotspur','2023-07-02',2,0,0),(22,'Arsenal','Tottenham Hotspur','2023-07-02',0,1,0),(27,'Manchester United','Manchester City','2022-09-15',2,0,0),(28,'Manchester City','Manchester United','2024-10-01',2,0,0),(28,'Manchester United','Manchester City','2022-09-15',0,1,0),(29,'Manchester United','Manchester City','2022-09-15',0,1,0),(30,'Manchester City','Manchester United','2024-10-01',0,1,0),(30,'Manchester United','Manchester City','2022-09-15',0,0,1),(31,'Manchester City','Manchester United','2024-10-01',0,1,0),(31,'Manchester United','Manchester City','2022-09-15',0,1,0),(32,'Manchester City','Manchester United','2024-10-01',0,0,1),(36,'Newcastle United','Tottenham Hotspur','2024-10-30',0,0,1),(37,'Newcastle United','Tottenham Hotspur','2024-10-30',0,1,0),(38,'Newcastle United','Tottenham Hotspur','2024-10-30',0,1,0),(40,'Arsenal','Tottenham Hotspur','2023-07-02',2,0,0),(40,'Newcastle United','Tottenham Hotspur','2022-09-15',2,1,0),(40,'Newcastle United','Tottenham Hotspur','2024-10-30',2,0,0),(41,'Newcastle United','Tottenham Hotspur','2022-09-15',0,1,0),(42,'Newcastle United','Tottenham Hotspur','2022-09-15',0,1,0),(43,'Newcastle United','Tottenham Hotspur','2022-09-15',0,1,0),(46,'Aston Villa','Brentford','2022-06-14',2,0,0),(46,'Aston Villa','Newcastle United','2023-07-02',2,0,0),(47,'Aston Villa','Brentford','2022-06-14',2,0,0),(47,'Aston Villa','Chelsea','2022-06-14',2,0,0),(48,'Arsenal','Aston Villa','2024-10-01',0,1,0),(49,'Arsenal','Aston Villa','2024-10-01',0,1,0),(51,'Aston Villa','Brentford','2022-06-14',0,1,0),(51,'Aston Villa','Chelsea','2022-06-14',0,0,1),(52,'Aston Villa','Brentford','2022-06-14',0,1,0),(52,'Aston Villa','Newcastle United','2023-07-02',2,0,0),(53,'Aston Villa','Chelsea','2022-06-14',2,1,0),(54,'Aston Villa','Chelsea','2022-06-14',0,1,0),(55,'Aston Villa','Chelsea','2022-06-14',0,1,0),(60,'Newcastle United','Tottenham Hotspur','2024-10-30',0,1,0),(61,'Aston Villa','Newcastle United','2023-07-02',2,0,0),(61,'Newcastle United','Tottenham Hotspur','2024-10-30',0,0,1),(62,'Newcastle United','Tottenham Hotspur','2022-09-15',2,0,0),(63,'Newcastle United','Tottenham Hotspur','2022-09-15',3,1,0),(63,'Newcastle United','Tottenham Hotspur','2024-10-30',2,0,0),(64,'Newcastle United','Tottenham Hotspur','2022-09-15',0,1,0),(65,'Newcastle United','Tottenham Hotspur','2022-09-15',0,1,0),(66,'Newcastle United','Tottenham Hotspur','2022-09-15',0,1,0),(67,'Fulham','Liverpool','2024-10-01',1,1,0),(69,'Fulham','Liverpool','2022-06-14',2,0,0),(70,'Fulham','Liverpool','2022-06-14',0,1,0),(70,'Fulham','Liverpool','2024-10-01',2,0,0),(71,'Fulham','Liverpool','2022-06-14',0,1,0),(72,'Liverpool','Fulham','2023-07-02',0,0,1),(74,'Fulham','Liverpool','2022-06-14',2,0,0),(74,'Liverpool','Fulham','2023-07-02',0,0,1),(75,'Fulham','Liverpool','2024-10-01',2,0,0),(75,'Liverpool','Fulham','2023-07-02',1,0,1),(80,'Brentford','Chelsea','2024-10-01',2,0,0),(82,'Brentford','Manchester United','2023-07-02',2,0,0),(84,'Aston Villa','Brentford','2022-06-14',2,0,0),(84,'Brentford','Manchester United','2023-07-02',2,0,0),(85,'Aston Villa','Brentford','2022-06-14',0,1,0),(93,'Liverpool','Fulham','2023-07-02',0,1,0),(94,'Fulham','Liverpool','2022-06-14',2,0,0),(94,'Liverpool','Fulham','2023-07-02',0,1,0),(95,'Fulham','Liverpool','2022-06-14',2,0,0),(95,'Liverpool','Fulham','2023-07-02',0,1,0),(97,'Fulham','Liverpool','2024-10-01',2,0,0),(97,'Liverpool','Fulham','2023-07-02',2,0,0),(102,'Chelsea','Manchester City','2023-07-02',0,0,1),(103,'Chelsea','Manchester City','2023-07-02',0,1,0),(104,'Aston Villa','Chelsea','2022-06-14',0,0,1),(104,'Brentford','Chelsea','2024-10-01',2,0,0),(104,'Chelsea','Manchester City','2023-07-02',0,0,1),(105,'Aston Villa','Chelsea','2022-06-14',0,0,1),(106,'Aston Villa','Chelsea','2022-06-14',0,1,0),(108,'Aston Villa','Chelsea','2022-06-14',2,0,0),(112,'Barcelona','Real Madrid','2024-12-03',2,0,0),(113,'Espanyol','Real Madrid','2024-12-03',0,1,0),(114,'Espanyol','Real Madrid','2024-12-03',0,0,1),(114,'Real Madrid','Real Sociedad','2023-06-21',0,1,0),(114,'Valencia','Real Madrid','2024-12-03',0,1,0),(115,'Real Madrid','Real Sociedad','2023-06-21',0,0,1),(115,'Valencia','Real Madrid','2024-12-03',0,1,0),(116,'Espanyol','Real Madrid','2024-12-03',0,1,0),(117,'Espanyol','Real Madrid','2024-12-03',2,0,0),(117,'Valencia','Real Madrid','2024-12-03',0,1,0),(118,'Valencia','Real Madrid','2024-12-03',0,1,0),(119,'Barcelona','Real Madrid','2024-12-03',3,0,0),(119,'Espanyol','Real Madrid','2024-12-03',1,1,0),(120,'Barcelona','Real Madrid','2024-12-03',2,0,0),(120,'Real Madrid','Real Sociedad','2023-06-21',4,0,0),(120,'Valencia','Real Madrid','2024-12-03',5,0,0),(123,'Barcelona','Espanyol','2024-10-07',2,0,0),(123,'Barcelona','Real Betis','2024-12-03',3,0,0),(124,'Barcelona','Real Betis','2024-12-03',2,0,0),(124,'Barcelona','Real Sociedad','2024-10-07',2,0,0),(125,'Barcelona','Real Betis','2024-12-03',0,1,0),(126,'Barcelona','Real Betis','2024-12-03',0,0,1),(126,'Barcelona','Real Madrid','2024-12-03',0,1,0),(127,'Athletic Club','Barcelona','2022-01-03',2,0,0),(127,'Barcelona','Real Madrid','2024-12-03',0,1,0),(128,'Barcelona','Real Betis','2024-12-03',0,0,1),(129,'Barcelona','Real Betis','2024-12-03',0,1,0),(129,'Barcelona','Real Madrid','2024-12-03',3,0,0),(130,'Barcelona','Real Sociedad','2024-10-07',0,1,0),(131,'Barcelona','Real Sociedad','2024-10-07',0,1,0),(151,'Villarreal','Sevilla','2024-12-08',2,0,0),(158,'Espanyol','Real Betis','2022-06-27',0,1,0),(159,'Barcelona','Real Betis','2024-12-03',0,1,0),(159,'Espanyol','Real Betis','2022-06-27',1,0,0),(160,'Barcelona','Real Betis','2024-12-03',0,1,0),(161,'Barcelona','Real Betis','2024-12-03',0,1,0),(162,'Espanyol','Real Betis','2023-06-22',0,1,0),(163,'Espanyol','Real Betis','2023-06-22',0,1,0),(164,'Espanyol','Real Betis','2023-06-22',0,0,1),(167,'Real Sociedad','Valencia','2024-12-03',0,1,0),(168,'Real Sociedad','Valencia','2024-12-03',0,0,1),(169,'Real Sociedad','Valencia','2024-12-03',0,1,0),(170,'Barcelona','Real Sociedad','2024-10-07',2,0,0),(170,'Real Sociedad','Valencia','2024-12-03',3,0,0),(171,'Barcelona','Real Sociedad','2024-10-07',0,0,1),(172,'Barcelona','Real Sociedad','2024-10-07',0,1,0),(172,'Real Madrid','Real Sociedad','2023-06-21',0,1,0),(173,'Real Madrid','Real Sociedad','2023-06-21',0,1,0),(173,'Real Sociedad','Valencia','2024-12-03',0,1,0),(174,'Real Madrid','Real Sociedad','2023-06-21',0,1,0),(174,'Real Sociedad','Valencia','2024-12-03',0,1,0),(175,'Real Madrid','Real Sociedad','2023-06-21',1,0,0),(178,'Athletic Club','Barcelona','2022-01-03',0,1,0),(178,'Athletic Club','Espanyol','2023-06-22',2,0,0),(179,'Athletic Club','Barcelona','2022-01-03',0,1,0),(181,'Athletic Club','Barcelona','2022-01-03',2,0,0),(181,'Espanyol','Athletic Club','2023-06-21',1,0,0),(183,'Athletic Club','Barcelona','2022-06-27',1,0,1),(183,'Athletic Club','Espanyol','2023-06-22',2,0,0),(184,'Athletic Club','Barcelona','2022-06-27',0,1,0),(184,'Athletic Club','Espanyol','2022-01-03',3,1,0),(185,'Athletic Club','Barcelona','2022-06-27',0,1,0),(185,'Athletic Club','Espanyol','2022-01-03',0,1,0),(186,'Athletic Club','Espanyol','2022-01-03',0,0,1),(189,'Valencia','Villarreal','2023-06-21',0,0,1),(190,'Valencia','Villarreal','2023-06-21',0,0,1),(192,'Valencia','Real Madrid','2024-12-03',3,0,0),(192,'Valencia','Villarreal','2023-06-21',0,1,0),(193,'Valencia','Villarreal','2023-06-21',2,0,0),(194,'Real Sociedad','Valencia','2024-12-03',2,1,0),(194,'Valencia','Real Madrid','2024-12-03',3,0,0),(194,'Valencia','Villarreal','2022-06-27',2,0,0),(195,'Espanyol','Valencia','2024-12-03',2,0,0),(195,'Real Sociedad','Valencia','2024-12-03',0,1,0),(196,'Real Sociedad','Valencia','2024-12-03',0,1,0),(200,'Villarreal','Sevilla','2024-12-08',2,0,0),(204,'Valencia','Villarreal','2023-06-21',2,0,0),(206,'Valencia','Villarreal','2022-06-27',2,0,0),(207,'Valencia','Villarreal','2022-06-27',0,1,0),(209,'Valencia','Villarreal','2023-06-21',2,0,0),(210,'Espanyol','Real Betis','2022-06-27',0,1,0),(211,'Espanyol','Real Betis','2022-06-27',0,1,0),(212,'Espanyol','Athletic Club','2023-06-21',0,1,0),(212,'Espanyol','Real Betis','2022-06-27',0,1,0),(213,'Athletic Club','Espanyol','2022-01-03',0,0,1),(213,'Barcelona','Espanyol','2024-10-07',1,0,0),(213,'Espanyol','Athletic Club','2023-06-21',2,0,0),(213,'Espanyol','Real Madrid','2024-12-03',0,0,1),(214,'Athletic Club','Espanyol','2022-01-03',0,1,0),(214,'Athletic Club','Espanyol','2023-06-22',2,0,0),(214,'Espanyol','Real Betis','2022-06-27',2,0,0),(214,'Espanyol','Real Madrid','2024-12-03',0,1,0),(215,'Athletic Club','Espanyol','2022-01-03',0,1,0),(215,'Espanyol','Real Betis','2023-06-22',0,1,0),(215,'Espanyol','Real Madrid','2024-12-03',0,1,0),(216,'Athletic Club','Espanyol','2022-01-03',0,1,0),(216,'Athletic Club','Espanyol','2023-06-22',2,0,0),(216,'Espanyol','Real Betis','2023-06-22',0,1,0),(216,'Espanyol','Real Madrid','2024-12-03',2,0,0),(216,'Espanyol','Valencia','2024-12-03',2,0,0),(217,'Athletic Club','Espanyol','2022-01-03',1,0,0),(217,'Espanyol','Real Betis','2023-06-22',0,1,0),(217,'Espanyol','Real Madrid','2024-12-03',0,0,1),(218,'Athletic Club','Espanyol','2022-01-03',1,0,0),(218,'Espanyol','Valencia','2024-12-03',2,0,0),(224,'Seattle Sounders','LA Galaxy','2024-11-03',2,0,0),(226,'Seattle Sounders','LA Galaxy','2024-11-03',2,0,0),(229,'LA Galaxy','New York Red Bulls','2022-06-14',2,0,0),(233,'DC United','Atlanta United','2022-06-14',3,0,0),(233,'DC United','Chicago Fire','2022-06-14',3,0,0),(234,'DC United','Atlanta United','2022-06-14',0,1,0),(234,'Inter Miami','DC United','2024-11-03',2,0,0),(235,'DC United','Atlanta United','2022-06-14',0,1,0),(236,'DC United','Atlanta United','2022-06-14',0,1,0),(236,'Inter Miami','DC United','2024-11-03',0,1,0),(237,'Inter Miami','DC United','2024-11-03',2,1,0),(239,'Inter Miami','DC United','2023-03-13',2,0,0),(240,'DC United','Chicago Fire','2022-06-14',2,0,0),(241,'Inter Miami','DC United','2023-03-13',0,1,0),(243,'New York Red Bulls','Orlando City','2023-03-13',1,0,0),(244,'New York Red Bulls','Orlando City','2023-03-13',0,1,0),(245,'New York Red Bulls','Orlando City','2023-03-13',0,1,0),(249,'LA Galaxy','New York Red Bulls','2022-06-14',2,0,0),(249,'New York Red Bulls','Orlando City','2023-03-13',1,0,0),(250,'LA Galaxy','New York Red Bulls','2022-06-14',2,0,0),(254,'Seattle Sounders','LA Galaxy','2024-11-03',0,1,0),(255,'Seattle Sounders','Toronto','2023-03-13',2,0,0),(261,'Seattle Sounders','LA Galaxy','2024-11-03',2,0,0),(263,'Seattle Sounders','Toronto','2023-03-13',0,1,0),(264,'Seattle Sounders','Toronto','2023-03-13',0,0,1),(267,'Orlando City','Portland Timbers','2022-06-14',0,1,0),(268,'Orlando City','Portland Timbers','2022-06-14',0,0,1),(269,'Orlando City','Portland Timbers','2022-06-14',1,0,1),(272,'Orlando City','Portland Timbers','2022-06-14',2,0,0),(276,'Atlanta United','Chicago Fire','2023-03-13',2,0,0),(276,'Atlanta United','Chicago Fire','2024-11-03',0,1,0),(277,'Atlanta United','Chicago Fire','2023-03-13',0,1,0),(277,'Atlanta United','Chicago Fire','2024-11-03',0,1,0),(279,'Atlanta United','Chicago Fire','2024-11-03',0,1,0),(279,'DC United','Atlanta United','2022-06-14',1,0,0),(280,'Atlanta United','Chicago Fire','2024-11-03',2,0,0),(281,'Atlanta United','Chicago Fire','2023-03-13',2,0,0),(281,'DC United','Atlanta United','2022-06-14',0,1,0),(288,'Orlando City','Portland Timbers','2022-06-14',2,0,0),(292,'Orlando City','Portland Timbers','2022-06-14',0,1,0),(293,'New York Red Bulls','Orlando City','2023-03-13',2,0,0),(293,'Orlando City','Portland Timbers','2022-06-14',0,1,0),(294,'Orlando City','Portland Timbers','2022-06-14',0,1,0),(302,'Seattle Sounders','Toronto','2023-03-13',0,1,0),(303,'Seattle Sounders','Toronto','2023-03-13',0,1,0),(304,'Seattle Sounders','Toronto','2023-03-13',2,0,0),(311,'Atlanta United','Chicago Fire','2024-11-03',0,1,0),(312,'DC United','Chicago Fire','2022-06-14',0,0,1),(313,'DC United','Chicago Fire','2022-06-14',0,1,1),(314,'Atlanta United','Chicago Fire','2023-03-13',0,1,0),(314,'Atlanta United','Chicago Fire','2024-11-03',2,0,0),(314,'DC United','Chicago Fire','2022-06-14',0,1,0),(315,'Atlanta United','Chicago Fire','2023-03-13',1,0,0),(315,'DC United','Chicago Fire','2022-06-14',0,1,0),(316,'DC United','Chicago Fire','2022-06-14',0,1,0),(317,'DC United','Chicago Fire','2022-06-14',3,0,0),(321,'Inter Miami','Chicago Fire','2022-06-14',2,0,0),(321,'Inter Miami','DC United','2023-03-13',0,1,0),(322,'Inter Miami','DC United','2023-03-13',0,1,0),(324,'Inter Miami','DC United','2024-11-03',0,0,1),(325,'Inter Miami','DC United','2024-11-03',0,1,0),(326,'Inter Miami','DC United','2023-03-13',2,0,0),(326,'Inter Miami','DC United','2024-11-03',0,0,1),(328,'Inter Miami','DC United','2024-11-03',2,0,0);
/*!40000 ALTER TABLE `player_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_team`
--

DROP TABLE IF EXISTS `player_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_team` (
  `player_id` int NOT NULL,
  `team_name` varchar(128) NOT NULL,
  `season` int NOT NULL,
  PRIMARY KEY (`player_id`,`team_name`,`season`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `player_team_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_team_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_team`
--

LOCK TABLES `player_team` WRITE;
/*!40000 ALTER TABLE `player_team` DISABLE KEYS */;
INSERT INTO `player_team` VALUES (12,'Arsenal',2022),(12,'Arsenal',2023),(12,'Arsenal',2024),(13,'Arsenal',2022),(13,'Arsenal',2023),(13,'Arsenal',2024),(14,'Arsenal',2022),(14,'Arsenal',2023),(14,'Arsenal',2024),(15,'Arsenal',2022),(15,'Arsenal',2023),(15,'Arsenal',2024),(16,'Arsenal',2022),(16,'Arsenal',2023),(16,'Arsenal',2024),(17,'Arsenal',2022),(17,'Arsenal',2023),(17,'Arsenal',2024),(18,'Arsenal',2022),(18,'Arsenal',2023),(18,'Arsenal',2024),(19,'Arsenal',2022),(19,'Arsenal',2023),(19,'Arsenal',2024),(20,'Arsenal',2022),(20,'Arsenal',2023),(20,'Arsenal',2024),(21,'Arsenal',2022),(21,'Arsenal',2023),(21,'Arsenal',2024),(22,'Arsenal',2022),(22,'Arsenal',2023),(22,'Arsenal',2024),(45,'Aston Villa',2022),(45,'Aston Villa',2023),(45,'Aston Villa',2024),(46,'Aston Villa',2022),(46,'Aston Villa',2023),(46,'Aston Villa',2024),(47,'Aston Villa',2022),(47,'Aston Villa',2023),(47,'Aston Villa',2024),(48,'Aston Villa',2022),(48,'Aston Villa',2023),(48,'Aston Villa',2024),(49,'Aston Villa',2022),(49,'Aston Villa',2023),(49,'Aston Villa',2024),(50,'Aston Villa',2022),(50,'Aston Villa',2023),(50,'Aston Villa',2024),(51,'Aston Villa',2022),(51,'Aston Villa',2023),(51,'Aston Villa',2024),(52,'Aston Villa',2022),(52,'Aston Villa',2023),(52,'Aston Villa',2024),(53,'Aston Villa',2022),(53,'Aston Villa',2023),(53,'Aston Villa',2024),(54,'Aston Villa',2022),(54,'Aston Villa',2023),(54,'Aston Villa',2024),(55,'Aston Villa',2022),(55,'Aston Villa',2023),(55,'Aston Villa',2024),(177,'Athletic Club',2022),(177,'Athletic Club',2023),(177,'Athletic Club',2024),(178,'Athletic Club',2022),(178,'Athletic Club',2023),(178,'Athletic Club',2024),(179,'Athletic Club',2022),(179,'Athletic Club',2023),(179,'Athletic Club',2024),(180,'Athletic Club',2022),(180,'Athletic Club',2023),(180,'Athletic Club',2024),(181,'Athletic Club',2022),(181,'Athletic Club',2023),(181,'Athletic Club',2024),(182,'Athletic Club',2022),(182,'Athletic Club',2023),(182,'Athletic Club',2024),(183,'Athletic Club',2022),(183,'Athletic Club',2023),(183,'Athletic Club',2024),(184,'Athletic Club',2022),(184,'Athletic Club',2023),(184,'Athletic Club',2024),(185,'Athletic Club',2022),(185,'Athletic Club',2023),(185,'Athletic Club',2024),(186,'Athletic Club',2022),(186,'Athletic Club',2023),(186,'Athletic Club',2024),(187,'Athletic Club',2022),(187,'Athletic Club',2023),(187,'Athletic Club',2024),(276,'Atlanta United',2022),(276,'Atlanta United',2023),(276,'Atlanta United',2024),(277,'Atlanta United',2022),(277,'Atlanta United',2023),(277,'Atlanta United',2024),(278,'Atlanta United',2022),(278,'Atlanta United',2023),(278,'Atlanta United',2024),(279,'Atlanta United',2022),(279,'Atlanta United',2023),(279,'Atlanta United',2024),(280,'Atlanta United',2022),(280,'Atlanta United',2023),(280,'Atlanta United',2024),(281,'Atlanta United',2022),(281,'Atlanta United',2023),(281,'Atlanta United',2024),(282,'Atlanta United',2022),(282,'Atlanta United',2023),(282,'Atlanta United',2024),(283,'Atlanta United',2022),(283,'Atlanta United',2023),(283,'Atlanta United',2024),(284,'Atlanta United',2022),(284,'Atlanta United',2023),(284,'Atlanta United',2024),(285,'Atlanta United',2022),(285,'Atlanta United',2023),(285,'Atlanta United',2024),(286,'Atlanta United',2022),(286,'Atlanta United',2023),(286,'Atlanta United',2024),(122,'Barcelona',2022),(122,'Barcelona',2023),(122,'Barcelona',2024),(123,'Barcelona',2022),(123,'Barcelona',2023),(123,'Barcelona',2024),(124,'Barcelona',2022),(124,'Barcelona',2023),(124,'Barcelona',2024),(125,'Barcelona',2022),(125,'Barcelona',2023),(125,'Barcelona',2024),(126,'Barcelona',2022),(126,'Barcelona',2023),(126,'Barcelona',2024),(127,'Barcelona',2022),(127,'Barcelona',2023),(127,'Barcelona',2024),(128,'Barcelona',2022),(128,'Barcelona',2023),(128,'Barcelona',2024),(129,'Barcelona',2022),(129,'Barcelona',2023),(129,'Barcelona',2024),(130,'Barcelona',2022),(130,'Barcelona',2023),(130,'Barcelona',2024),(131,'Barcelona',2022),(131,'Barcelona',2023),(131,'Barcelona',2024),(132,'Barcelona',2022),(132,'Barcelona',2023),(132,'Barcelona',2024),(78,'Brentford',2022),(78,'Brentford',2023),(78,'Brentford',2024),(79,'Brentford',2022),(79,'Brentford',2023),(79,'Brentford',2024),(80,'Brentford',2022),(80,'Brentford',2023),(80,'Brentford',2024),(81,'Brentford',2022),(81,'Brentford',2023),(81,'Brentford',2024),(82,'Brentford',2022),(82,'Brentford',2023),(82,'Brentford',2024),(83,'Brentford',2022),(83,'Brentford',2023),(83,'Brentford',2024),(84,'Brentford',2022),(84,'Brentford',2023),(84,'Brentford',2024),(85,'Brentford',2022),(85,'Brentford',2023),(85,'Brentford',2024),(86,'Brentford',2022),(86,'Brentford',2023),(86,'Brentford',2024),(87,'Brentford',2022),(87,'Brentford',2023),(87,'Brentford',2024),(88,'Brentford',2022),(88,'Brentford',2023),(88,'Brentford',2024),(100,'Chelsea',2022),(100,'Chelsea',2023),(100,'Chelsea',2024),(101,'Chelsea',2022),(101,'Chelsea',2023),(101,'Chelsea',2024),(102,'Chelsea',2022),(102,'Chelsea',2023),(102,'Chelsea',2024),(103,'Chelsea',2022),(103,'Chelsea',2023),(103,'Chelsea',2024),(104,'Chelsea',2022),(104,'Chelsea',2023),(104,'Chelsea',2024),(105,'Chelsea',2022),(105,'Chelsea',2023),(105,'Chelsea',2024),(106,'Chelsea',2022),(106,'Chelsea',2023),(106,'Chelsea',2024),(107,'Chelsea',2022),(107,'Chelsea',2023),(107,'Chelsea',2024),(108,'Chelsea',2022),(108,'Chelsea',2023),(108,'Chelsea',2024),(109,'Chelsea',2022),(109,'Chelsea',2023),(109,'Chelsea',2024),(110,'Chelsea',2022),(110,'Chelsea',2023),(110,'Chelsea',2024),(309,'Chicago Fire',2022),(309,'Chicago Fire',2023),(309,'Chicago Fire',2024),(310,'Chicago Fire',2022),(310,'Chicago Fire',2023),(310,'Chicago Fire',2024),(311,'Chicago Fire',2022),(311,'Chicago Fire',2023),(311,'Chicago Fire',2024),(312,'Chicago Fire',2022),(312,'Chicago Fire',2023),(312,'Chicago Fire',2024),(313,'Chicago Fire',2022),(313,'Chicago Fire',2023),(313,'Chicago Fire',2024),(314,'Chicago Fire',2022),(314,'Chicago Fire',2023),(314,'Chicago Fire',2024),(315,'Chicago Fire',2022),(315,'Chicago Fire',2023),(315,'Chicago Fire',2024),(316,'Chicago Fire',2022),(316,'Chicago Fire',2023),(316,'Chicago Fire',2024),(317,'Chicago Fire',2022),(317,'Chicago Fire',2023),(317,'Chicago Fire',2024),(318,'Chicago Fire',2022),(318,'Chicago Fire',2023),(318,'Chicago Fire',2024),(319,'Chicago Fire',2022),(319,'Chicago Fire',2023),(319,'Chicago Fire',2024),(232,'DC United',2022),(232,'DC United',2023),(232,'DC United',2024),(233,'DC United',2022),(233,'DC United',2023),(233,'DC United',2024),(234,'DC United',2022),(234,'DC United',2023),(234,'DC United',2024),(235,'DC United',2022),(235,'DC United',2023),(235,'DC United',2024),(236,'DC United',2022),(236,'DC United',2023),(236,'DC United',2024),(237,'DC United',2022),(237,'DC United',2023),(237,'DC United',2024),(238,'DC United',2022),(238,'DC United',2023),(238,'DC United',2024),(239,'DC United',2022),(239,'DC United',2023),(239,'DC United',2024),(240,'DC United',2022),(240,'DC United',2023),(240,'DC United',2024),(241,'DC United',2022),(241,'DC United',2023),(241,'DC United',2024),(242,'DC United',2022),(242,'DC United',2023),(242,'DC United',2024),(210,'Espanyol',2022),(210,'Espanyol',2023),(210,'Espanyol',2024),(211,'Espanyol',2022),(211,'Espanyol',2023),(211,'Espanyol',2024),(212,'Espanyol',2022),(212,'Espanyol',2023),(212,'Espanyol',2024),(213,'Espanyol',2022),(213,'Espanyol',2023),(213,'Espanyol',2024),(214,'Espanyol',2022),(214,'Espanyol',2023),(214,'Espanyol',2024),(215,'Espanyol',2022),(215,'Espanyol',2023),(215,'Espanyol',2024),(216,'Espanyol',2022),(216,'Espanyol',2023),(216,'Espanyol',2024),(217,'Espanyol',2022),(217,'Espanyol',2023),(217,'Espanyol',2024),(218,'Espanyol',2022),(218,'Espanyol',2023),(218,'Espanyol',2024),(219,'Espanyol',2022),(219,'Espanyol',2023),(219,'Espanyol',2024),(220,'Espanyol',2022),(220,'Espanyol',2023),(220,'Espanyol',2024),(67,'Fulham',2022),(67,'Fulham',2023),(67,'Fulham',2024),(68,'Fulham',2022),(68,'Fulham',2023),(68,'Fulham',2024),(69,'Fulham',2022),(69,'Fulham',2023),(69,'Fulham',2024),(70,'Fulham',2022),(70,'Fulham',2023),(70,'Fulham',2024),(71,'Fulham',2022),(71,'Fulham',2023),(71,'Fulham',2024),(72,'Fulham',2022),(72,'Fulham',2023),(72,'Fulham',2024),(73,'Fulham',2022),(73,'Fulham',2023),(73,'Fulham',2024),(74,'Fulham',2022),(74,'Fulham',2023),(74,'Fulham',2024),(75,'Fulham',2022),(75,'Fulham',2023),(75,'Fulham',2024),(76,'Fulham',2022),(76,'Fulham',2023),(76,'Fulham',2024),(77,'Fulham',2022),(77,'Fulham',2023),(77,'Fulham',2024),(320,'Inter Miami',2022),(320,'Inter Miami',2023),(320,'Inter Miami',2024),(321,'Inter Miami',2022),(321,'Inter Miami',2023),(321,'Inter Miami',2024),(322,'Inter Miami',2022),(322,'Inter Miami',2023),(322,'Inter Miami',2024),(323,'Inter Miami',2022),(323,'Inter Miami',2023),(323,'Inter Miami',2024),(324,'Inter Miami',2022),(324,'Inter Miami',2023),(324,'Inter Miami',2024),(325,'Inter Miami',2022),(325,'Inter Miami',2023),(325,'Inter Miami',2024),(326,'Inter Miami',2022),(326,'Inter Miami',2023),(326,'Inter Miami',2024),(327,'Inter Miami',2022),(327,'Inter Miami',2023),(327,'Inter Miami',2024),(328,'Inter Miami',2022),(328,'Inter Miami',2023),(328,'Inter Miami',2024),(329,'Inter Miami',2022),(329,'Inter Miami',2023),(329,'Inter Miami',2024),(330,'Inter Miami',2022),(330,'Inter Miami',2023),(330,'Inter Miami',2024),(221,'LA Galaxy',2022),(221,'LA Galaxy',2023),(221,'LA Galaxy',2024),(222,'LA Galaxy',2022),(222,'LA Galaxy',2023),(222,'LA Galaxy',2024),(223,'LA Galaxy',2022),(223,'LA Galaxy',2023),(223,'LA Galaxy',2024),(224,'LA Galaxy',2022),(224,'LA Galaxy',2023),(224,'LA Galaxy',2024),(225,'LA Galaxy',2022),(225,'LA Galaxy',2023),(225,'LA Galaxy',2024),(226,'LA Galaxy',2022),(226,'LA Galaxy',2023),(226,'LA Galaxy',2024),(227,'LA Galaxy',2022),(227,'LA Galaxy',2023),(227,'LA Galaxy',2024),(228,'LA Galaxy',2022),(228,'LA Galaxy',2023),(228,'LA Galaxy',2024),(229,'LA Galaxy',2022),(229,'LA Galaxy',2023),(229,'LA Galaxy',2024),(230,'LA Galaxy',2022),(230,'LA Galaxy',2023),(230,'LA Galaxy',2024),(231,'LA Galaxy',2022),(231,'LA Galaxy',2023),(231,'LA Galaxy',2024),(89,'Liverpool',2022),(89,'Liverpool',2023),(89,'Liverpool',2024),(90,'Liverpool',2022),(90,'Liverpool',2023),(90,'Liverpool',2024),(91,'Liverpool',2022),(91,'Liverpool',2023),(91,'Liverpool',2024),(92,'Liverpool',2022),(92,'Liverpool',2023),(92,'Liverpool',2024),(93,'Liverpool',2022),(93,'Liverpool',2023),(93,'Liverpool',2024),(94,'Liverpool',2022),(94,'Liverpool',2023),(94,'Liverpool',2024),(95,'Liverpool',2022),(95,'Liverpool',2023),(95,'Liverpool',2024),(96,'Liverpool',2022),(96,'Liverpool',2023),(96,'Liverpool',2024),(97,'Liverpool',2022),(97,'Liverpool',2023),(97,'Liverpool',2024),(98,'Liverpool',2022),(98,'Liverpool',2023),(98,'Liverpool',2024),(99,'Liverpool',2022),(99,'Liverpool',2023),(99,'Liverpool',2024),(1,'Manchester City',2022),(1,'Manchester City',2023),(1,'Manchester City',2024),(2,'Manchester City',2022),(2,'Manchester City',2023),(2,'Manchester City',2024),(3,'Manchester City',2022),(3,'Manchester City',2023),(3,'Manchester City',2024),(4,'Manchester City',2022),(4,'Manchester City',2023),(4,'Manchester City',2024),(5,'Manchester City',2022),(5,'Manchester City',2023),(5,'Manchester City',2024),(6,'Manchester City',2022),(6,'Manchester City',2023),(6,'Manchester City',2024),(7,'Manchester City',2022),(7,'Manchester City',2023),(7,'Manchester City',2024),(8,'Manchester City',2022),(8,'Manchester City',2023),(8,'Manchester City',2024),(9,'Manchester City',2022),(9,'Manchester City',2023),(9,'Manchester City',2024),(10,'Manchester City',2022),(10,'Manchester City',2023),(10,'Manchester City',2024),(11,'Manchester City',2022),(11,'Manchester City',2023),(11,'Manchester City',2024),(23,'Manchester United',2022),(23,'Manchester United',2023),(23,'Manchester United',2024),(24,'Manchester United',2022),(24,'Manchester United',2023),(24,'Manchester United',2024),(25,'Manchester United',2022),(25,'Manchester United',2023),(25,'Manchester United',2024),(26,'Manchester United',2022),(26,'Manchester United',2023),(26,'Manchester United',2024),(27,'Manchester United',2022),(27,'Manchester United',2023),(27,'Manchester United',2024),(28,'Manchester United',2022),(28,'Manchester United',2023),(28,'Manchester United',2024),(29,'Manchester United',2022),(29,'Manchester United',2023),(29,'Manchester United',2024),(30,'Manchester United',2022),(30,'Manchester United',2023),(30,'Manchester United',2024),(31,'Manchester United',2022),(31,'Manchester United',2023),(31,'Manchester United',2024),(32,'Manchester United',2022),(32,'Manchester United',2023),(32,'Manchester United',2024),(33,'Manchester United',2022),(33,'Manchester United',2023),(33,'Manchester United',2024),(243,'New York Red Bulls',2022),(243,'New York Red Bulls',2023),(243,'New York Red Bulls',2024),(244,'New York Red Bulls',2022),(244,'New York Red Bulls',2023),(244,'New York Red Bulls',2024),(245,'New York Red Bulls',2022),(245,'New York Red Bulls',2023),(245,'New York Red Bulls',2024),(246,'New York Red Bulls',2022),(246,'New York Red Bulls',2023),(246,'New York Red Bulls',2024),(247,'New York Red Bulls',2022),(247,'New York Red Bulls',2023),(247,'New York Red Bulls',2024),(248,'New York Red Bulls',2022),(248,'New York Red Bulls',2023),(248,'New York Red Bulls',2024),(249,'New York Red Bulls',2022),(249,'New York Red Bulls',2023),(249,'New York Red Bulls',2024),(250,'New York Red Bulls',2022),(250,'New York Red Bulls',2023),(250,'New York Red Bulls',2024),(251,'New York Red Bulls',2022),(251,'New York Red Bulls',2023),(251,'New York Red Bulls',2024),(252,'New York Red Bulls',2022),(252,'New York Red Bulls',2023),(252,'New York Red Bulls',2024),(253,'New York Red Bulls',2022),(253,'New York Red Bulls',2023),(253,'New York Red Bulls',2024),(56,'Newcastle United',2022),(56,'Newcastle United',2023),(56,'Newcastle United',2024),(57,'Newcastle United',2022),(57,'Newcastle United',2023),(57,'Newcastle United',2024),(58,'Newcastle United',2022),(58,'Newcastle United',2023),(58,'Newcastle United',2024),(59,'Newcastle United',2022),(59,'Newcastle United',2023),(59,'Newcastle United',2024),(60,'Newcastle United',2022),(60,'Newcastle United',2023),(60,'Newcastle United',2024),(61,'Newcastle United',2022),(61,'Newcastle United',2023),(61,'Newcastle United',2024),(62,'Newcastle United',2022),(62,'Newcastle United',2023),(62,'Newcastle United',2024),(63,'Newcastle United',2022),(63,'Newcastle United',2023),(63,'Newcastle United',2024),(64,'Newcastle United',2022),(64,'Newcastle United',2023),(64,'Newcastle United',2024),(65,'Newcastle United',2022),(65,'Newcastle United',2023),(65,'Newcastle United',2024),(66,'Newcastle United',2022),(66,'Newcastle United',2023),(66,'Newcastle United',2024),(287,'Orlando City',2022),(287,'Orlando City',2023),(287,'Orlando City',2024),(288,'Orlando City',2022),(288,'Orlando City',2023),(288,'Orlando City',2024),(289,'Orlando City',2022),(289,'Orlando City',2023),(289,'Orlando City',2024),(290,'Orlando City',2022),(290,'Orlando City',2023),(290,'Orlando City',2024),(291,'Orlando City',2022),(291,'Orlando City',2023),(291,'Orlando City',2024),(292,'Orlando City',2022),(292,'Orlando City',2023),(292,'Orlando City',2024),(293,'Orlando City',2022),(293,'Orlando City',2023),(293,'Orlando City',2024),(294,'Orlando City',2022),(294,'Orlando City',2023),(294,'Orlando City',2024),(295,'Orlando City',2022),(295,'Orlando City',2023),(295,'Orlando City',2024),(296,'Orlando City',2022),(296,'Orlando City',2023),(296,'Orlando City',2024),(297,'Orlando City',2022),(297,'Orlando City',2023),(297,'Orlando City',2024),(265,'Portland Timbers',2022),(265,'Portland Timbers',2023),(265,'Portland Timbers',2024),(266,'Portland Timbers',2022),(266,'Portland Timbers',2023),(266,'Portland Timbers',2024),(267,'Portland Timbers',2022),(267,'Portland Timbers',2023),(267,'Portland Timbers',2024),(268,'Portland Timbers',2022),(268,'Portland Timbers',2023),(268,'Portland Timbers',2024),(269,'Portland Timbers',2022),(269,'Portland Timbers',2023),(269,'Portland Timbers',2024),(270,'Portland Timbers',2022),(270,'Portland Timbers',2023),(270,'Portland Timbers',2024),(271,'Portland Timbers',2022),(271,'Portland Timbers',2023),(271,'Portland Timbers',2024),(272,'Portland Timbers',2022),(272,'Portland Timbers',2023),(272,'Portland Timbers',2024),(273,'Portland Timbers',2022),(273,'Portland Timbers',2023),(273,'Portland Timbers',2024),(274,'Portland Timbers',2022),(274,'Portland Timbers',2023),(274,'Portland Timbers',2024),(275,'Portland Timbers',2022),(275,'Portland Timbers',2023),(275,'Portland Timbers',2024),(155,'Real Betis',2022),(155,'Real Betis',2023),(155,'Real Betis',2024),(156,'Real Betis',2022),(156,'Real Betis',2023),(156,'Real Betis',2024),(157,'Real Betis',2022),(157,'Real Betis',2023),(157,'Real Betis',2024),(158,'Real Betis',2022),(158,'Real Betis',2023),(158,'Real Betis',2024),(159,'Real Betis',2022),(159,'Real Betis',2023),(159,'Real Betis',2024),(160,'Real Betis',2022),(160,'Real Betis',2023),(160,'Real Betis',2024),(161,'Real Betis',2022),(161,'Real Betis',2023),(161,'Real Betis',2024),(162,'Real Betis',2022),(162,'Real Betis',2023),(162,'Real Betis',2024),(163,'Real Betis',2022),(163,'Real Betis',2023),(163,'Real Betis',2024),(164,'Real Betis',2022),(164,'Real Betis',2023),(164,'Real Betis',2024),(165,'Real Betis',2022),(165,'Real Betis',2023),(165,'Real Betis',2024),(111,'Real Madrid',2022),(111,'Real Madrid',2023),(111,'Real Madrid',2024),(112,'Real Madrid',2022),(112,'Real Madrid',2023),(112,'Real Madrid',2024),(113,'Real Madrid',2022),(113,'Real Madrid',2023),(113,'Real Madrid',2024),(114,'Real Madrid',2022),(114,'Real Madrid',2023),(114,'Real Madrid',2024),(115,'Real Madrid',2022),(115,'Real Madrid',2023),(115,'Real Madrid',2024),(116,'Real Madrid',2022),(116,'Real Madrid',2023),(116,'Real Madrid',2024),(117,'Real Madrid',2022),(117,'Real Madrid',2023),(117,'Real Madrid',2024),(118,'Real Madrid',2022),(118,'Real Madrid',2023),(118,'Real Madrid',2024),(119,'Real Madrid',2022),(119,'Real Madrid',2023),(119,'Real Madrid',2024),(120,'Real Madrid',2022),(120,'Real Madrid',2023),(120,'Real Madrid',2024),(121,'Real Madrid',2022),(121,'Real Madrid',2023),(121,'Real Madrid',2024),(166,'Real Sociedad',2022),(166,'Real Sociedad',2023),(166,'Real Sociedad',2024),(167,'Real Sociedad',2022),(167,'Real Sociedad',2023),(167,'Real Sociedad',2024),(168,'Real Sociedad',2022),(168,'Real Sociedad',2023),(168,'Real Sociedad',2024),(169,'Real Sociedad',2022),(169,'Real Sociedad',2023),(169,'Real Sociedad',2024),(170,'Real Sociedad',2022),(170,'Real Sociedad',2023),(170,'Real Sociedad',2024),(171,'Real Sociedad',2022),(171,'Real Sociedad',2023),(171,'Real Sociedad',2024),(172,'Real Sociedad',2022),(172,'Real Sociedad',2023),(172,'Real Sociedad',2024),(173,'Real Sociedad',2022),(173,'Real Sociedad',2023),(173,'Real Sociedad',2024),(174,'Real Sociedad',2022),(174,'Real Sociedad',2023),(174,'Real Sociedad',2024),(175,'Real Sociedad',2022),(175,'Real Sociedad',2023),(175,'Real Sociedad',2024),(176,'Real Sociedad',2022),(176,'Real Sociedad',2023),(176,'Real Sociedad',2024),(254,'Seattle Sounders',2022),(254,'Seattle Sounders',2023),(254,'Seattle Sounders',2024),(255,'Seattle Sounders',2022),(255,'Seattle Sounders',2023),(255,'Seattle Sounders',2024),(256,'Seattle Sounders',2022),(256,'Seattle Sounders',2023),(256,'Seattle Sounders',2024),(257,'Seattle Sounders',2022),(257,'Seattle Sounders',2023),(257,'Seattle Sounders',2024),(258,'Seattle Sounders',2022),(258,'Seattle Sounders',2023),(258,'Seattle Sounders',2024),(259,'Seattle Sounders',2022),(259,'Seattle Sounders',2023),(259,'Seattle Sounders',2024),(260,'Seattle Sounders',2022),(260,'Seattle Sounders',2023),(260,'Seattle Sounders',2024),(261,'Seattle Sounders',2022),(261,'Seattle Sounders',2023),(261,'Seattle Sounders',2024),(262,'Seattle Sounders',2022),(262,'Seattle Sounders',2023),(262,'Seattle Sounders',2024),(263,'Seattle Sounders',2022),(263,'Seattle Sounders',2023),(263,'Seattle Sounders',2024),(264,'Seattle Sounders',2022),(264,'Seattle Sounders',2023),(264,'Seattle Sounders',2024),(144,'Sevilla',2022),(144,'Sevilla',2023),(144,'Sevilla',2024),(145,'Sevilla',2022),(145,'Sevilla',2023),(145,'Sevilla',2024),(146,'Sevilla',2022),(146,'Sevilla',2023),(146,'Sevilla',2024),(147,'Sevilla',2022),(147,'Sevilla',2023),(147,'Sevilla',2024),(148,'Sevilla',2022),(148,'Sevilla',2023),(148,'Sevilla',2024),(149,'Sevilla',2022),(149,'Sevilla',2023),(149,'Sevilla',2024),(150,'Sevilla',2022),(150,'Sevilla',2023),(150,'Sevilla',2024),(151,'Sevilla',2022),(151,'Sevilla',2023),(151,'Sevilla',2024),(152,'Sevilla',2022),(152,'Sevilla',2023),(152,'Sevilla',2024),(153,'Sevilla',2022),(153,'Sevilla',2023),(153,'Sevilla',2024),(154,'Sevilla',2022),(154,'Sevilla',2023),(154,'Sevilla',2024),(298,'Toronto',2022),(298,'Toronto',2023),(298,'Toronto',2024),(299,'Toronto',2022),(299,'Toronto',2023),(299,'Toronto',2024),(300,'Toronto',2022),(300,'Toronto',2023),(300,'Toronto',2024),(301,'Toronto',2022),(301,'Toronto',2023),(301,'Toronto',2024),(302,'Toronto',2022),(302,'Toronto',2023),(302,'Toronto',2024),(303,'Toronto',2022),(303,'Toronto',2023),(303,'Toronto',2024),(304,'Toronto',2022),(304,'Toronto',2023),(304,'Toronto',2024),(305,'Toronto',2022),(305,'Toronto',2023),(305,'Toronto',2024),(306,'Toronto',2022),(306,'Toronto',2023),(306,'Toronto',2024),(307,'Toronto',2022),(307,'Toronto',2023),(307,'Toronto',2024),(308,'Toronto',2022),(308,'Toronto',2023),(308,'Toronto',2024),(34,'Tottenham Hotspur',2022),(34,'Tottenham Hotspur',2023),(34,'Tottenham Hotspur',2024),(35,'Tottenham Hotspur',2022),(35,'Tottenham Hotspur',2023),(35,'Tottenham Hotspur',2024),(36,'Tottenham Hotspur',2022),(36,'Tottenham Hotspur',2023),(36,'Tottenham Hotspur',2024),(37,'Tottenham Hotspur',2022),(37,'Tottenham Hotspur',2023),(37,'Tottenham Hotspur',2024),(38,'Tottenham Hotspur',2022),(38,'Tottenham Hotspur',2023),(38,'Tottenham Hotspur',2024),(39,'Tottenham Hotspur',2022),(39,'Tottenham Hotspur',2023),(39,'Tottenham Hotspur',2024),(40,'Tottenham Hotspur',2022),(40,'Tottenham Hotspur',2023),(40,'Tottenham Hotspur',2024),(41,'Tottenham Hotspur',2022),(41,'Tottenham Hotspur',2023),(41,'Tottenham Hotspur',2024),(42,'Tottenham Hotspur',2022),(42,'Tottenham Hotspur',2023),(42,'Tottenham Hotspur',2024),(43,'Tottenham Hotspur',2022),(43,'Tottenham Hotspur',2023),(43,'Tottenham Hotspur',2024),(44,'Tottenham Hotspur',2022),(44,'Tottenham Hotspur',2023),(44,'Tottenham Hotspur',2024),(188,'Valencia',2022),(188,'Valencia',2023),(188,'Valencia',2024),(189,'Valencia',2022),(189,'Valencia',2023),(189,'Valencia',2024),(190,'Valencia',2022),(190,'Valencia',2023),(190,'Valencia',2024),(191,'Valencia',2022),(191,'Valencia',2023),(191,'Valencia',2024),(192,'Valencia',2022),(192,'Valencia',2023),(192,'Valencia',2024),(193,'Valencia',2022),(193,'Valencia',2023),(193,'Valencia',2024),(194,'Valencia',2022),(194,'Valencia',2023),(194,'Valencia',2024),(195,'Valencia',2022),(195,'Valencia',2023),(195,'Valencia',2024),(196,'Valencia',2022),(196,'Valencia',2023),(196,'Valencia',2024),(197,'Valencia',2022),(197,'Valencia',2023),(197,'Valencia',2024),(198,'Valencia',2022),(198,'Valencia',2023),(198,'Valencia',2024),(199,'Villarreal',2022),(199,'Villarreal',2023),(199,'Villarreal',2024),(200,'Villarreal',2022),(200,'Villarreal',2023),(200,'Villarreal',2024),(201,'Villarreal',2022),(201,'Villarreal',2023),(201,'Villarreal',2024),(202,'Villarreal',2022),(202,'Villarreal',2023),(202,'Villarreal',2024),(203,'Villarreal',2022),(203,'Villarreal',2023),(203,'Villarreal',2024),(204,'Villarreal',2022),(204,'Villarreal',2023),(204,'Villarreal',2024),(205,'Villarreal',2022),(205,'Villarreal',2023),(205,'Villarreal',2024),(206,'Villarreal',2022),(206,'Villarreal',2023),(206,'Villarreal',2024),(207,'Villarreal',2022),(207,'Villarreal',2023),(207,'Villarreal',2024),(208,'Villarreal',2022),(208,'Villarreal',2023),(208,'Villarreal',2024),(209,'Villarreal',2022),(209,'Villarreal',2023),(209,'Villarreal',2024);
/*!40000 ALTER TABLE `player_team` ENABLE KEYS */;
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
  `industry` varchar(128) NOT NULL DEFAULT 'Other',
  `website_url` varchar(128) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES ('Adidas','Germany','Sportswear','https://www.adidas.com'),('Barclays','England','Banking','https://www.barclays.co.uk'),('Coca-Cola','USA','Beverage','https://www.coca-cola.com'),('Emirates','UAE','Airline','https://www.emirates.com'),('Nike','USA','Sports','https://nike.com'),('Rakuten','Japan','E-commerce','https://www.rakuten.com'),('Santander','Spain','Banking','https://www.santander.com');
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
  `sponsorship_amount` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`sponsor_name`,`league_name`),
  KEY `league_name` (`league_name`),
  CONSTRAINT `sponsor_league_ibfk_1` FOREIGN KEY (`sponsor_name`) REFERENCES `sponsor` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sponsor_league_ibfk_2` FOREIGN KEY (`league_name`) REFERENCES `league` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_league`
--

LOCK TABLES `sponsor_league` WRITE;
/*!40000 ALTER TABLE `sponsor_league` DISABLE KEYS */;
INSERT INTO `sponsor_league` VALUES ('Adidas','Major League Soccer',25000000),('Adidas','Premier League',25000000),('Barclays','Premier League',50000000),('Coca-Cola','Major League Soccer',15000000),('Emirates','Premier League',40000000),('Nike','La Liga',10000000),('Nike','Major League Soccer',4000000),('Nike','Premier League',13000000),('Rakuten','La Liga',30000000),('Santander','La Liga',45000000);
/*!40000 ALTER TABLE `sponsor_league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `name` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `capacity` int NOT NULL DEFAULT '0',
  `team_name` varchar(128) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `city` (`city`,`zip_code`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES ('Anfield','Liverpool','L4 0TH',54074,'Liverpool'),('Anoeta','San Sebastian','20014',39800,'Real Sociedad'),('Audi Field','Washington D.C.','20024',20000,'DC United'),('Benito Villamarin','Seville','41012',60721,'Real Betis'),('BMO Field','Toronto','M6K 3C3',30000,'Toronto'),('Brentford Community Stadium','London','TW8 0NT',17250,'Brentford'),('Camp Nou','Barcelona','08028',99354,'Barcelona'),('Craven Cottage','London','SW6 6HH',25700,'Fulham'),('Dignity Health Sports Park','Carson','90746',27000,'LA Galaxy'),('DRV PNK Stadium','Fort Lauderdale','33309',19500,'Inter Miami'),('Emirates Stadium','London','N5 1BU',60260,'Arsenal'),('Estadio de la Ceramica','Villarreal','12540',23500,'Villarreal'),('Etihad Stadium','Manchester','M11 3FF',53600,'Manchester City'),('Exploria Stadium','Orlando','32805',25500,'Orlando City'),('London Stadium','London','E20 2ST',60000,'Tottenham Hotspur'),('Lumen Field','Seattle','98134',72000,'Seattle Sounders'),('Mercedes-Benz Stadium','Atlanta','30313',71000,'Atlanta United'),('Mestalla','Valencia','46010',49865,'Valencia'),('Old Trafford','Manchester','M16 0RA',74879,'Manchester United'),('Providence Park','Portland','97205',25218,'Portland Timbers'),('Ramon Sanchez Pizjuan','Seville','41005',43883,'Sevilla'),('RCDE Stadium','Barcelona','08940',40500,'Espanyol'),('Red Bull Arena','Harrison','07029',25000,'New York Red Bulls'),('San Mamés','Bilbao','48013',53289,'Athletic Club'),('Santiago Bernabéu','Madrid','28036',81044,'Real Madrid'),('Soldier Field','Chicago','60605',61500,'Chicago Fire'),('St James Park','Newcastle upon Tyne','NE1 4ST',52305,'Newcastle United'),('Stamford Bridge','London','SW6 1HS',40742,'Chelsea'),('Villa Park','Birmingham','B6 6HE',42682,'Aston Villa');
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
INSERT INTO `team` VALUES ('Arsenal',1886),('Aston Villa',1874),('Athletic Club',1898),('Atlanta United',2014),('Barcelona',1899),('Brentford',1889),('Chelsea',1905),('Chicago Fire',1997),('DC United',1994),('Espanyol',1900),('Fulham',1879),('Inter Miami',2018),('LA Galaxy',1994),('Liverpool',1892),('Manchester City',1880),('Manchester United',1878),('New York Red Bulls',1994),('Newcastle United',1892),('Orlando City',2013),('Portland Timbers',2009),('Real Betis',1907),('Real Madrid',1902),('Real Sociedad',1909),('Seattle Sounders',2007),('Sevilla',1890),('Toronto',2005),('Tottenham Hotspur',1882),('Valencia',1919),('Villarreal',1923);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'football_tracker'
--

--
-- Dumping routines for database 'football_tracker'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_sponsor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sponsor`(
    IN in_sponsor_name VARCHAR(128),
    IN in_sponsor_country VARCHAR(128),
    IN in_sponsor_website VARCHAR(128),
    IN in_sponsor_industry VARCHAR(128)
)
BEGIN
    -- Check if mandatory fields are NULL
    IF in_sponsor_name IS NULL OR in_sponsor_country IS NULL OR in_sponsor_website IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sponsor name, country, and industry cannot be NULL';
    ELSE
        -- Insert sponsor details into the sponsor table
        INSERT INTO sponsor (name, country, industry, website_url)
        VALUES (in_sponsor_name, in_sponsor_country, in_sponsor_industry, in_sponsor_website);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_sponsor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_sponsor`(
    IN in_sponsor_name VARCHAR(128)
)
BEGIN
    -- Delete the sponsor
    DELETE FROM sponsor
    WHERE sponsor.name = in_sponsor_name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_team`(
    IN in_team_name VARCHAR(128)
)
BEGIN

    DELETE FROM team
    WHERE name = in_team_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_team_and_recalculate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_team_and_recalculate`(
    IN in_team_name VARCHAR(128)
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_team_1_name VARCHAR(128);
    DECLARE v_team_2_name VARCHAR(128);
    DECLARE v_match_date DATE;

    DECLARE cur CURSOR FOR
        SELECT team_1_name, team_2_name, match_date
        FROM game
        WHERE team_1_name = in_team_name OR team_2_name = in_team_name;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    loop_fetch: LOOP
        FETCH cur INTO v_team_1_name, v_team_2_name, v_match_date;
        IF done THEN
            LEAVE loop_fetch;
        END IF;

        -- Identify the other team
        SET @other_team = IF(v_team_1_name = in_team_name, v_team_2_name, v_team_1_name);

        SET @season = YEAR(v_match_date);

        -- Calculate the goals scored by each team in this match
        SELECT
            COALESCE(SUM(CASE WHEN pt.team_name = v_team_1_name THEN ps.goals_scored END), 0),
            COALESCE(SUM(CASE WHEN pt.team_name = v_team_2_name THEN ps.goals_scored END), 0)
        INTO @team_1_goals, @team_2_goals
        FROM player_stat ps
                 JOIN player_team pt ON ps.player_id = pt.player_id
        WHERE pt.season = @season
          AND ps.team_1_name = v_team_1_name
          AND ps.team_2_name = v_team_2_name
          AND ps.match_date = v_match_date;

        -- Determine which team is the "other_team" and get their goals and conceded
        IF @other_team = v_team_1_name THEN
            SET @other_team_goals = @team_1_goals;
            SET @other_team_conceded = @team_2_goals;
        ELSE
            SET @other_team_goals = @team_2_goals;
            SET @other_team_conceded = @team_1_goals;
        END IF;

        -- Determine if the other_team had a win, loss, or draw
        IF @other_team_goals > @other_team_conceded THEN
            SET @other_team_win_increment = 1;
            SET @other_team_loss_increment = 0;
        ELSEIF @other_team_goals < @other_team_conceded THEN
            SET @other_team_win_increment = 0;
            SET @other_team_loss_increment = 1;
        ELSE
            -- Draw
            SET @other_team_win_increment = 0;
            SET @other_team_loss_increment = 0;
        END IF;

        -- Revert increments in league_team for the other_team
        UPDATE league_team
        SET matches_played = matches_played - 1,
            wins = wins - @other_team_win_increment,
            losses = losses - @other_team_loss_increment,
            goals_scored = goals_scored - @other_team_goals,
            goals_conceded = goals_conceded - @other_team_conceded
        WHERE team_name = @other_team
          AND season = @season;

        -- Delete all player stats for this match
        DELETE FROM player_stat
        WHERE team_1_name = v_team_1_name
          AND team_2_name = v_team_2_name
          AND match_date = v_match_date;

        -- Delete the game record
        DELETE FROM game
        WHERE team_1_name = v_team_1_name
          AND team_2_name = v_team_2_name
          AND match_date = v_match_date;

    END LOOP loop_fetch;
    CLOSE cur;

    -- Now remove all references to the deleted team
    DELETE FROM league_team WHERE team_name = in_team_name;
    DELETE FROM stadium WHERE team_name = in_team_name;
    DELETE FROM manager WHERE team_name = in_team_name;
    DELETE FROM player_team WHERE team_name = in_team_name;

    -- Finally, remove the team
    DELETE FROM team WHERE name = in_team_name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_filtered_sponsors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_filtered_sponsors`(
    IN league_names_list VARCHAR(1000)
)
BEGIN
    IF league_names_list = '' THEN
        -- Return all sponsors if the input list is empty
        SELECT sponsor.*
        FROM sponsor
        GROUP BY sponsor.name;
    ELSE
        -- Return sponsors filtered by league names
        SELECT sponsor.*
        FROM sponsor
                 JOIN sponsor_league ON sponsor.name = sponsor_league.sponsor_name
        WHERE FIND_IN_SET(League_name, league_names_list)
        GROUP BY sponsor.name;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_leagues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_leagues`()
BEGIN
    SELECT
        l.name, l.country
    FROM
        league l;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_stadiums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_stadiums`(
)
BEGIN
    SELECT
        *
    FROM
        stadium;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_filtered_games` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_filtered_games`(
    IN team_name VARCHAR(128)
)
BEGIN
    -- If no team_name is provided, return all games
    IF team_name = '' THEN
        SELECT g.*
        FROM game g;

        -- Otherwise, filter games where the team is involved
    ELSE
        SELECT g.*
        FROM game g
        WHERE g.team_1_name = team_name OR g.team_2_name = team_name;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_latest_season_by_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_latest_season_by_team`(
    IN in_team_name VARCHAR(255)
)
BEGIN
    DECLARE v_league_name VARCHAR(255);
    DECLARE v_season INT;

    -- Check 2024 season first
    SELECT league_name, season INTO v_league_name, v_season
    FROM league_team
    WHERE team_name = in_team_name AND season = 2024
    LIMIT 1;

    -- If no league found for 2024, check 2023
    IF v_league_name IS NULL THEN
        SELECT league_name, season INTO v_league_name, v_season
        FROM league_team
        WHERE team_name = in_team_name AND season = 2023
        LIMIT 1;
    END IF;

    -- If no league found for 2023, check 2022
    IF v_league_name IS NULL THEN
        SELECT league_name, season INTO v_league_name, v_season
        FROM league_team
        WHERE team_name = in_team_name AND season = 2022
        LIMIT 1;
    END IF;

    -- Return the found league name and season
    SELECT v_league_name AS league_name, v_season AS season;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_latest_team_by_player_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_latest_team_by_player_id`(
    IN in_player_id INT
)
BEGIN
    DECLARE v_team_name VARCHAR(128);
    DECLARE v_season INT;

    -- Check 2024 season first
    SELECT team_name, season INTO v_team_name, v_season
    FROM player_team
    WHERE player_id = in_player_id AND season = 2024
    LIMIT 1;

    -- If no team found for 2024, check 2023
    IF v_team_name IS NULL THEN
        SELECT team_name, season INTO v_team_name, v_season
        FROM player_team
        WHERE player_id = in_player_id AND season = 2023
        LIMIT 1;
    END IF;

    -- If no team found for 2023, check 2022
    IF v_team_name IS NULL THEN
        SELECT team_name, season INTO v_team_name, v_season
        FROM player_team
        WHERE player_id = in_player_id AND season = 2022
        LIMIT 1;
    END IF;

    -- Return the found team name and season
    SELECT v_team_name AS team_name, v_season AS season;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_league_table`(
    IN in_league_name VARCHAR(128),
    IN in_season INT,
    IN sortColumn VARCHAR(128),
    IN sortOrder VARCHAR(4)
)
BEGIN
    -- Set default values for sortColumn and sortOrder if they are NULL or empty
    IF sortColumn IS NULL OR sortColumn = '' THEN
        SET sortColumn = 'points';
    END IF;

    IF sortOrder IS NULL OR sortOrder = '' THEN
        SET sortOrder = 'DESC';
    END IF;

    -- Validate sortColumn and sortOrder
    IF sortColumn NOT IN ('matches_played', 'points', 'goal_difference', 'team_name', 'wins', 'losses', 'goals_scored', 'goals_conceded', 'draws') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid sortColumn';
    END IF;

    IF sortOrder NOT IN ('ASC', 'DESC') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid sortOrder';
    END IF;

    -- Build dynamic query
    SET @sql_query = CONCAT(
            'SELECT ',
            'league_name, team_name, season, matches_played, wins, losses, goals_scored, goals_conceded, ',
            '(wins * 3 + losses * 0 + (matches_played - wins - losses) * 1) AS points, ',
            '(goals_scored - goals_conceded) AS goal_difference, ',
            '(matches_played - wins - losses) AS draws ',
            'FROM league_team ',
            'WHERE league_name = "', in_league_name, '" ',
            'AND season = ', in_season, ' ',
                'ORDER BY ', sortColumn, ' ', sortOrder
                     );

    -- Prepare and execute the dynamic SQL
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_teams_for_season` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_league_teams_for_season`(
    IN input_league_name VARCHAR(128),
    IN input_season_year INT
)
BEGIN
    SELECT
        *
    FROM
        team t
            INNER JOIN
        league_team lt ON t.name = lt.team_name
    WHERE
        lt.league_name = input_league_name AND
        lt.season = input_season_year;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_top_stat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_league_top_stat`(
    IN in_league_name VARCHAR(126),
    IN in_season INT,
    IN stat_name VARCHAR(50)
)
BEGIN
    SET @stat_query = CONCAT(
            'SELECT ',
            '    ps.player_id, ',
            '    p.first_name, ',
            '    p.last_name, ',
            '    p.position_abb, ',
            '    pt.team_name, ',
            '    SUM(ps.', stat_name, ') AS total_stat ',
            'FROM ',
            '    player_stat ps ',
            'JOIN ',
            '    player p ON ps.player_id = p.player_id ',
            'JOIN ',
            '    player_team pt ON ps.player_id = pt.player_id ',
            'JOIN ',
            '    league_team lt ON lt.team_name = pt.team_name ',
            'WHERE ',
            '    YEAR(ps.match_date) = ', in_season, ' ',
            '    AND pt.season = ', in_season, ' ',
            '    AND lt.season = ', in_season, ' ',
            '    AND lt.league_name = "', in_league_name, '" ',
            'GROUP BY ',
            '    ps.player_id, ',
            '    p.first_name, ',
            '    p.last_name, ',
            '    p.position_abb, ',
            '    pt.team_name ',
            'ORDER BY ',
            '    total_stat DESC ',
            'LIMIT 5'
                      );

    PREPARE stmt FROM @stat_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_player_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_player_by_id`(
    IN in_player_id INT
)
BEGIN
    SELECT *
    FROM player
    WHERE player_id = in_player_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_player_stats_for_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_player_stats_for_game`(
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_match_date DATE
)
BEGIN
   SELECT
       *
    FROM
        player_stat
    WHERE
        team_1_name = in_team_1_name
    AND
        team_2_name = in_team_2_name
    AND
        match_date = in_match_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sponsor_league_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sponsor_league_details`(
    IN in_sponsor_name VARCHAR(128)
)
BEGIN
    SELECT
        *
    FROM
        sponsor_league
    WHERE
        sponsor_name = in_sponsor_name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sponsor_league_details_for_league` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sponsor_league_details_for_league`(
    IN in_league_name VARCHAR(128)
)
BEGIN
    SELECT
        *
    FROM
        sponsor_league
    WHERE
        league_name = in_league_name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_stadiums_by_teams_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stadiums_by_teams_list`(
    IN team_names_list VARCHAR(1000)
)
BEGIN
    SELECT
        *
    FROM
        stadium
    WHERE
        FIND_IN_SET(Team_Name, team_names_list);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_details`(
    IN in_team_name VARCHAR(128),
    IN in_season INT
)
BEGIN
    IF in_season IS NULL OR in_season = '' THEN
        SET in_season = 2024;
    END IF;

    SELECT
        m.*,
        lt.league_name,
        s.name as stadium_name,
        SUM(p.market_value) AS total_team_value
    FROM manager m
            LEFT JOIN player_team pt ON m.team_name = pt.team_name
            LEFT JOIN player p ON pt.player_id = p.player_id
            LEFT JOIN league_team lt ON lt.team_name = m.team_name
            LEFT JOIN stadium s ON s.team_name = m.team_name
    WHERE m.team_name = in_team_name
      AND (pt.season = in_season OR pt.season IS NULL)
    GROUP BY m.manager_id, lt.league_name, s.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_games` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_games`(
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_season INT
)
BEGIN
    SELECT
        *
    FROM
        game g
    WHERE
        g.team_1_name IN (in_team_1_name, in_team_2_name)
    AND
        g.team_2_name IN (in_team_1_name, in_team_2_name)
    AND
        YEAR(g.match_date) = in_season;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_players_for_season` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_players_for_season`(
    IN input_team_name VARCHAR(128),
    IN input_season_year INT
)
BEGIN
    SELECT
        *
    FROM
        player p
            INNER JOIN
        player_team pt ON p.player_id = pt.player_id
    WHERE
        pt.team_name = input_team_name AND
        pt.season = input_season_year;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_game`(
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_stadium_name VARCHAR(128),
    IN in_match_date DATE,
    IN in_attendance INT
)
BEGIN
    DECLARE stadium_capacity INT;
    DECLARE game_exists INT;

    IF in_team_1_name = in_team_2_name THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A team cannot play a game against itself.';
    END IF;

    -- Check if a game already exists for the given teams and date
    SELECT COUNT(*) INTO game_exists
    FROM game
    WHERE team_1_name = in_team_2_name
      AND team_2_name = in_team_1_name
      AND match_date = in_match_date;

    -- If the game already exists, raise an error
    IF game_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A game already exists for this date with the same teams.';
    END IF;

    -- Retrieve the capacity of the specified stadium
    SELECT capacity INTO stadium_capacity
    FROM stadium
    WHERE name = in_stadium_name;

    -- Check if the stadium exists and if attendance is valid
    IF stadium_capacity IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stadium not found.';
    ELSEIF in_attendance > stadium_capacity THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Attendance exceeds stadium capacity.';
    END IF;

    -- Insert the game record
    INSERT INTO game(team_1_name, team_2_name, stadium_name, match_date, attendance)
    VALUES (in_team_1_name, in_team_2_name, in_stadium_name, in_match_date, in_attendance);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_league_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_league_team`(
    IN p_league_name VARCHAR(128),
    IN p_team_name VARCHAR(128),
    IN p_season INT
)
BEGIN
    INSERT INTO league_team (league_name, team_name, season)
    VALUES (p_league_name, p_team_name, p_season);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_manager`(
    IN p_first_name VARCHAR(128),
    IN p_last_name VARCHAR(128),
    IN p_dob DATE,
    IN p_nationality VARCHAR(128),
    IN p_team_name VARCHAR(128)
)
BEGIN
    INSERT INTO manager (first_name, last_name, dob, nationality, team_name)
    VALUES (p_first_name, p_last_name, p_dob, p_nationality, p_team_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_player`(
    IN p_first_name VARCHAR(128),
    IN p_last_name VARCHAR(128),
    IN p_dob DATE,
    IN p_nationality VARCHAR(128),
    IN p_market_value DECIMAL(15,2),
    IN p_jersey_number INT,
    IN p_position_abb VARCHAR(10)
)
BEGIN
    INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
    VALUES (p_first_name, p_last_name, p_dob, p_nationality, p_market_value, p_jersey_number, p_position_abb);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_player_stat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_player_stat`(
    IN in_player_id INT,
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_match_date DATE,
    IN in_goals_scored INT,
    IN in_yellow_card INT,
    IN in_red_card INT
)
BEGIN
    DECLARE game_exists INT;

    -- Check if a game already exists for the given teams and date
    SELECT COUNT(*) INTO game_exists
    FROM player_stat
    WHERE player_id = in_player_id
        AND team_1_name = in_team_1_name
        AND team_2_name = in_team_2_name
        AND match_date = in_match_date;

    -- If the game already exists, raise an error
    IF game_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A player stat already exists for this date with the same teams.';
    END IF;

    INSERT INTO player_stat(player_id,team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card)
    VALUES (in_player_id, in_team_1_name, in_team_2_name, in_match_date, in_goals_scored, in_yellow_card, in_red_card);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_player_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_player_team`(
    IN p_player_id INT,
    IN p_team_name VARCHAR(128),
    IN p_season INT
)
BEGIN
    INSERT INTO player_team (player_id, team_name, season)
    VALUES (p_player_id, p_team_name, p_season);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_stadium` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_stadium`(
    IN p_stadium_name VARCHAR(128),
    IN p_city VARCHAR(128),
    IN p_zip_code VARCHAR(20),
    IN p_capacity INT,
    IN p_team_name VARCHAR(128)
)
BEGIN
    INSERT INTO stadium (name, city, zip_code, capacity, team_name)
    VALUES (p_stadium_name, p_city, p_zip_code, p_capacity, p_team_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_team`(
    IN p_team_name VARCHAR(128),
    IN p_established_year INT
)
BEGIN
    INSERT INTO team (name, established_year)
    VALUES (p_team_name, p_established_year);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `player_stats_across_seasons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `player_stats_across_seasons`(
    IN in_player_id INT,
    IN in_seasons TEXT
)
BEGIN
    DROP TEMPORARY TABLE IF EXISTS season_list;
    -- Create a temporary table to store the list of seasons
    CREATE TEMPORARY TABLE season_list (season_year INT);

    -- Prepare the dynamic SQL to insert the seasons into the temporary table
    SET @sql = CONCAT(
            'INSERT INTO season_list (season_year) VALUES (',
            REPLACE(in_seasons, ',', '), ('),
            ')'
               );

    -- Execute the dynamic SQL
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Query stats for the specified seasons
    SELECT
        ps.player_id,
        sl.season_year AS season,
        COALESCE(SUM(ps.goals_scored), 0) AS total_goals,
        COALESCE(SUM(ps.yellow_card), 0) AS total_yellows,
        COALESCE(SUM(ps.red_card), 0) AS total_reds,
        pt.team_name,
        lt.league_name
    FROM
        season_list sl
    LEFT JOIN
        player_team pt ON pt.player_id = in_player_id AND pt.season = sl.season_year
    LEFT JOIN
        league_team lt ON lt.team_name = pt.team_name AND lt.season = sl.season_year
    LEFT JOIN
        player_stat ps ON ps.player_id = in_player_id AND YEAR(ps.match_date) = sl.season_year
    GROUP BY
        ps.player_id, sl.season_year, pt.team_name, lt.league_name;

    -- Drop the temporary table
    DROP TEMPORARY TABLE season_list;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_player`(
    in_player_name VARCHAR(128)
)
BEGIN
    SELECT *
    FROM player
    WHERE first_name LIKE CONCAT('%', in_player_name, '%')
       OR last_name LIKE CONCAT('%', in_player_name, '%')
    LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_team`(
    IN in_team_name VARCHAR(128)
)
BEGIN
    SELECT *
    FROM team
    WHERE team.name LIKE CONCAT('%', in_team_name, '%')
    LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_league_team_stats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_league_team_stats`(
    IN p_team_1_name VARCHAR(128),
    IN p_team_2_name VARCHAR(128),
    IN p_match_date DATE
)
BEGIN
    DECLARE team_1_goals INT DEFAULT 0;
    DECLARE team_2_goals INT DEFAULT 0;
    DECLARE calc_season INT;
    DECLARE var_league_name VARCHAR(128);

    -- Determine season
    SET calc_season = YEAR(p_match_date);


    -- Get league name (both teams share the same league)
    SELECT lt.league_name
    INTO var_league_name
    FROM league_team lt
    WHERE lt.team_name = p_team_1_name AND lt.season = calc_season;

    -- Calculate goals scored by both teams in a single query
    SELECT
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_1_name THEN ps.goals_scored END), 0) AS team_1_goals,
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_2_name THEN ps.goals_scored END), 0) AS team_2_goals
    INTO team_1_goals, team_2_goals
    FROM player_stat ps
             JOIN player_team pt ON ps.player_id = pt.player_id
    WHERE pt.season = calc_season
      AND ps.team_1_name = p_team_1_name
      AND ps.team_2_name = p_team_2_name
      AND ps.match_date = p_match_date;

    -- Update league_team stats for team_1
    UPDATE league_team
    SET
        matches_played = matches_played + 1,
        wins = wins + IF(team_1_goals > team_2_goals, 1, 0),
        losses = losses + IF(team_1_goals < team_2_goals, 1, 0),
        goals_scored = goals_scored + team_1_goals,
        goals_conceded = goals_conceded + team_2_goals
    WHERE
        team_name = p_team_1_name
      AND var_league_name = league_name
      AND season = calc_season;

    -- Update league_team stats for team_2
    UPDATE league_team
    SET
        matches_played = matches_played + 1,
        wins = wins + IF(team_2_goals > team_1_goals, 1, 0),
        losses = losses + IF(team_2_goals < team_1_goals, 1, 0),
        goals_scored = goals_scored + team_2_goals,
        goals_conceded = goals_conceded + team_1_goals
    WHERE
        team_name = p_team_2_name
      AND var_league_name = league_name
      AND season = calc_season;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_player_stats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_player_stats`(
    IN in_player_id INT,
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_match_date DATE,
    IN in_goals_scored INT,
    IN in_yellow_card INT,
    IN in_red_card INT
)
BEGIN
    DECLARE stat_exists INT;

    -- Check if a player stat exists for the given player, teams, and date
    SELECT COUNT(*) INTO stat_exists
    FROM player_stat
    WHERE player_id = in_player_id
      AND team_1_name = in_team_1_name
      AND team_2_name = in_team_2_name
      AND match_date = in_match_date;

    -- If the player stat exists, update it
    IF stat_exists > 0 THEN
        UPDATE player_stat
        SET
            goals_scored = in_goals_scored,
            yellow_card = in_yellow_card,
            red_card = in_red_card
        WHERE player_id = in_player_id
          AND team_1_name = in_team_1_name
          AND team_2_name = in_team_2_name
          AND match_date = in_match_date;
    ELSE
        -- If no existing stat, insert a new one
        INSERT INTO player_stat(player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card)
        VALUES (in_player_id, in_team_1_name, in_team_2_name, in_match_date, in_goals_scored, in_yellow_card, in_red_card);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_sponsor_league_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_sponsor_league_details`(
    IN in_sponsor_name VARCHAR(128),
    IN in_league_name VARCHAR(128),
    IN in_sponsorship_amount BIGINT
)
BEGIN
    -- Check if the row exists
    IF EXISTS (
        SELECT 1
        FROM sponsor_league
        WHERE sponsor_name = in_sponsor_name
          AND league_name = in_league_name
    ) THEN
        -- Update the sponsorship amount
        UPDATE sponsor_league
        SET sponsorship_amount = in_sponsorship_amount
        WHERE sponsor_name = in_sponsor_name
          AND league_name = in_league_name;
    ELSE
        -- Insert a new row
        INSERT INTO sponsor_league (sponsor_name, league_name, sponsorship_amount)
        VALUES (in_sponsor_name, in_league_name, in_sponsorship_amount);
    END IF;
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

-- Dump completed on 2024-12-30 20:19:43
