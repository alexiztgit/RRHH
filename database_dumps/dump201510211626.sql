-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rrhh
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_films`
--

LOCK TABLES `actors_films` WRITE;
/*!40000 ALTER TABLE `actors_films` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional`
--

LOCK TABLES `additional` WRITE;
/*!40000 ALTER TABLE `additional` DISABLE KEYS */;
INSERT INTO `additional` VALUES (1,'hs extras');
/*!40000 ALTER TABLE `additional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrative_act`
--

DROP TABLE IF EXISTS `administrative_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrative_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_act`
--

LOCK TABLES `administrative_act` WRITE;
/*!40000 ALTER TABLE `administrative_act` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrative_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrative_history`
--

DROP TABLE IF EXISTS `administrative_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrative_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stretch_id` int(11) NOT NULL,
  `grouping_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `scale_id` int(11) NOT NULL,
  `act_number` varchar(200) DEFAULT NULL,
  `act_date` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `motivation` text,
  `administrative_act_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_stretch1_idx` (`stretch_id`),
  KEY `fk_table1_grouping1_idx` (`grouping_id`),
  KEY `fk_table1_scale1_idx` (`scale_id`),
  KEY `fk_table1_category1_idx` (`category_id`),
  KEY `fk_adminisitrative_history_administrative_act1_idx` (`administrative_act_id`),
  KEY `fk_adminisitrative_history_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_adminisitrative_history_administrative_act1` FOREIGN KEY (`administrative_act_id`) REFERENCES `administrative_act` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_adminisitrative_history_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_grouping1` FOREIGN KEY (`grouping_id`) REFERENCES `grouping` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_scale1` FOREIGN KEY (`scale_id`) REFERENCES `scale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_stretch1` FOREIGN KEY (`stretch_id`) REFERENCES `stretch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_history`
--

LOCK TABLES `administrative_history` WRITE;
/*!40000 ALTER TABLE `administrative_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrative_history` ENABLE KEYS */;
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
  `postal_code` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'Real','Helguera','3245','4','A',1,1,1,'5454','NO',NULL,'2015-10-20 21:34:47','2015-10-20 21:34:47',NULL,''),(2,'Legal','abreviado','1111111111111111111111111111111111111111','4','asadDADAFDAFAfAFf',1,1,1,'2|212|2|2|2|2|2|2','no lo tengo',NULL,'2015-10-21 01:21:52','2015-10-21 01:21:52',NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'personal'),(2,'administración'),(3,'compras y contrataciones'),(4,'tesoreria');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_office`
--

LOCK TABLES `box_office` WRITE;
/*!40000 ALTER TABLE `box_office` DISABLE KEYS */;
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
  `address` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'alvear','111'),(2,'alsina','1111'),(3,'rodriguez peña','1111');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitation_credit`
--

