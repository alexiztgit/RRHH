-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: rrhh
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` text COLLATE utf8_unicode_ci NOT NULL,
  `last_name` text COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Didier','Neira','1990-04-14','2015-06-15 22:27:21','2015-06-15 22:27:21'),(2,'Uma','Thurman','1985-01-01','2015-06-15 22:30:24','2015-06-15 22:30:24'),(3,'Diane','Keaton','1960-01-01','2015-06-15 22:32:21','2015-06-15 22:32:21'),(4,'aaaa','ddddd','2015-06-01','2015-06-16 23:01:43','2015-06-16 23:01:43');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors_films`
--

DROP TABLE IF EXISTS `actors_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors_films` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int(10) unsigned NOT NULL,
  `film_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_films`
--

LOCK TABLES `actors_films` WRITE;
/*!40000 ALTER TABLE `actors_films` DISABLE KEYS */;
INSERT INTO `actors_films` VALUES (1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,2,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,2,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,4,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,4,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,4,3,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `actors_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional`
--

DROP TABLE IF EXISTS `additional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional`
--

LOCK TABLES `additional` WRITE;
/*!40000 ALTER TABLE `additional` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `locality_id` int(11) NOT NULL,
  `split_id` int(11) NOT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_adress_province1_idx` (`province_id`),
  KEY `fk_adress_locality1_idx` (`locality_id`),
  KEY `fk_adress_split1_idx` (`split_id`),
  CONSTRAINT `fk_adress_locality1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_adress_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_adress_split1` FOREIGN KEY (`split_id`) REFERENCES `split` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box_office`
--

DROP TABLE IF EXISTS `box_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box_office` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revenue` decimal(10,2) NOT NULL,
  `film_id` int(10) unsigned NOT NULL,
  `theater_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_office`
--

LOCK TABLES `box_office` WRITE;
/*!40000 ALTER TABLE `box_office` DISABLE KEYS */;
INSERT INTO `box_office` VALUES (1,5000000.00,1,1,'2015-06-15 22:33:21','2015-06-15 22:33:21'),(2,2000000.00,2,1,'2015-06-15 22:33:33','2015-06-15 22:33:33'),(3,3000000.00,1,2,'2015-06-15 22:34:31','2015-06-15 22:34:31'),(4,3000000.00,2,2,'2015-06-15 22:34:56','2015-06-15 22:34:56');
/*!40000 ALTER TABLE `box_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_building_area1_idx` (`area_id`),
  CONSTRAINT `fk_building_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_country1_idx` (`country_id`),
  CONSTRAINT `fk_city_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Bogotá',1,NULL,NULL),(2,'Buenos Aires',2,'2015-07-05 22:56:23','2015-07-05 22:56:23'),(3,'La Habana',6,'2015-07-06 00:39:39','2015-07-06 00:39:39'),(4,'Asunción',7,'2015-07-06 02:42:27','2015-07-06 02:42:34');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congress`
--

DROP TABLE IF EXISTS `congress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `congress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `especiality` varchar(45) DEFAULT NULL,
  `certificate` varchar(45) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ended` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congress`
--

LOCK TABLES `congress` WRITE;
/*!40000 ALTER TABLE `congress` DISABLE KEYS */;
/*!40000 ALTER TABLE `congress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`type_id`),
  KEY `fk_contact_type_type1_idx` (`type_id`),
  CONSTRAINT `fk_contact_type_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (1,'Correo Personal',1),(2,'Correo Corporativo',1),(3,'Telefono Personal',2),(4,'Telefono Corportativo',2),(5,'Celular',2);
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Colombia','2015-07-05 21:57:53','2015-07-05 21:57:53'),(2,'Argentina','2015-07-05 21:57:48','2015-07-05 21:57:48'),(3,'Uruguay','2015-07-05 21:58:05','2015-07-05 21:58:05'),(4,'Chile','2015-07-05 21:58:11','2015-07-05 21:58:11'),(5,'Brasil','2015-07-05 21:58:16','2015-07-05 21:58:16'),(6,'Cuba','2015-07-06 00:39:10','2015-07-06 00:39:22'),(7,'Paraguay','2015-07-06 02:42:15','2015-07-06 02:42:15'),(9,'Colombia','2015-07-06 17:01:59','2015-07-06 17:01:59'),(10,'Colombia','2015-07-06 17:02:05','2015-07-06 17:02:05');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `certificate` varchar(45) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ended` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Quentin','Tarantino',1000000.00,'2015-06-15 22:27:44','2015-06-15 22:27:44'),(2,'Woody','Allen',2500000.00,'2015-06-15 22:28:02','2015-06-15 22:28:02');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disability`
--

DROP TABLE IF EXISTS `disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_date` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `certificate_url` varchar(500) DEFAULT NULL,
  `certificate_creator` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `disability_type_id` int(11) NOT NULL,
  `medical_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_disability_disability_type1_idx` (`disability_type_id`),
  KEY `fk_disability_medical_data1_idx` (`medical_data_id`),
  CONSTRAINT `fk_disability_disability_type1` FOREIGN KEY (`disability_type_id`) REFERENCES `disability_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disability_medical_data1` FOREIGN KEY (`medical_data_id`) REFERENCES `medical_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability`
--

LOCK TABLES `disability` WRITE;
/*!40000 ALTER TABLE `disability` DISABLE KEYS */;
/*!40000 ALTER TABLE `disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disability_type`
--

DROP TABLE IF EXISTS `disability_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disability_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability_type`
--

LOCK TABLES `disability_type` WRITE;
/*!40000 ALTER TABLE `disability_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `disability_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
INSERT INTO `document_type` VALUES (1,'DNI'),(2,'Pasaporte'),(3,'Cédula');
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ended` bit(1) DEFAULT b'1',
  `education_level_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `education_status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_education_education_level1_idx` (`education_level_id`),
  KEY `fk_education_institution1_idx` (`institution_id`),
  KEY `fk_education_education_status1_idx` (`education_status_id`),
  CONSTRAINT `fk_education_education_level1` FOREIGN KEY (`education_level_id`) REFERENCES `education_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_education_status1` FOREIGN KEY (`education_status_id`) REFERENCES `education_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_institution1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_level`
--

DROP TABLE IF EXISTS `education_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_level`
--

LOCK TABLES `education_level` WRITE;
/*!40000 ALTER TABLE `education_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_status`
--

DROP TABLE IF EXISTS `education_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_status`
--

LOCK TABLES `education_status` WRITE;
/*!40000 ALTER TABLE `education_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_type`
--

DROP TABLE IF EXISTS `email_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_type`
--

LOCK TABLES `email_type` WRITE;
/*!40000 ALTER TABLE `email_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `cuil` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `document_type_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_document_type_idx` (`document_type_id`),
  KEY `fk_employee_city1_idx` (`city_id`),
  CONSTRAINT `fk_employee_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_document_type` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'32423423','Gonzalo','Higuain',NULL,'1223123',NULL,'casado',3,1,'2015-07-06 01:34:31','2015-07-06 01:34:31',NULL),(2,'32423423','Gonzalo','Higuain',NULL,'1223123',NULL,'casado',3,1,'2015-07-06 01:37:20','2015-07-06 01:37:20',NULL),(3,'4323423','xxxx','3asdasd',NULL,'234234',NULL,'soltero',3,3,'2015-07-06 01:37:59','2015-07-06 01:37:59',NULL),(4,'4534958','Gil','Antonio',NULL,'453453',NULL,'casado',2,2,'2015-07-06 02:49:01','2015-07-06 02:49:01',NULL),(5,'4534958','Gil','Antonio',NULL,'453453',NULL,'casado',2,2,'2015-07-06 03:10:02','2015-07-06 03:10:02',NULL),(8,'45345345','xxxxxxx','xxxxxxx',NULL,'534534534',NULL,'casado',2,2,'2015-07-11 22:36:29','2015-07-11 22:36:29',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_adress`
--

DROP TABLE IF EXISTS `employee_adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_adress` (
  `employee_id` int(11) NOT NULL,
  `adress_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`adress_id`),
  KEY `fk_employee_has_adress_adress1_idx` (`adress_id`),
  KEY `fk_employee_has_adress_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_adress_adress1` FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_adress_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_adress`
--

LOCK TABLES `employee_adress` WRITE;
/*!40000 ALTER TABLE `employee_adress` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_contact_type`
--

DROP TABLE IF EXISTS `employee_contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_contact_type` (
  `employee_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`contact_type_id`),
  KEY `fk_employee_has_contact_type_contact_type1_idx` (`contact_type_id`),
  KEY `fk_employee_has_contact_type_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_contact_type_contact_type1` FOREIGN KEY (`contact_type_id`) REFERENCES `contact_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_contact_type_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contact_type`
--

LOCK TABLES `employee_contact_type` WRITE;
/*!40000 ALTER TABLE `employee_contact_type` DISABLE KEYS */;
INSERT INTO `employee_contact_type` VALUES (8,1,'dneira04@gmail.com','','2015-07-11 23:39:51','2015-07-11 23:39:51',NULL),(8,3,'5555555','','2015-07-11 23:01:13','2015-07-11 23:01:13',NULL),(8,4,'9999','','2015-07-12 00:06:22','2015-07-12 00:06:22',NULL),(8,5,'234234234','','2015-07-11 22:43:41','2015-07-11 22:43:41',NULL);
/*!40000 ALTER TABLE `employee_contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_email_type`
--

DROP TABLE IF EXISTS `employee_email_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_email_type` (
  `employee_id` int(11) NOT NULL,
  `email_type_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`employee_id`,`email_type_id`),
  KEY `fk_employee_has_email_type_email_type1_idx` (`email_type_id`),
  KEY `fk_employee_has_email_type_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_email_type_email_type1` FOREIGN KEY (`email_type_id`) REFERENCES `email_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_email_type_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_email_type`
--

LOCK TABLES `employee_email_type` WRITE;
/*!40000 ALTER TABLE `employee_email_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_email_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_other_type`
--

DROP TABLE IF EXISTS `employee_has_other_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_has_other_type` (
  `employee_id` int(11) NOT NULL,
  `other_type_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`employee_id`,`other_type_id`),
  KEY `fk_employee_has_other_type_other_type1_idx` (`other_type_id`),
  KEY `fk_employee_has_other_type_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_other_type_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_other_type_other_type1` FOREIGN KEY (`other_type_id`) REFERENCES `other_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_other_type`
--

LOCK TABLES `employee_has_other_type` WRITE;
/*!40000 ALTER TABLE `employee_has_other_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_has_other_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_job_status`
--

DROP TABLE IF EXISTS `employee_job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_job_status` (
  `employee_id` int(11) NOT NULL,
  `job_status_id` int(11) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`employee_id`,`job_status_id`),
  KEY `fk_employee_has_job_status_job_status1_idx` (`job_status_id`),
  KEY `fk_employee_has_job_status_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_job_status_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_job_status_job_status1` FOREIGN KEY (`job_status_id`) REFERENCES `job_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_job_status`
--

LOCK TABLES `employee_job_status` WRITE;
/*!40000 ALTER TABLE `employee_job_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_job_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_log`
--

DROP TABLE IF EXISTS `employee_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_log` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_log_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_log_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_log`
--

LOCK TABLES `employee_log` WRITE;
/*!40000 ALTER TABLE `employee_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_phone_type`
--

DROP TABLE IF EXISTS `employee_phone_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_phone_type` (
  `employee_id` int(11) NOT NULL,
  `phone_type_id` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `active` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`phone_type_id`),
  KEY `fk_employee_has_phone_type_phone_type1_idx` (`phone_type_id`),
  KEY `fk_employee_has_phone_type_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_phone_type_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_phone_type_phone_type1` FOREIGN KEY (`phone_type_id`) REFERENCES `phone_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_phone_type`
--

LOCK TABLES `employee_phone_type` WRITE;
/*!40000 ALTER TABLE `employee_phone_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_phone_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_status`
--

DROP TABLE IF EXISTS `employee_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_status` (
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  PRIMARY KEY (`employee_id`,`status_id`),
  KEY `fk_employee_has_status_status1_idx` (`status_id`),
  KEY `fk_employee_has_status_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_status_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_status_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_status`
--

LOCK TABLES `employee_status` WRITE;
/*!40000 ALTER TABLE `employee_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `kinship_id` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `living_with` bit(1) DEFAULT NULL,
  `garden_assignation` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_family_kinship1_idx` (`kinship_id`),
  KEY `fk_family_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_family_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_kinship1` FOREIGN KEY (`kinship_id`) REFERENCES `kinship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_disability_type`
--

DROP TABLE IF EXISTS `family_disability_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_disability_type` (
  `family_id` int(11) NOT NULL,
  `disability_type_id` int(11) NOT NULL,
  PRIMARY KEY (`family_id`,`disability_type_id`),
  KEY `fk_family_has_disability_type_disability_type1_idx` (`disability_type_id`),
  KEY `fk_family_has_disability_type_family1_idx` (`family_id`),
  CONSTRAINT `fk_family_has_disability_type_disability_type1` FOREIGN KEY (`disability_type_id`) REFERENCES `disability_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_has_disability_type_family1` FOREIGN KEY (`family_id`) REFERENCES `family` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_disability_type`
--

LOCK TABLES `family_disability_type` WRITE;
/*!40000 ALTER TABLE `family_disability_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_disability_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `director_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Pulp Fiction','2015-06-01',1,'2015-06-15 22:29:41','2015-06-15 22:29:41'),(2,'Annie Hall','2015-06-01',2,'2015-06-15 22:32:36','2015-06-15 22:32:36'),(3,'Kill Bill','2015-06-01',1,'2015-06-16 04:55:28','2015-06-16 04:55:28'),(4,'pelicula 1','2015-06-03',2,'2015-06-16 22:59:32','2015-06-16 22:59:32');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_theaters`
--

DROP TABLE IF EXISTS `films_theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films_theaters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int(10) unsigned NOT NULL,
  `theater_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_theaters`
--

LOCK TABLES `films_theaters` WRITE;
/*!40000 ALTER TABLE `films_theaters` DISABLE KEYS */;
INSERT INTO `films_theaters` VALUES (1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,2,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,3,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,4,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,4,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,3,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `films_theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouping`
--

DROP TABLE IF EXISTS `grouping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouping`
--

LOCK TABLES `grouping` WRITE;
/*!40000 ALTER TABLE `grouping` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `it_area`
--

DROP TABLE IF EXISTS `it_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `it_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_area`
--

LOCK TABLES `it_area` WRITE;
/*!40000 ALTER TABLE `it_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `it_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `it_course`
--

DROP TABLE IF EXISTS `it_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `it_course` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `it_area_id` int(11) NOT NULL,
  `it_especiality_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_it_course_it_area1_idx` (`it_area_id`),
  KEY `fk_it_course_it_especiality1_idx` (`it_especiality_id`),
  CONSTRAINT `fk_it_course_it_area1` FOREIGN KEY (`it_area_id`) REFERENCES `it_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_course_it_especiality1` FOREIGN KEY (`it_especiality_id`) REFERENCES `it_especiality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_course`
--

LOCK TABLES `it_course` WRITE;
/*!40000 ALTER TABLE `it_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `it_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `it_especiality`
--

DROP TABLE IF EXISTS `it_especiality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `it_especiality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_especiality`
--

LOCK TABLES `it_especiality` WRITE;
/*!40000 ALTER TABLE `it_especiality` DISABLE KEYS */;
/*!40000 ALTER TABLE `it_especiality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_status`
--

DROP TABLE IF EXISTS `job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kinship`
--

DROP TABLE IF EXISTS `kinship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kinship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kinship`
--

LOCK TABLES `kinship` WRITE;
/*!40000 ALTER TABLE `kinship` DISABLE KEYS */;
/*!40000 ALTER TABLE `kinship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (1,'Vicente Lopez','2015-07-05 23:18:12','2015-07-05 23:18:12'),(2,'Olivos','2015-07-06 00:41:39','2015-07-06 00:41:39');
/*!40000 ALTER TABLE `locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_data`
--

DROP TABLE IF EXISTS `medical_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `blood_type` varchar(45) DEFAULT NULL,
  `medical_file` varchar(45) DEFAULT NULL,
  `medical_apto` varchar(45) DEFAULT NULL,
  `medical_social_name` varchar(45) DEFAULT NULL,
  `art` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `prepaid` varchar(45) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medical_data_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_medical_data_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_data`
--

LOCK TABLES `medical_data` WRITE;
/*!40000 ALTER TABLE `medical_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2012_11_13_023700_create_directors_table',1),('2012_11_13_023705_create_films_table',1),('2012_11_20_222938_create_box_office',1),('2012_11_20_222942_create_actors',1),('2012_11_20_232343_create_actors_films',1),('2012_11_21_000438_create_theaters',1),('2012_11_21_000526_create_films_theaters',1),('2014_10_12_000000_create_users_table',2),('2014_10_12_100000_create_password_resets_table',2),('2015_06_25_225954_create_city_table',3),('2015_06_25_225954_create_country_table',3),('2015_07_02_203359_create_document_type_table',4),('2015_07_02_203359_create_employee_table',4),('2015_07_02_203400_create_adress_table',4),('2015_07_02_203400_create_contact_type_table',4),('2015_07_02_203400_create_employee_adress_table',4),('2015_07_02_203400_create_employee_contact_type_table',4),('2015_07_02_203400_create_employee_status_table',4),('2015_07_02_203400_create_locality_table',4),('2015_07_02_203400_create_province_table',4),('2015_07_02_203400_create_split_table',4),('2015_07_02_203400_create_status_table',4),('2015_07_02_203410_create_foreign_keys',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `building_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_office_building1_idx` (`building_id`),
  CONSTRAINT `fk_office_building1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_tool`
--

DROP TABLE IF EXISTS `office_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `office_toolcol` varchar(45) DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_office_tool_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_office_tool_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_tool`
--

LOCK TABLES `office_tool` WRITE;
/*!40000 ALTER TABLE `office_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `office_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_type`
--

DROP TABLE IF EXISTS `other_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_type`
--

LOCK TABLES `other_type` WRITE;
/*!40000 ALTER TABLE `other_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_type`
--

DROP TABLE IF EXISTS `phone_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_type`
--

LOCK TABLES `phone_type` WRITE;
/*!40000 ALTER TABLE `phone_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Buenos Aires','2015-07-05 23:19:36','2015-07-05 23:19:36'),(2,'Santa fé','2015-07-06 00:41:29','2015-07-06 00:41:29');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_afip` date DEFAULT NULL,
  `in_afip` date DEFAULT NULL,
  `out_afip` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  `scale_id` int(11) NOT NULL,
  `grouping_id` int(11) NOT NULL,
  `stretch_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_work_file1_idx` (`work_file_id`),
  KEY `fk_review_scale1_idx` (`scale_id`),
  KEY `fk_review_grouping1_idx` (`grouping_id`),
  KEY `fk_review_stretch1_idx` (`stretch_id`),
  KEY `fk_review_category1_idx` (`category_id`),
  CONSTRAINT `fk_review_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_grouping1` FOREIGN KEY (`grouping_id`) REFERENCES `grouping` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_scale1` FOREIGN KEY (`scale_id`) REFERENCES `scale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_stretch1` FOREIGN KEY (`stretch_id`) REFERENCES `stretch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_role`
--

DROP TABLE IF EXISTS `review_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_role` (
  `review_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`,`role_id`),
  KEY `fk_review_role_role1_idx` (`role_id`),
  KEY `fk_review_role_review1_idx` (`review_id`),
  CONSTRAINT `fk_review_role_review1` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_role`
--

LOCK TABLES `review_role` WRITE;
/*!40000 ALTER TABLE `review_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scale`
--

DROP TABLE IF EXISTS `scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale`
--

LOCK TABLES `scale` WRITE;
/*!40000 ALTER TABLE `scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` varchar(500) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `split`
--

DROP TABLE IF EXISTS `split`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `split` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `split`
--

LOCK TABLES `split` WRITE;
/*!40000 ALTER TABLE `split` DISABLE KEYS */;
INSERT INTO `split` VALUES (1,'Florida','2015-07-05 23:18:21','2015-07-06 00:40:29'),(2,'Munro','2015-07-06 00:41:16','2015-07-06 00:41:16');
/*!40000 ALTER TABLE `split` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'status 1','2015-07-05 22:02:40','2015-07-05 22:02:40'),(2,'estado dos','2015-07-05 22:02:45','2015-07-05 22:02:45');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stretch`
--

DROP TABLE IF EXISTS `stretch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stretch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretch`
--

LOCK TABLES `stretch` WRITE;
/*!40000 ALTER TABLE `stretch` DISABLE KEYS */;
/*!40000 ALTER TABLE `stretch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplement`
--

DROP TABLE IF EXISTS `supplement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplement`
--

LOCK TABLES `supplement` WRITE;
/*!40000 ALTER TABLE `supplement` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theaters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES (1,'Teatro Colón','2015-06-15 22:28:25','2015-06-15 22:28:25'),(2,'Hoyts Unicenter','2015-06-15 22:33:58','2015-06-15 22:33:58'),(3,'Theather Theather','2015-06-28 04:49:19','2015-06-28 04:49:19');
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Correo Electrónico','2015-07-06 00:00:29','2015-07-06 00:00:29'),(2,'Teléfono','2015-07-06 00:00:37','2015-07-06 00:00:37');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file`
--

DROP TABLE IF EXISTS `work_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `additionals` bit(1) DEFAULT NULL,
  `supplement_id` int(11) NOT NULL,
  `additional_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `dependency_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_work_file_employee1_idx` (`employee_id`),
  KEY `fk_work_file_supplement1_idx` (`supplement_id`),
  KEY `fk_work_file_additional1_idx` (`additional_id`),
  KEY `fk_work_file_area1_idx` (`area_id`),
  CONSTRAINT `fk_work_file_additional1` FOREIGN KEY (`additional_id`) REFERENCES `additional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_supplement1` FOREIGN KEY (`supplement_id`) REFERENCES `supplement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file`
--

LOCK TABLES `work_file` WRITE;
/*!40000 ALTER TABLE `work_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_copy`
--

DROP TABLE IF EXISTS `work_file_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_copy`
--

LOCK TABLES `work_file_copy` WRITE;
/*!40000 ALTER TABLE `work_file_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_copy_has_congress`
--

DROP TABLE IF EXISTS `work_file_copy_has_congress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_copy_has_congress` (
  `work_file_copy_id` int(11) NOT NULL,
  `congress_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_copy_id`,`congress_id`),
  KEY `fk_work_file_copy_has_congress_congress1_idx` (`congress_id`),
  KEY `fk_work_file_copy_has_congress_work_file_copy1_idx` (`work_file_copy_id`),
  CONSTRAINT `fk_work_file_copy_has_congress_congress1` FOREIGN KEY (`congress_id`) REFERENCES `congress` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_congress_work_file_copy1` FOREIGN KEY (`work_file_copy_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_copy_has_congress`
--

LOCK TABLES `work_file_copy_has_congress` WRITE;
/*!40000 ALTER TABLE `work_file_copy_has_congress` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_copy_has_congress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_copy_language`
--

DROP TABLE IF EXISTS `work_file_copy_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_copy_language` (
  `work_file_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`language_id`),
  KEY `fk_work_file_copy_has_language_language1_idx` (`language_id`),
  KEY `fk_work_file_copy_has_language_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_copy_has_language_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_language_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_copy_language`
--

LOCK TABLES `work_file_copy_language` WRITE;
/*!40000 ALTER TABLE `work_file_copy_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_copy_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_course`
--

DROP TABLE IF EXISTS `work_file_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_course` (
  `work_file_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`course_id`),
  KEY `fk_work_file_copy_has_course_course1_idx` (`course_id`),
  KEY `fk_work_file_copy_has_course_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_copy_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_course_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_course`
--

LOCK TABLES `work_file_course` WRITE;
/*!40000 ALTER TABLE `work_file_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_education`
--

DROP TABLE IF EXISTS `work_file_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_education` (
  `work_file_id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`education_id`),
  KEY `fk_work_file_copy_has_education_education1_idx` (`education_id`),
  KEY `fk_work_file_copy_has_education_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_copy_has_education_education1` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_education_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_education`
--

LOCK TABLES `work_file_education` WRITE;
/*!40000 ALTER TABLE `work_file_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_it_course`
--

DROP TABLE IF EXISTS `work_file_it_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_it_course` (
  `work_file_id` int(11) NOT NULL,
  `it_course_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`it_course_id`),
  KEY `fk_work_file_copy_has_it_course_it_course1_idx` (`it_course_id`),
  KEY `fk_work_file_copy_has_it_course_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_copy_has_it_course_it_course1` FOREIGN KEY (`it_course_id`) REFERENCES `it_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_it_course_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_it_course`
--

LOCK TABLES `work_file_it_course` WRITE;
/*!40000 ALTER TABLE `work_file_it_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_it_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_job_status`
--

DROP TABLE IF EXISTS `work_file_job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_job_status` (
  `work_file_id` int(11) NOT NULL,
  `job_status_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`work_file_id`,`job_status_id`),
  KEY `fk_work_file_job_status_job_status1_idx` (`job_status_id`),
  KEY `fk_work_file_job_status_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_job_status_job_status1` FOREIGN KEY (`job_status_id`) REFERENCES `job_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_job_status_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_job_status`
--

LOCK TABLES `work_file_job_status` WRITE;
/*!40000 ALTER TABLE `work_file_job_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_job_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_schedule`
--

DROP TABLE IF EXISTS `work_file_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_schedule` (
  `work_file_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`work_file_id`,`schedule_id`),
  KEY `fk_work_file_schedule_schedule1_idx` (`schedule_id`),
  KEY `fk_work_file_schedule_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_schedule_schedule1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_schedule_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_schedule`
--

LOCK TABLES `work_file_schedule` WRITE;
/*!40000 ALTER TABLE `work_file_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-12 22:14:27
