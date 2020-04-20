CREATE DATABASE  IF NOT EXISTS `nfa_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nfa_db`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: nfa_db
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `angler`
--

DROP TABLE IF EXISTS `angler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `angler` (
  `ANG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANG_FNAME` varchar(45) NOT NULL,
  `ANG_LNAME` varchar(45) NOT NULL,
  `ANG_DOB` date NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `SPONS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ANG_ID`),
  KEY `TEAM_ID_idx` (`TEAM_ID`),
  KEY `SPONS_ID_idx` (`SPONS_ID`),
  CONSTRAINT `SPONS_ANG_ID` FOREIGN KEY (`SPONS_ID`) REFERENCES `sponsor` (`SPONS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TEAM_ANG_ID` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`TEAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angler`
--

LOCK TABLES `angler` WRITE;
/*!40000 ALTER TABLE `angler` DISABLE KEYS */;
INSERT INTO `angler` VALUES (4,'Christian','deRuiter','1999-02-14',20,15),(5,'Dimitri','Lialios','1998-05-23',20,15),(6,'Yusuf','Khatri','1999-01-07',20,15),(7,'Andrew','Meesseman','1998-11-19',20,15),(8,'John','Smith','1845-02-27',21,NULL),(9,'Jane','Doe','1991-05-23',21,NULL),(10,'Caitlin','Mewski','1988-06-01',21,NULL),(11,'Christian','deRuiter','1999-02-14',22,NULL),(12,'Yusuf','Khatri','1998-05-23',22,NULL),(13,'Andrew','Meesseman','1999-01-07',22,NULL),(14,'Dimitri','Lialios','1998-11-19',22,NULL);
/*!40000 ALTER TABLE `angler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add post',1,'add_post'),(2,'Can change post',1,'change_post'),(3,'Can delete post',1,'delete_post'),(4,'Can view post',1,'view_post'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add angler',8,'add_angler'),(30,'Can change angler',8,'change_angler'),(31,'Can delete angler',8,'delete_angler'),(32,'Can view angler',8,'view_angler'),(33,'Can add django migrations',9,'add_djangomigrations'),(34,'Can change django migrations',9,'change_djangomigrations'),(35,'Can delete django migrations',9,'delete_djangomigrations'),(36,'Can view django migrations',9,'view_djangomigrations'),(37,'Can add django session',10,'add_djangosession'),(38,'Can change django session',10,'change_djangosession'),(39,'Can delete django session',10,'delete_djangosession'),(40,'Can view django session',10,'view_djangosession'),(41,'Can add fish',11,'add_fish'),(42,'Can change fish',11,'change_fish'),(43,'Can delete fish',11,'delete_fish'),(44,'Can view fish',11,'view_fish'),(45,'Can add location',12,'add_location'),(46,'Can change location',12,'change_location'),(47,'Can delete location',12,'delete_location'),(48,'Can view location',12,'view_location'),(49,'Can add official',13,'add_official'),(50,'Can change official',13,'change_official'),(51,'Can delete official',13,'delete_official'),(52,'Can view official',13,'view_official'),(53,'Can add sponsor',14,'add_sponsor'),(54,'Can change sponsor',14,'change_sponsor'),(55,'Can delete sponsor',14,'delete_sponsor'),(56,'Can view sponsor',14,'view_sponsor'),(57,'Can add team',15,'add_team'),(58,'Can change team',15,'change_team'),(59,'Can delete team',15,'delete_team'),(60,'Can view team',15,'view_team'),(61,'Can add trn official',16,'add_trnofficial'),(62,'Can change trn official',16,'change_trnofficial'),(63,'Can delete trn official',16,'delete_trnofficial'),(64,'Can view trn official',16,'view_trnofficial'),(65,'Can add caught fish',17,'add_caughtfish'),(66,'Can change caught fish',17,'change_caughtfish'),(67,'Can delete caught fish',17,'delete_caughtfish'),(68,'Can view caught fish',17,'view_caughtfish'),(69,'Can add registered team',18,'add_registeredteam'),(70,'Can change registered team',18,'change_registeredteam'),(71,'Can delete registered team',18,'delete_registeredteam'),(72,'Can view registered team',18,'view_registeredteam'),(73,'Can add tournament rule',19,'add_tournamentrule'),(74,'Can change tournament rule',19,'change_tournamentrule'),(75,'Can delete tournament rule',19,'delete_tournamentrule'),(76,'Can view tournament rule',19,'view_tournamentrule'),(77,'Can add tournament',20,'add_tournament'),(78,'Can change tournament',20,'change_tournament'),(79,'Can delete tournament',20,'delete_tournament'),(80,'Can view tournament',20,'view_tournament'),(81,'Can add profile',21,'add_profile'),(82,'Can change profile',21,'change_profile'),(83,'Can delete profile',21,'delete_profile'),(84,'Can view profile',21,'view_profile'),(85,'Can add auth group',22,'add_authgroup'),(86,'Can change auth group',22,'change_authgroup'),(87,'Can delete auth group',22,'delete_authgroup'),(88,'Can view auth group',22,'view_authgroup'),(89,'Can add auth group permissions',23,'add_authgrouppermissions'),(90,'Can change auth group permissions',23,'change_authgrouppermissions'),(91,'Can delete auth group permissions',23,'delete_authgrouppermissions'),(92,'Can view auth group permissions',23,'view_authgrouppermissions'),(93,'Can add auth permission',24,'add_authpermission'),(94,'Can change auth permission',24,'change_authpermission'),(95,'Can delete auth permission',24,'delete_authpermission'),(96,'Can view auth permission',24,'view_authpermission'),(97,'Can add auth user',25,'add_authuser'),(98,'Can change auth user',25,'change_authuser'),(99,'Can delete auth user',25,'delete_authuser'),(100,'Can view auth user',25,'view_authuser'),(101,'Can add auth user groups',26,'add_authusergroups'),(102,'Can change auth user groups',26,'change_authusergroups'),(103,'Can delete auth user groups',26,'delete_authusergroups'),(104,'Can view auth user groups',26,'view_authusergroups'),(105,'Can add auth user user permissions',27,'add_authuseruserpermissions'),(106,'Can change auth user user permissions',27,'change_authuseruserpermissions'),(107,'Can delete auth user user permissions',27,'delete_authuseruserpermissions'),(108,'Can view auth user user permissions',27,'view_authuseruserpermissions'),(109,'Can add blog post',28,'add_blogpost'),(110,'Can change blog post',28,'change_blogpost'),(111,'Can delete blog post',28,'delete_blogpost'),(112,'Can view blog post',28,'view_blogpost'),(113,'Can add django admin log',29,'add_djangoadminlog'),(114,'Can change django admin log',29,'change_djangoadminlog'),(115,'Can delete django admin log',29,'delete_djangoadminlog'),(116,'Can view django admin log',29,'view_djangoadminlog'),(117,'Can add django content type',30,'add_djangocontenttype'),(118,'Can change django content type',30,'change_djangocontenttype'),(119,'Can delete django content type',30,'delete_djangocontenttype'),(120,'Can view django content type',30,'view_djangocontenttype'),(121,'Can add users profile',31,'add_usersprofile'),(122,'Can change users profile',31,'change_usersprofile'),(123,'Can delete users profile',31,'delete_usersprofile'),(124,'Can view users profile',31,'view_usersprofile'),(125,'Can add profile',32,'add_profile'),(126,'Can change profile',32,'change_profile'),(127,'Can delete profile',32,'delete_profile'),(128,'Can view profile',32,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$nJmgvXYDeGEg$uzkyjv2+7ysi2hkWQrefpEb5SO7TOWuAN2VU2aaZegU=','2020-04-14 15:05:49.911487',1,'cderuiter','','','cderuiter@oakland.edu',1,1,'2020-03-16 02:09:13.329000'),(2,'pbkdf2_sha256$180000$U1hYIwPpAd9W$RXyEcYZ+SAP+zueJz7V++yj48mOU/ef4+wHtTZ0akEI=',NULL,0,'TestUser','','','testuser@gmail.com',0,1,'2020-03-16 02:13:42.000000'),(6,'pbkdf2_sha256$180000$umcrfZKURLKP$SvLYd/1oUQFiTXhqeg/G72OZ5ghZ0407wkhOwIVOCiE=','2020-03-22 19:51:46.629754',0,'NewUser3','','','NU3@company.com',0,1,'2020-03-22 19:51:29.110415'),(12,'pbkdf2_sha256$180000$kkonGWPPjaEw$zojGaRfaqT6j71z/dqerQeQDLs5O0mkePnUAd5c72mE=','2020-03-29 20:24:51.452659',0,'TestUser1','','','testuser@company.com',0,1,'2020-03-29 20:24:35.192959');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caught_fish`
--

DROP TABLE IF EXISTS `caught_fish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caught_fish` (
  `C_FISH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRN_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `ANG_ID` int(11) NOT NULL,
  `FISH_ID` int(11) NOT NULL,
  `C_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `C_FISH_LEN` decimal(10,0) NOT NULL,
  `C_FISH_WGT` decimal(10,0) NOT NULL,
  PRIMARY KEY (`C_FISH_ID`,`TRN_ID`,`TEAM_ID`,`ANG_ID`,`FISH_ID`,`C_DATE`),
  KEY `ANG_CF_ID_idx` (`ANG_ID`),
  KEY `FISH_CF_ID_idx` (`FISH_ID`),
  KEY `TEAM_CF_ID_idx` (`TEAM_ID`),
  KEY `TRN_CF_ID_idx` (`TRN_ID`),
  CONSTRAINT `ANG_CF_ID` FOREIGN KEY (`ANG_ID`) REFERENCES `angler` (`ANG_ID`),
  CONSTRAINT `FISH_CF_ID` FOREIGN KEY (`FISH_ID`) REFERENCES `fish` (`FISH_ID`),
  CONSTRAINT `TEAM_CF_ID` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`TEAM_ID`),
  CONSTRAINT `TRN_CF_ID` FOREIGN KEY (`TRN_ID`) REFERENCES `tournament` (`TRN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci KEY_BLOCK_SIZE=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caught_fish`
--

LOCK TABLES `caught_fish` WRITE;
/*!40000 ALTER TABLE `caught_fish` DISABLE KEYS */;
INSERT INTO `caught_fish` VALUES (3,22,20,4,6,'2020-04-14 01:25:37',19,25),(4,22,20,7,3,'2020-04-14 01:28:05',16,15),(5,27,22,4,6,'2020-04-14 15:32:44',17,5);
/*!40000 ALTER TABLE `caught_fish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-16 02:13:42.815000','2','TestUser',1,'[{\"added\": {}}]',5,1),(2,'2020-03-16 02:14:55.196000','2','TestUser',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',5,1),(3,'2020-03-16 02:14:58.794000','2','TestUser',2,'[]',5,1),(4,'2020-03-18 23:46:04.188000','1','BLOG1  Updated',2,'[{\"changed\": {\"fields\": [\"Title\", \"Content\"]}}]',1,1),(5,'2020-03-22 19:19:18.210650','1','cderuiter Profile',1,'[{\"added\": {}}]',21,1),(6,'2020-03-22 19:19:36.139896','2','TestUser Profile',1,'[{\"added\": {}}]',21,1),(7,'2020-03-22 19:29:12.187486','2','TestUser Profile',3,'',21,1),(8,'2020-03-22 19:29:12.215053','1','cderuiter Profile',3,'',21,1),(9,'2020-03-22 19:29:21.379492','3','cderuiter Profile',1,'[{\"added\": {}}]',21,1),(10,'2020-03-22 19:29:28.326803','4','TestUser Profile',1,'[{\"added\": {}}]',21,1),(11,'2020-03-29 19:59:46.999835','1','cderuiter Profile',1,'[{\"added\": {}}]',32,1),(12,'2020-03-29 20:18:44.694445','5','CaptainAmerica',3,'',5,1),(13,'2020-03-29 20:18:44.698287','8','NewUseer4',3,'',5,1),(14,'2020-03-29 20:18:44.702786','9','NewUseer5',3,'',5,1),(15,'2020-03-29 20:18:44.705635','10','NewUseer6',3,'',5,1),(16,'2020-03-29 20:18:44.707738','11','NewUseer7',3,'',5,1),(17,'2020-03-29 20:18:44.709843','4','NewUser2',3,'',5,1),(18,'2020-03-29 20:18:44.711747','6','NewUser3',3,'',5,1),(19,'2020-03-29 20:18:44.714880','7','NewUser4',3,'',5,1),(20,'2020-03-29 20:18:44.717329','3','NewUserr',3,'',5,1),(21,'2020-03-29 20:18:44.719355','2','TestUser',3,'',5,1),(22,'2020-03-29 20:20:09.157718','11','NewUseer7',3,'',5,1),(23,'2020-03-29 20:20:19.358915','10','NewUseer6',3,'',5,1),(24,'2020-03-29 20:20:25.458081','5','CaptainAmerica',3,'',5,1),(25,'2020-03-29 20:20:32.093241','9','NewUseer5',3,'',5,1),(26,'2020-03-29 20:20:38.067363','8','NewUseer4',3,'',5,1),(27,'2020-03-29 20:20:43.883620','4','NewUser2',3,'',5,1),(28,'2020-03-29 20:20:49.556175','6','NewUser3',3,'',5,1),(30,'2020-03-29 20:22:17.421190','3','NewUserr',3,'',5,1),(31,'2020-03-29 20:22:23.496337','7','NewUser4',3,'',5,1),(32,'2020-03-29 20:22:30.966123','2','TestUser',3,'',5,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(1,'blog','post'),(6,'contenttypes','contenttype'),(32,'officials','profile'),(7,'sessions','session'),(8,'tournament','angler'),(22,'tournament','authgroup'),(23,'tournament','authgrouppermissions'),(24,'tournament','authpermission'),(25,'tournament','authuser'),(26,'tournament','authusergroups'),(27,'tournament','authuseruserpermissions'),(28,'tournament','blogpost'),(17,'tournament','caughtfish'),(29,'tournament','djangoadminlog'),(30,'tournament','djangocontenttype'),(9,'tournament','djangomigrations'),(10,'tournament','djangosession'),(11,'tournament','fish'),(12,'tournament','location'),(13,'tournament','official'),(18,'tournament','registeredteam'),(14,'tournament','sponsor'),(15,'tournament','team'),(20,'tournament','tournament'),(19,'tournament','tournamentrule'),(16,'tournament','trnofficial'),(31,'tournament','usersprofile'),(21,'users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'sessions','0001_initial','2020-03-22 14:22:09.321296'),(2,'contenttypes','0001_initial','2020-03-22 14:43:22.148392'),(3,'auth','0001_initial','2020-03-22 14:43:22.413184'),(4,'admin','0001_initial','2020-03-22 14:43:23.130960'),(5,'admin','0002_logentry_remove_auto_add','2020-03-22 14:43:23.289415'),(6,'admin','0003_logentry_add_action_flag_choices','2020-03-22 14:43:23.306133'),(7,'contenttypes','0002_remove_content_type_name','2020-03-22 14:43:23.496978'),(8,'auth','0002_alter_permission_name_max_length','2020-03-22 14:43:23.592343'),(9,'auth','0003_alter_user_email_max_length','2020-03-22 14:43:23.626829'),(10,'auth','0004_alter_user_username_opts','2020-03-22 14:43:23.641090'),(11,'auth','0005_alter_user_last_login_null','2020-03-22 14:43:23.730940'),(12,'auth','0006_require_contenttypes_0002','2020-03-22 14:43:23.735818'),(13,'auth','0007_alter_validators_add_error_messages','2020-03-22 14:43:23.749934'),(14,'auth','0008_alter_user_username_max_length','2020-03-22 14:43:23.849962'),(15,'auth','0009_alter_user_last_name_max_length','2020-03-22 14:43:23.946536'),(16,'auth','0010_alter_group_name_max_length','2020-03-22 14:43:23.981305'),(17,'auth','0011_update_proxy_permissions','2020-03-22 14:43:23.997047'),(18,'blog','0001_initial','2020-03-22 14:43:24.067086'),(19,'blog','0002_delete_post','2020-03-22 14:43:24.155811'),(20,'blog','0003_post','2020-03-22 14:43:24.213622'),(21,'tournament','0001_initial','2020-03-22 19:15:15.199448'),(22,'users','0001_initial','2020-03-22 19:15:15.291592'),(23,'officials','0001_initial','2020-03-29 19:36:06.814486'),(24,'tournament','0002_delete_blogpost','2020-04-05 14:55:35.685403');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5u6wdw2vrygrys38dz97hekf8tsevdb8','NGMyNGM4N2RkMzdmZTRjN2Q4OGMyNTZmODNmYTRjY2NkODc2MTFjNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzJkMGJhNjU2NjgyMWM2YzQxOGFlNTJiNDE1YzFlNjMxMzM2MWQ0In0=','2020-04-12 23:39:47.176181'),('v0zomitbcr0fz7o8pgtga34uh9wid8lo','NGMyNGM4N2RkMzdmZTRjN2Q4OGMyNTZmODNmYTRjY2NkODc2MTFjNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzJkMGJhNjU2NjgyMWM2YzQxOGFlNTJiNDE1YzFlNjMxMzM2MWQ0In0=','2020-04-27 17:19:53.069678'),('xzp9zzgawp725bp3xdz4nqimml8ze0qa','OWY2NGVkOWRkNDgwYzVjMzU1MDllMjNkYTYzMzIyM2YwNGYzMjRlODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjAzZTlmMmQ4MzBmMjcwODBhY2U1NzNmMTQ0ZGQ4ODBmYzNiZWI5In0=','2020-04-05 22:17:46.027958');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fish`
--

DROP TABLE IF EXISTS `fish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fish` (
  `FISH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FISH_TYPE` varchar(45) NOT NULL,
  `FISH_AVG_LEN` decimal(10,0) DEFAULT NULL,
  `FISH_AVG_WGT` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`FISH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish`
--

LOCK TABLES `fish` WRITE;
/*!40000 ALTER TABLE `fish` DISABLE KEYS */;
INSERT INTO `fish` VALUES (3,'Largemouth Bass',12,12),(4,'Lake Trout',17,4),(5,'Smallmouth Bass',16,7),(6,'Walleye',17,24),(7,'Bluegill',10,2),(8,'Northern Pike',22,34),(9,'Yellow Perch',6,2),(10,'King Salmon',20,26);
/*!40000 ALTER TABLE `fish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOC_STATE` char(2) NOT NULL,
  `LOC_COUNTY` varchar(40) NOT NULL,
  `LOC_LAKE` varchar(40) NOT NULL,
  PRIMARY KEY (`LOC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (13,'MI','Charlevoix','Lake Michgian'),(14,'MI','Macomb','Lake Saint Clair'),(15,'MI','Macomb','Lake Michigan'),(16,'MI','Port Huron','Lake Michigan'),(17,'MI','Oakland County','Bear Lake'),(18,'MI','Oakland County','Bear Lake');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official`
--

DROP TABLE IF EXISTS `official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `official` (
  `OFC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFC_FNAME` varchar(45) NOT NULL,
  `OFC_LNAME` varchar(45) NOT NULL,
  PRIMARY KEY (`OFC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official`
--

LOCK TABLES `official` WRITE;
/*!40000 ALTER TABLE `official` DISABLE KEYS */;
INSERT INTO `official` VALUES (4,'Bryan','Wahl');
/*!40000 ALTER TABLE `official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officials_profile`
--

DROP TABLE IF EXISTS `officials_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officials_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `officials_profile_user_id_863235f6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officials_profile`
--

LOCK TABLES `officials_profile` WRITE;
/*!40000 ALTER TABLE `officials_profile` DISABLE KEYS */;
INSERT INTO `officials_profile` VALUES (1,'profile_pics/port.jpg',1),(5,'default.jpg',12);
/*!40000 ALTER TABLE `officials_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_team`
--

DROP TABLE IF EXISTS `registered_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registered_team` (
  `REG_TEAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRN_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `REG_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `REG_PAID_STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`REG_TEAM_ID`,`TRN_ID`,`TEAM_ID`),
  KEY `TEAM_ID_idx` (`TEAM_ID`),
  KEY `TRN_RT_ID` (`TRN_ID`),
  CONSTRAINT `TEAM_RT_ID` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`TEAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TRN_RT_ID` FOREIGN KEY (`TRN_ID`) REFERENCES `tournament` (`TRN_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_team`
--

LOCK TABLES `registered_team` WRITE;
/*!40000 ALTER TABLE `registered_team` DISABLE KEYS */;
INSERT INTO `registered_team` VALUES (27,22,20,'2020-04-14 00:57:39','Y'),(28,22,21,'2020-04-14 01:07:49','N'),(29,27,22,'2020-04-14 15:21:19','Y');
/*!40000 ALTER TABLE `registered_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `SPONS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SPONS_NAME` varchar(45) NOT NULL,
  `SPONS_TIER` int(11) DEFAULT '1',
  PRIMARY KEY (`SPONS_ID`),
  CONSTRAINT `sponsor_chk_1` CHECK ((`SPONS_TIER` in (1,2,3)))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (14,'Cabela\'s',1),(15,'Rapella',1),(16,'Bass Pro Shop',1),(17,'SECS',1),(18,'SECS',1);
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `TEAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEAM_NAME` varchar(45) NOT NULL,
  `TEAM_OWNER` varchar(45) DEFAULT NULL,
  `SPONS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`),
  UNIQUE KEY `TEAM_ID_UNIQUE` (`TEAM_ID`),
  KEY `SPONS_ID_idx` (`SPONS_ID`),
  CONSTRAINT `SPONS_TEAM_ID` FOREIGN KEY (`SPONS_ID`) REFERENCES `sponsor` (`SPONS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (20,'Bass Masters','Christian deRuiter',15),(21,'CatchemAll','John Smith',NULL),(22,'OU Fishing Team','Captain Hook',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `TRN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRN_NAME` varchar(45) NOT NULL,
  `TRN_DATE` date DEFAULT NULL,
  `LOC_ID` int(11) DEFAULT NULL,
  `SPONS_ID` int(11) DEFAULT NULL,
  `TRN_ENTRY_FEE` decimal(9,2) DEFAULT NULL,
  `TRN_FIRST_PRIZE` decimal(9,2) DEFAULT NULL,
  `TRN_SECOND_PRIZE` decimal(9,2) DEFAULT NULL,
  `TRN_THIRD_PRIZE` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`TRN_ID`),
  KEY `LOC_ID_idx` (`LOC_ID`),
  KEY `SPONS_ID_idx` (`SPONS_ID`),
  CONSTRAINT `LOC_TRN_ID` FOREIGN KEY (`LOC_ID`) REFERENCES `location` (`LOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONS_TRN_ID` FOREIGN KEY (`SPONS_ID`) REFERENCES `sponsor` (`SPONS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (22,'Cabela\'s Fishing Tournament','2020-07-04',13,14,1000.00,10000.00,5000.00,2500.00),(24,'Bass Pro Shop Open','2020-10-11',15,16,1000.00,15000.00,5000.00,2500.00),(25,'Reel Happy Fishing Tournament','2020-11-25',16,NULL,10.00,1000.00,100.00,50.00),(27,'Oakland University Fishing Tournament','2020-04-14',18,18,1000.00,10000.00,5000.00,2500.00);
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_rule`
--

DROP TABLE IF EXISTS `tournament_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_rule` (
  `TRN_RULE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRN_ID` int(11) NOT NULL,
  `FISH_ID` int(11) NOT NULL,
  `MIN_FISH_LEN` decimal(10,0) DEFAULT NULL,
  `MIN_FISH_WEIGHT` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`TRN_RULE_ID`,`TRN_ID`,`FISH_ID`),
  KEY `TRN_ID_idx` (`TRN_ID`),
  KEY `FISH_ID_idx` (`FISH_ID`),
  CONSTRAINT `FISH_ID` FOREIGN KEY (`FISH_ID`) REFERENCES `fish` (`FISH_ID`),
  CONSTRAINT `TRN_ID` FOREIGN KEY (`TRN_ID`) REFERENCES `tournament` (`TRN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_rule`
--

LOCK TABLES `tournament_rule` WRITE;
/*!40000 ALTER TABLE `tournament_rule` DISABLE KEYS */;
INSERT INTO `tournament_rule` VALUES (8,22,3,10,4),(9,22,5,9,3),(10,27,6,12,4),(11,27,3,12,5);
/*!40000 ALTER TABLE `tournament_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trn_official`
--

DROP TABLE IF EXISTS `trn_official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trn_official` (
  `TRN_ID` int(11) NOT NULL,
  `OFC_ID` int(11) NOT NULL,
  `TRN_OFFICIAL_UNAME` varchar(45) DEFAULT NULL,
  `TRN_OFFICIAL_PWORD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TRN_ID`,`OFC_ID`),
  KEY `OFC_ID_idx` (`OFC_ID`),
  CONSTRAINT `OFC_TOFC_ID` FOREIGN KEY (`OFC_ID`) REFERENCES `official` (`OFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TRN_TOFC_ID` FOREIGN KEY (`TRN_ID`) REFERENCES `tournament` (`TRN_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trn_official`
--

LOCK TABLES `trn_official` WRITE;
/*!40000 ALTER TABLE `trn_official` DISABLE KEYS */;
INSERT INTO `trn_official` VALUES (22,4,NULL,NULL);
/*!40000 ALTER TABLE `trn_official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (3,'profile_pics/port.jpg',1),(4,'default.jpg',2),(5,'default.jpg',6);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-19 20:30:28