DROP TABLE IF EXISTS `capacitation_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacitation_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_credit` year(4) NOT NULL,
  `credit_quantity` int(8) NOT NULL,
  `credit_used` int(8) NOT NULL,
  `credit_total` int(8) NOT NULL,
  `validity_date` date NOT NULL,
  `observations` text,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_capacitation_credit_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_capacitation_credit_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitation_credit`
--

LOCK TABLES `capacitation_credit` WRITE;
/*!40000 ALTER TABLE `capacitation_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `capacitation_credit` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Buenos Aires',1,'2015-10-19 18:08:47','2015-10-19 18:08:47'),(2,'La Plata',1,'2015-10-19 18:09:03','2015-10-19 18:09:03'),(3,'Montevideo',2,'2015-10-19 18:09:12','2015-10-19 18:09:12'),(4,'Río de Janiero',3,'2015-10-19 18:09:28','2015-10-19 18:09:28'),(5,'Ramos Mejía',1,'2015-10-19 18:11:37','2015-10-19 18:11:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (1,'laboral',2),(2,'personal',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Argentina','2015-10-19 18:08:02','2015-10-19 18:08:02'),(2,'Uruguay','2015-10-19 18:08:10','2015-10-19 18:08:10'),(3,'Brasil','2015-10-19 18:08:17','2015-10-19 18:08:17');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
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
  `generated_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `certificate_url` varchar(500) DEFAULT NULL,
  `certificate_creator` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `disability_type_id` int(11) DEFAULT NULL,
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
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
-- Table structure for table `disciplinary_action`
--

DROP TABLE IF EXISTS `disciplinary_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplinary_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinary_action`
--

LOCK TABLES `disciplinary_action` WRITE;
/*!40000 ALTER TABLE `disciplinary_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplinary_action` ENABLE KEYS */;
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
INSERT INTO `document_type` VALUES (1,'Cédula'),(2,'Pasaporte'),(3,'DNI');
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
  `education_title` varchar(500) NOT NULL,
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
  `photo` varchar(100) DEFAULT NULL,
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
INSERT INTO `employee` VALUES (1,'456325645','Gomez','Juan','M','30-22222222-9','20151021123304persona-amarilla.jpg','2000-10-06','soltero',1,1,'2015-10-19 18:28:20','2015-10-21 04:33:04',NULL),(2,'26158069','Rodriguez Alvarez','Nicolas Ruben','M','20-26158069-2',NULL,'1977-10-22','casado',1,1,'2015-10-19 22:36:13','2015-10-19 22:36:13',NULL),(3,'121212121212','gimenez','marcelo','M','12-12121212-1',NULL,'1959-10-30','soltero',1,1,'2015-10-19 23:31:56','2015-10-19 23:31:56',NULL),(4,'1234578','furgon','anabrlla','F','27-12345781-9',NULL,'1979-01-01','soltero',3,1,'2015-10-20 00:02:59','2015-10-20 00:02:59',NULL),(5,'22595245','Cruz Urbuba','Natalia','F','27-22595245-6',NULL,'1975-02-04','casado',3,1,'2015-10-20 21:29:49','2015-10-20 21:29:49',NULL),(6,'30078305','García','Javier','M','20-30078305-9',NULL,'1983-05-18','soltero',3,1,'2015-10-20 21:55:04','2015-10-20 21:55:04',NULL),(7,'9898989','paris','adela','F','27-98989898-9',NULL,'1980-10-01','soltero',3,1,'2015-10-21 01:13:45','2015-10-21 01:13:45',NULL),(8,'11111111','pipo','real','F','27-11322836-4','20151021071651decococina-1.jpg','1980-01-01','soltero',3,1,'2015-10-21 23:14:56','2015-10-21 23:16:51',NULL);
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
INSERT INTO `employee_adress` VALUES (5,1),(7,2);
/*!40000 ALTER TABLE `employee_adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_contact_type`
--

DROP TABLE IF EXISTS `employee_contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_contact_type` (
  `id_employee_contact_type` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee_contact_type`),
  KEY `fk_employee_has_contact_type_contact_type1_idx` (`contact_type_id`),
  KEY `fk_employee_has_contact_type_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_contact_type_contact_type1` FOREIGN KEY (`contact_type_id`) REFERENCES `contact_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_contact_type_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contact_type`
--

LOCK TABLES `employee_contact_type` WRITE;
/*!40000 ALTER TABLE `employee_contact_type` DISABLE KEYS */;
INSERT INTO `employee_contact_type` VALUES (1,1,1,'11-111','','2015-10-20 03:08:33','2015-10-20 03:08:33',NULL),(2,5,1,'47-430-084','','2015-10-20 21:31:41','2015-10-20 21:31:41',NULL),(3,5,1,'47-854-87845','','2015-10-20 21:31:56','2015-10-20 21:31:56',NULL),(4,5,2,'cruz@gmail.com','','2015-10-20 21:32:53','2015-10-20 21:32:53',NULL),(5,7,1,'11-111-1','','2015-10-21 01:13:59','2015-10-21 01:13:59',NULL),(6,7,2,'AAAAA@HOTMAIL.COM','','2015-10-21 01:14:21','2015-10-21 01:14:21',NULL),(7,8,2,'xxxxxxxxxxxxxxxx@gmail.com','','2015-10-21 23:18:38','2015-10-21 23:18:38',NULL),(8,8,1,'11-111-11111111','','2015-10-21 23:18:41','2015-10-21 23:18:41',NULL);
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
  `id_employee_status` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee_status`),
  KEY `fk_employee_has_status_status1_idx` (`status_id`),
  KEY `fk_employee_has_status_employee1_idx` (`employee_id`),
  KEY `FK_employee_status_users` (`user_id`),
  CONSTRAINT `FK_employee_status_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_status_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_status_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_status`
--

LOCK TABLES `employee_status` WRITE;
/*!40000 ALTER TABLE `employee_status` DISABLE KEYS */;
INSERT INTO `employee_status` VALUES (1,1,1,1,'2015-10-13','0000-00-00','2015-10-19 18:28:20','2015-10-19 18:28:20'),(2,1,1,1,'2015-10-13','0001-11-30','2015-10-19 20:11:14','2015-10-19 20:11:14'),(3,2,1,1,'2004-01-01','0000-00-00','2015-10-19 22:36:14','2015-10-19 22:36:14'),(4,4,1,1,'2005-01-01','0000-00-00','2015-10-20 00:03:01','2015-10-20 00:03:01'),(5,1,1,1,'2015-10-13','0000-00-00','2015-10-20 04:55:27','2015-10-20 04:55:27'),(6,1,2,1,'2015-10-13','0001-11-30','2015-10-20 16:54:26','2015-10-20 16:54:26'),(7,2,1,1,'2004-01-01','0001-11-30','2015-10-20 16:57:07','2015-10-20 16:57:07'),(8,1,1,1,'2015-10-13','0001-11-30','2015-10-20 16:57:59','2015-10-20 16:57:59'),(9,1,1,1,'2015-10-13','0000-00-00','2015-10-20 16:58:40','2015-10-20 16:58:40'),(10,1,1,1,'2015-10-13','0000-00-00','2015-10-20 16:59:47','2015-10-20 16:59:47'),(11,1,2,1,'2015-10-13','0001-11-30','2015-10-20 20:21:37','2015-10-20 20:21:37'),(12,1,2,1,'2015-10-13','2015-11-30','2015-10-20 20:21:59','2015-10-20 20:21:59'),(13,2,2,1,'2004-01-01','2015-10-30','2015-10-20 20:26:41','2015-10-20 20:26:41'),(14,4,2,1,'2005-01-01','0001-11-30','2015-10-20 21:13:13','2015-10-20 21:13:13'),(15,1,1,1,'2015-10-13','2015-11-30','2015-10-20 21:13:48','2015-10-20 21:13:48'),(16,1,1,1,'2015-10-13','2015-11-30','2015-10-20 21:15:04','2015-10-20 21:15:04'),(17,2,2,1,'2004-01-01','2015-10-30','2015-10-20 21:16:03','2015-10-20 21:16:03'),(18,5,1,1,'2000-04-01','2015-06-30','2015-10-20 21:29:49','2015-10-20 21:29:49'),(19,1,2,1,'2015-10-13','2015-11-30','2015-10-20 21:45:43','2015-10-20 21:45:43'),(20,4,2,1,'2005-01-01','2006-11-30','2015-10-20 21:49:23','2015-10-20 21:49:23'),(21,6,1,1,'2015-09-29','0000-00-00','2015-10-20 21:55:04','2015-10-20 21:55:04'),(22,7,1,1,'2010-11-01','0000-00-00','2015-10-21 01:13:45','2015-10-21 01:13:45'),(23,1,2,1,'2015-10-13','2015-11-30','2015-10-21 04:33:05','2015-10-21 04:33:05'),(24,4,2,1,'2005-01-01','2006-11-30','2015-10-21 19:52:28','2015-10-21 19:52:28'),(25,8,1,1,'2015-08-01','0000-00-00','2015-10-21 23:14:57','2015-10-21 23:14:57'),(26,8,1,1,'2015-08-01','0000-00-00','2015-10-21 23:16:51','2015-10-21 23:16:51');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_theaters`
--

LOCK TABLES `films_theaters` WRITE;
/*!40000 ALTER TABLE `films_theaters` DISABLE KEYS */;
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
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admin','{\"superuser\":1}','2015-10-19 17:57:39','2015-10-19 17:57:39');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `it_area_id` int(11) NOT NULL,
  `it_level_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_it_course_it_area1_idx` (`it_area_id`),
  KEY `fk_it_course_it_level1_idx` (`it_level_id`),
  CONSTRAINT `fk_it_course_it_area1` FOREIGN KEY (`it_area_id`) REFERENCES `it_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_course_it_level1` FOREIGN KEY (`it_level_id`) REFERENCES `it_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `it_level`
--

DROP TABLE IF EXISTS `it_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `it_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_level`
--

LOCK TABLES `it_level` WRITE;
/*!40000 ALTER TABLE `it_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `it_level` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
INSERT INTO `job_status` VALUES (1,'activo'),(2,'inactivo'),(3,'jubilado');
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
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  `license_scale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license_work_file1_idx` (`work_file_id`),
  KEY `fk_license_license_scale1_idx` (`license_scale_id`),
  CONSTRAINT `fk_license_license_scale1` FOREIGN KEY (`license_scale_id`) REFERENCES `license_scale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_license_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_absent`
--

DROP TABLE IF EXISTS `license_absent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_absent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `absent_date` date DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license_absent_license1_idx` (`license_id`),
  CONSTRAINT `fk_license_absent_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_absent`
--

LOCK TABLES `license_absent` WRITE;
/*!40000 ALTER TABLE `license_absent` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_absent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_exam`
--

DROP TABLE IF EXISTS `license_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_from` date DEFAULT NULL,
  `exam_to` date DEFAULT NULL,
  `total_ability_days` int(11) DEFAULT NULL,
  `matter` varchar(45) DEFAULT NULL,
  `cathedra` varchar(45) DEFAULT NULL,
  `establishment` varchar(45) DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_licence_exam_license1_idx` (`license_id`),
  CONSTRAINT `fk_licence_exam_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_exam`
--

LOCK TABLES `license_exam` WRITE;
/*!40000 ALTER TABLE `license_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_medical`
--

DROP TABLE IF EXISTS `license_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_firstname` varchar(45) DEFAULT NULL,
  `agent_lastname` varchar(45) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `matter` varchar(45) DEFAULT NULL,
  `domicile` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `clinic_name` varchar(100) DEFAULT NULL,
  `clinic_domicile` varchar(200) DEFAULT NULL,
  `clinic_phone` varchar(45) DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license_medical_license1_idx` (`license_id`),
  CONSTRAINT `fk_license_medical_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_medical`
--

LOCK TABLES `license_medical` WRITE;
/*!40000 ALTER TABLE `license_medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_medical_family`
--

DROP TABLE IF EXISTS `license_medical_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_medical_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_firstname` varchar(45) DEFAULT NULL,
  `agent_lastname` varchar(45) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `family_fullname` varchar(200) DEFAULT NULL,
  `family_parent` varchar(45) DEFAULT NULL,
  `family_domicile` varchar(200) DEFAULT NULL,
  `family_phone` varchar(200) DEFAULT NULL,
  `clinic_name` varchar(100) DEFAULT NULL,
  `clinic_domicile` varchar(200) DEFAULT NULL,
  `clinic_phone` varchar(45) DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license_medical_family_license1_idx` (`license_id`),
  CONSTRAINT `fk_license_medical_family_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_medical_family`
--

LOCK TABLES `license_medical_family` WRITE;
/*!40000 ALTER TABLE `license_medical_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_medical_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_scale`
--

DROP TABLE IF EXISTS `license_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_scale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_scale`
--

LOCK TABLES `license_scale` WRITE;
/*!40000 ALTER TABLE `license_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_scale` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (1,'La Matanza','2015-10-19 18:17:06','2015-10-19 18:17:06');
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
  `medical_file` varchar(500) DEFAULT NULL,
  `medical_apto` varchar(100) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `medical_social_id` int(11) DEFAULT NULL,
  `art_id` int(11) DEFAULT NULL,
  `prepaid_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `medical_social`
--

DROP TABLE IF EXISTS `medical_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_social`
--

LOCK TABLES `medical_social` WRITE;
/*!40000 ALTER TABLE `medical_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentions_congrats`
--

DROP TABLE IF EXISTS `mentions_congrats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentions_congrats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jurisdiction` varchar(500) NOT NULL,
  `organization` varchar(500) NOT NULL,
  `motivation` varchar(500) NOT NULL,
  `act_number` varchar(200) NOT NULL,
  `mention_date` date NOT NULL,
  `observation` text,
  `administrative_act_id` int(11) NOT NULL,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mentions_congrats_administrative_act1_idx` (`administrative_act_id`),
  KEY `fk_mentions_congrats_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_mentions_congrats_administrative_act1` FOREIGN KEY (`administrative_act_id`) REFERENCES `administrative_act` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mentions_congrats_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentions_congrats`
--

LOCK TABLES `mentions_congrats` WRITE;
/*!40000 ALTER TABLE `mentions_congrats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentions_congrats` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ochestra`
--

DROP TABLE IF EXISTS `ochestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ochestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stretch_id` int(11) NOT NULL,
  `grouping_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `scale_id` int(11) NOT NULL,
  `act_number` varchar(200) DEFAULT NULL,
  `act_date` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `motivation` text,
  `administrative_act_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_stretch1_idx` (`stretch_id`),
  KEY `fk_table1_grouping1_idx` (`grouping_id`),
  KEY `fk_table1_scale1_idx` (`scale_id`),
  KEY `fk_table1_category1_idx` (`category_id`),
  KEY `fk_adminisitrative_history_administrative_act1_idx` (`administrative_act_id`),
  KEY `fk_adminisitrative_history_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_orchestra_act10` FOREIGN KEY (`administrative_act_id`) REFERENCES `administrative_act` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orchestra_file10` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_category10` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_grouping10` FOREIGN KEY (`grouping_id`) REFERENCES `grouping` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_scale10` FOREIGN KEY (`scale_id`) REFERENCES `scale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_stretch10` FOREIGN KEY (`stretch_id`) REFERENCES `stretch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ochestra`
--

LOCK TABLES `ochestra` WRITE;
/*!40000 ALTER TABLE `ochestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ochestra` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
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
-- Table structure for table `performance_evaluation`
--

DROP TABLE IF EXISTS `performance_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_evaluation` year(4) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `used` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL,
  `grade_evaluation` varchar(100) NOT NULL,
  `bonification` varchar(100) NOT NULL,
  `notification` date NOT NULL,
  `observations` text,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_performance_evaluation_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_performance_evaluation_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_evaluation`
--

LOCK TABLES `performance_evaluation` WRITE;
/*!40000 ALTER TABLE `performance_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_value_unique` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
-- Table structure for table `prepaid`
--

DROP TABLE IF EXISTS `prepaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepaid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepaid`
--

LOCK TABLES `prepaid` WRITE;
/*!40000 ALTER TABLE `prepaid` DISABLE KEYS */;
/*!40000 ALTER TABLE `prepaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_service`
--

DROP TABLE IF EXISTS `private_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_name` varchar(500) NOT NULL,
  `legal_adress` varchar(500) NOT NULL,
  `charge_function` varchar(500) NOT NULL,
  `remunerated` varchar(100) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `out_motivation` text NOT NULL,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_private_service_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_private_service_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TETE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_service`
--

LOCK TABLES `private_service` WRITE;
/*!40000 ALTER TABLE `private_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_service` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Buenos Aires','2015-10-19 18:17:22','2015-10-19 18:17:22'),(2,'Santa Fé','2015-10-19 18:17:33','2015-10-19 18:17:33'),(3,'Chubut','2015-10-19 18:17:41','2015-10-19 18:17:41'),(4,'Córdoba','2015-10-19 18:17:47','2015-10-19 18:17:47');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_service`
--

DROP TABLE IF EXISTS `public_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organism` varchar(500) DEFAULT NULL,
  `review_id` int(11) DEFAULT NULL,
  `motivation` varchar(500) DEFAULT NULL,
  `destination` varchar(500) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `act_number` varchar(100) DEFAULT NULL,
  `act_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  `administrative_act_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_public_service_work_file1_idx` (`work_file_id`),
  KEY `fk_public_service_administrative_act1_idx` (`administrative_act_id`),
  CONSTRAINT `fk_public_service_administrative_act1` FOREIGN KEY (`administrative_act_id`) REFERENCES `administrative_act` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_public_service_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_service`
--

LOCK TABLES `public_service` WRITE;
/*!40000 ALTER TABLE `public_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_service` ENABLE KEYS */;
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
  `level` varchar(255) DEFAULT NULL,
  `executive_function` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
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
  `id_review_role` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_review_role`),
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
-- Table structure for table `review_situation`
--

DROP TABLE IF EXISTS `review_situation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_situation`
--

LOCK TABLES `review_situation` WRITE;
/*!40000 ALTER TABLE `review_situation` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_situation` ENABLE KEYS */;
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
-- Table structure for table `sanction`
--

DROP TABLE IF EXISTS `sanction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution` varchar(500) DEFAULT NULL,
  `act_number` int(11) DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `disciplinary_action` varchar(500) DEFAULT NULL,
  `cause` varchar(500) DEFAULT NULL,
  `santion_from` date DEFAULT NULL,
  `sanction_to` date DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  `administrative_act_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sanction_work_file1_idx` (`work_file_id`),
  KEY `fk_sanction_administrative_act1_idx` (`administrative_act_id`),
  CONSTRAINT `fk_sanction_administrative_act1` FOREIGN KEY (`administrative_act_id`) REFERENCES `administrative_act` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanction_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanction`
--

LOCK TABLES `sanction` WRITE;
/*!40000 ALTER TABLE `sanction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanction` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale`
--

LOCK TABLES `scale` WRITE;
/*!40000 ALTER TABLE `scale` DISABLE KEYS */;
INSERT INTO `scale` VALUES (1,'Presi 001');
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
-- Table structure for table `seizure`
--

DROP TABLE IF EXISTS `seizure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seizure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expedient_number` varchar(200) NOT NULL,
  `date_From` date NOT NULL,
  `charter` varchar(200) NOT NULL,
  `tribunal` varchar(200) NOT NULL,
  `secretary` varchar(200) NOT NULL,
  `cars` varchar(200) NOT NULL,
  `ammount` varchar(200) NOT NULL,
  `worked` varchar(200) NOT NULL,
  `earned` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seizure_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_seizure_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seizure`
--

LOCK TABLES `seizure` WRITE;
/*!40000 ALTER TABLE `seizure` DISABLE KEYS */;
/*!40000 ALTER TABLE `seizure` ENABLE KEYS */;
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
INSERT INTO `split` VALUES (1,'Almagro','2015-10-19 18:20:00','2015-10-19 18:20:00'),(2,'La Boca','2015-10-19 18:20:07','2015-10-19 18:20:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Activo','2015-10-19 18:26:01','2015-10-19 18:26:01'),(2,'Inactivo','2015-10-19 18:26:05','2015-10-19 18:26:05'),(3,'Otro','2015-10-19 18:26:10','2015-10-19 18:26:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplement`
--

LOCK TABLES `supplement` WRITE;
/*!40000 ALTER TABLE `supplement` DISABLE KEYS */;
INSERT INTO `supplement` VALUES (1,'por cargo mayor jerarquia');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `throttle`
--

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
INSERT INTO `throttle` VALUES (1,1,'45.55.64.79',0,0,0,NULL,NULL,NULL),(2,1,'181.47.9.77',0,0,0,NULL,NULL,NULL),(3,1,'190.210.48.233',0,0,0,NULL,NULL,NULL),(4,1,'200.80.149.68',0,0,0,NULL,NULL,NULL),(5,1,'181.47.135.183',0,0,0,NULL,NULL,NULL),(6,1,'200.80.154.194',0,0,0,NULL,NULL,NULL),(7,1,'168.83.83.30',0,0,0,NULL,NULL,NULL),(8,1,'201.234.237.186',0,0,0,NULL,NULL,NULL),(9,1,'200.16.99.56',0,0,0,NULL,NULL,NULL),(10,1,'181.47.180.22',0,0,0,NULL,NULL,NULL),(11,1,'190.173.199.65',0,0,0,NULL,NULL,NULL),(12,1,'191.84.47.171',0,0,0,NULL,NULL,NULL),(13,1,'190.78.199.250',0,0,0,NULL,NULL,NULL),(14,1,'168.96.255.161',0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
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
INSERT INTO `type` VALUES (1,'personal','2015-10-20 00:04:55','2015-10-20 00:04:55'),(2,'laboral','2015-10-20 03:04:07','2015-10-20 03:04:07');
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
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'cms@rrhh.com','cms','$2y$10$UAYdW/Un6ggvyB0KsIYnMOdAzDnSNSx77vQhcdA0sN.deDM.KNY4a',NULL,1,NULL,'2015-10-19 17:58:41','2015-10-21 22:44:47','$2y$10$fq7ikK9Nmqcbsij4eT3tWur6btKEKSbLfo2GXpJhtsQhKXUyxc9T6',NULL,NULL,NULL,'2015-10-19 17:58:41','2015-10-21 22:44:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
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
  `supplement_id` int(11) DEFAULT NULL,
  `additional_id` int(11) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  `dependency_code` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_work_file_employee1_idx` (`employee_id`),
  KEY `fk_work_file_supplement1_idx` (`supplement_id`),
  KEY `fk_work_file_additional1_idx` (`additional_id`),
  KEY `fk_work_file_area1_idx` (`area_id`),
  KEY `fk_work_file_office_idx` (`office_id`),
  CONSTRAINT `fk_work_file_additional1` FOREIGN KEY (`additional_id`) REFERENCES `additional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_office` FOREIGN KEY (`office_id`) REFERENCES `office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
-- Table structure for table `work_file_additional_knowledge`
--

DROP TABLE IF EXISTS `work_file_additional_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_additional_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication` int(11) DEFAULT NULL,
  `publication_name` varchar(50) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `teaching` int(11) DEFAULT NULL,
  `education_level_id` int(11) DEFAULT NULL,
  `departament` varchar(45) DEFAULT NULL,
  `intitution` varchar(45) DEFAULT NULL,
  `work_file_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_work_file_additional_knowledge_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_additional_knowledge_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_additional_knowledge`
--

LOCK TABLES `work_file_additional_knowledge` WRITE;
/*!40000 ALTER TABLE `work_file_additional_knowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_additional_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_congress`
--

DROP TABLE IF EXISTS `work_file_congress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_congress` (
  `work_file_id` int(11) NOT NULL,
  `congress_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`work_file_id`,`congress_id`),
  KEY `fk_work_file_has_congress_congress1_idx` (`congress_id`),
  KEY `fk_work_file_has_congress_work_file_idx` (`work_file_id`),
  CONSTRAINT `fk_work_copy_has_congress_congress1` FOREIGN KEY (`congress_id`) REFERENCES `congress` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_congress_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_congress`
--

LOCK TABLES `work_file_congress` WRITE;
/*!40000 ALTER TABLE `work_file_congress` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_congress` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`work_file_id`,`course_id`),
  KEY `fk_work_file_has_course_course1_idx` (`course_id`),
  KEY `fk_work_file_has_course_work_file__idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_course_work_file_` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id_work_file_education` int(11) NOT NULL AUTO_INCREMENT,
  `work_file_id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_work_file_education`),
  KEY `fk_work_file_has_education_education1_idx` (`education_id`),
  KEY `fk_work_file_has_education_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_education_education1` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_education_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`work_file_id`,`it_course_id`),
  KEY `fk_work_file_has_it_course_it_course1_idx` (`it_course_id`),
  KEY `fk_work_file_has_it_course_work_file_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_it_course_it_course1` FOREIGN KEY (`it_course_id`) REFERENCES `it_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_it_course_work_file` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `work_file_job_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_file_id` int(11) NOT NULL,
  `job_status_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `id_work_file_job_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`work_file_job_status_id`),
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
-- Table structure for table `work_file_language`
--

DROP TABLE IF EXISTS `work_file_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_language` (
  `work_file_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `write_level` varchar(45) DEFAULT NULL,
  `speak_level` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`work_file_id`,`language_id`),
  KEY `|` (`language_id`),
  KEY `fk_work_file_has_language_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_language_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_language_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_language`
--

LOCK TABLES `work_file_language` WRITE;
/*!40000 ALTER TABLE `work_file_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_file_office_tool`
--

DROP TABLE IF EXISTS `work_file_office_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_file_office_tool` (
  `id_work_file_office_tool` int(11) NOT NULL AUTO_INCREMENT,
  `work_file_id` int(11) NOT NULL,
  `office_tool_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_work_file_office_tool`),
  KEY `fk_work_file_has_office_tool_office_tool1_idx` (`office_tool_id`),
  KEY `fk_work_file_has_office_tool_work_file1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_has_office_tool_office_tool1` FOREIGN KEY (`office_tool_id`) REFERENCES `office_tool` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_office_tool_work_file1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_office_tool`
--

LOCK TABLES `work_file_office_tool` WRITE;
/*!40000 ALTER TABLE `work_file_office_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_file_office_tool` ENABLE KEYS */;
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

-- Dump completed on 2015-10-21 15:36:12
