-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: rrhh
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2.1

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional`
--

LOCK TABLES `additional` WRITE;
/*!40000 ALTER TABLE `additional` DISABLE KEYS */;
INSERT INTO `additional` VALUES (1,'Capacitación Terciaria'),(2,'Ejercicio Profesional'),(3,'Mayor Perfeccionamiento Artístico');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (25,NULL,'juncal','2161','2','A',1,1,1,'234','Florida','234234','2015-07-18 20:37:23','2015-07-18 20:37:23',NULL,''),(26,NULL,'juncal','2161','2','A',1,1,1,'234','Florida','234234','2015-07-18 20:54:48','2015-07-18 20:54:48',NULL,''),(27,NULL,'juncal','2161','2','A',1,1,1,'234','Florida','234234','2015-07-18 20:56:25','2015-07-18 20:56:25',NULL,''),(28,NULL,'juncal','2161','2','A',1,1,1,'234','Florida','234234','2015-07-18 20:57:17','2015-07-18 20:57:17',NULL,''),(29,NULL,'juncal','2161','2','A',1,1,1,'234','Florida','234234','2015-07-18 20:58:08','2015-07-18 20:58:08',NULL,''),(30,NULL,'juncal','2161','2','A',1,1,1,'234','Florida','234234','2015-07-18 21:09:00','2015-07-18 21:09:00',NULL,''),(31,'Real','Juncal','2161','2','A',1,3,3,'4345','Recoleta','49023909','2015-07-26 07:33:09','2015-07-26 07:38:16','2015-07-26 07:38:16',''),(32,'Real','Juncal','2161','2','A',1,3,3,'4345','Recoleta','49023909','2015-07-26 07:33:14','2015-07-26 07:33:17','2015-07-26 07:33:17',''),(33,'envios','Uriburu','980','PB','2',1,3,3,'3434','Recoleta','34234','2015-07-26 07:34:47','2015-07-26 07:34:47',NULL,''),(34,'envios','Uriburu','980','PB','2',1,3,3,'3434','Recoleta','34234','2015-07-26 07:34:49','2015-07-26 07:34:49',NULL,''),(35,'envios','Uriburu','980','PB','2',1,3,3,'3434','Recoleta','34234','2015-07-26 07:34:59','2015-07-26 07:41:52','2015-07-26 07:41:52',''),(36,'Legal','Juncal','2161','2','A',1,3,3,'4234','Recoleta','123123','2015-07-26 07:38:52','2015-07-26 07:41:12','2015-07-26 07:41:12',''),(37,'Real','Melo','2693','0','1',1,3,1,'32423','Recoleta','544455345','2015-07-30 07:28:38','2015-07-30 07:28:38',NULL,''),(38,'Real','Juncal','2161','2','A',1,3,3,'7777','Recoleta','555555555','2015-07-31 03:20:29','2015-07-31 03:20:39',NULL,'');
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
INSERT INTO `area` VALUES (1,'Admistrativa'),(2,'Tecnología'),(3,'Recursos Humanos'),(4,'Diseño');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
INSERT INTO `art` VALUES (1,'Art One','2015-07-30 06:07:57','2015-07-30 06:07:57',NULL),(2,'Art Two','2015-07-30 06:08:03','2015-07-30 06:08:12',NULL),(3,'Art Three','2015-07-30 06:08:08','2015-07-30 06:08:08',NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Edificio Colpatria'),(2,'Edificio Bacatá');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Vocal'),(2,'Delegado'),(3,'Presidente'),(4,'1ª Categoría'),(5,'2ª Categoría'),(6,'3ª Categoría'),(7,'4ª Categoría'),(8,'5ª Categoría'),(9,'Corista'),(10,'Bailarín'),(11,'Pianista Acompañante'),(12,'Coreógrafo');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congress`
--

LOCK TABLES `congress` WRITE;
/*!40000 ALTER TABLE `congress` DISABLE KEYS */;
INSERT INTO `congress` VALUES (1,'congreso uno ','asdasdasd','aasdaklsdñaksdl','2015-07-30','','2015-07-29 06:09:50','2015-07-29 06:09:50',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Oxford University','Linux Avanzado',NULL,'','2015-07-29 03:30:32','2015-07-29 03:30:32',NULL),(2,'Oxford University','Linux Basico',NULL,'','2015-07-29 03:31:23','2015-07-29 03:31:23',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability`
--

LOCK TABLES `disability` WRITE;
/*!40000 ALTER TABLE `disability` DISABLE KEYS */;
INSERT INTO `disability` VALUES (6,'20/15/0701','0000-00-00','0000-00-00','/var/www/html/rrhh/public/upload/20150730114718coffee-peloton.jpg','Entidad Uno','','2015-07-31 02:47:18','2015-07-31 02:47:18',NULL,1,6),(7,'2015-07-30','2015-07-30','2015-08-06','/var/www/html/rrhh/public/upload/20150731124006coffee-peloton.jpg','Entidad nueva','','2015-07-31 03:40:07','2015-07-31 03:40:07',NULL,1,7),(8,'2015-08-11','2015-08-11','2015-08-12','/var/www/html/rrhh/public/upload/20150731124100coffee-peloton.jpg','Otra entidad','','2015-07-31 03:41:00','2015-07-31 03:41:00',NULL,2,7),(13,'20/15/0811','0000-00-00','0000-00-00','/var/www/html/rrhh/public/upload/20150731030857coffee-peloton.jpg','Otra entidad','','2015-07-31 06:08:57','2015-07-31 06:08:57',NULL,2,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability_type`
--

LOCK TABLES `disability_type` WRITE;
/*!40000 ALTER TABLE `disability_type` DISABLE KEYS */;
INSERT INTO `disability_type` VALUES (1,'Disability one','2015-07-26 07:14:29','2015-07-26 04:14:29'),(2,'Disability two','2015-07-26 07:14:37','2015-07-26 04:14:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
INSERT INTO `document_type` VALUES (1,'DNI'),(2,'Pasaporte'),(3,'Cédula'),(4,'Cédula de Extranjería');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'Ingeniería de Sistemas','2010-07-01','2015-07-22','',1,2,2,'2015-07-29 03:29:12','2015-07-29 03:29:12',NULL),(2,'Ingeniería de Software','2015-07-31',NULL,'',3,3,2,'2015-07-29 03:29:57','2015-07-29 03:29:57',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_level`
--

LOCK TABLES `education_level` WRITE;
/*!40000 ALTER TABLE `education_level` DISABLE KEYS */;
INSERT INTO `education_level` VALUES (1,'Pregrado'),(2,'Posgrado'),(3,'Maestría'),(4,'Doctorado'),(5,'Técnico'),(6,'Tecnológico');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_status`
--

LOCK TABLES `education_status` WRITE;
/*!40000 ALTER TABLE `education_status` DISABLE KEYS */;
INSERT INTO `education_status` VALUES (1,'En Curso'),(2,'Terminado');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'32423423','Gonzalo','Higuain','M','1223123','1990-04-14','soltero',3,1,'2015-07-06 01:34:31','2015-07-30 05:21:53',NULL),(2,'32423423','Gonzalo','Higuain',NULL,'1223123',NULL,'casado',3,1,'2015-07-06 01:37:20','2015-07-06 01:37:20',NULL),(3,'4323423','xxxx','3asdasd',NULL,'234234',NULL,'soltero',3,3,'2015-07-06 01:37:59','2015-07-06 01:37:59',NULL),(4,'4534958','Gil','Antonio',NULL,'453453',NULL,'casado',2,2,'2015-07-06 02:49:01','2015-07-06 02:49:01',NULL),(5,'4534958','Gil','Antonio',NULL,'453453',NULL,'casado',2,2,'2015-07-06 03:10:02','2015-07-06 03:10:02',NULL),(8,'45345345','xxxxxxx','xxxxxxx',NULL,'534534534',NULL,'casado',2,2,'2015-07-11 22:36:29','2015-07-11 22:36:29',NULL),(10,'4234234','test','test',NULL,'3443434',NULL,'separado',3,1,'2015-07-18 18:43:41','2015-07-18 18:43:41',NULL),(11,'44444','Perez','Juan','M','123456','1980-03-01','viudo',1,2,'2015-07-31 03:14:40','2015-07-31 03:14:40',NULL);
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
INSERT INTO `employee_adress` VALUES (10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(11,38);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contact_type`
--

LOCK TABLES `employee_contact_type` WRITE;
/*!40000 ALTER TABLE `employee_contact_type` DISABLE KEYS */;
INSERT INTO `employee_contact_type` VALUES (1,1,2,'mail@corporativo.com','','2015-07-26 07:30:25','2015-07-27 00:31:17','2015-07-27 00:31:17'),(2,1,4,'55555555 ext. 4040','','2015-07-26 07:30:55','2015-07-27 00:31:14','2015-07-27 00:31:14'),(3,1,5,'3203445300','','2015-07-26 07:24:48','2015-07-27 00:31:09','2015-07-27 00:31:09'),(4,8,1,'dneira04@gmail.com','','2015-07-11 23:39:51','2015-07-11 23:39:51',NULL),(5,8,3,'5555555','','2015-07-11 23:01:13','2015-07-29 05:47:00','2015-07-29 05:47:00'),(6,8,4,'9999','','2015-07-12 00:06:22','2015-07-12 00:06:22',NULL),(7,8,5,'234234234','','2015-07-11 22:43:41','2015-07-11 22:43:41',NULL),(8,10,2,'correo@mail.com','','2015-07-18 19:04:23','2015-07-18 19:04:23',NULL),(9,10,3,'555555','','2015-07-18 19:03:46','2015-07-18 19:03:46',NULL),(10,10,4,'234234234','','2015-07-18 18:43:54','2015-07-18 18:43:54',NULL),(11,1,5,'3213123123','','2015-07-27 00:43:23','2015-07-29 05:43:44','2015-07-29 05:43:44'),(12,1,5,'3213123123','','2015-07-27 00:43:25','2015-07-29 05:43:44','2015-07-29 05:43:44'),(13,1,1,'aaaa@aaaa.com','','2015-07-27 00:46:16','2015-07-29 05:44:10','2015-07-29 05:44:10'),(14,1,1,'aaaa@aaaa.com','','2015-07-27 00:46:18','2015-07-29 05:44:10','2015-07-29 05:44:10'),(15,1,1,'aaaa@aaaa.com','','2015-07-27 00:46:18','2015-07-29 05:44:10','2015-07-29 05:44:10'),(16,1,5,'33333333','','2015-07-29 05:46:52','2015-07-30 07:23:35',NULL),(17,1,5,'4444444444','','2015-07-29 05:46:55','2015-07-29 05:48:43','2015-07-29 05:48:43'),(18,1,5,'4444444444423423423','','2015-07-29 05:46:57','2015-07-29 05:48:38','2015-07-29 05:48:38'),(19,1,5,'sdas','','2015-07-29 05:48:34','2015-07-29 05:48:34',NULL),(20,1,5,'132312132132','','2015-07-29 05:57:36','2015-07-29 05:57:47','2015-07-29 05:57:47'),(21,1,5,'132312132132','','2015-07-29 05:57:39','2015-07-29 05:57:43','2015-07-29 05:57:43'),(22,1,5,'132312132132','','2015-07-29 05:57:39','2015-07-29 05:57:39',NULL),(23,1,5,'132312132132','','2015-07-29 05:57:39','2015-07-29 05:57:39',NULL),(24,1,2,'','','2015-07-29 05:59:10','2015-07-29 05:59:10',NULL),(25,1,5,'4444','','2015-07-30 07:19:31','2015-07-30 07:19:31',NULL),(26,11,3,'23456789','','2015-07-31 03:16:09','2015-07-31 03:16:09',NULL),(27,11,5,'1544446777','','2015-07-31 03:16:20','2015-07-31 03:16:20',NULL),(28,11,1,'personal@email.com','','2015-07-31 03:16:29','2015-07-31 03:16:29',NULL),(29,11,2,'juan@laburo.com','','2015-07-31 03:16:41','2015-07-31 03:16:41',NULL),(30,11,4,'1188888888','','2015-07-31 03:17:56','2015-07-31 03:19:18','2015-07-31 03:19:18');
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
  `from` date NOT NULL,
  `to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee_status`),
  KEY `fk_employee_has_status_status1_idx` (`status_id`),
  KEY `fk_employee_has_status_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_status_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_status_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_status`
--

LOCK TABLES `employee_status` WRITE;
/*!40000 ALTER TABLE `employee_status` DISABLE KEYS */;
INSERT INTO `employee_status` VALUES (1,1,1,'2015-07-01','2015-07-08','2015-07-30 06:49:10','2015-07-30 06:49:10'),(2,1,2,'2015-07-09','2015-07-15','2015-07-30 06:49:43','2015-07-30 06:49:43'),(3,1,3,'2015-07-16','2015-07-22','2015-07-30 06:50:36','2015-07-30 06:50:36'),(5,11,1,'2015-01-01','0000-00-00','2015-07-31 03:14:40','2015-07-31 03:14:40'),(6,11,2,'2015-02-01','0000-00-00','2015-07-31 03:30:42','2015-07-31 03:30:42'),(7,11,3,'2015-03-01','2015-03-30','2015-07-31 03:32:13','2015-07-31 03:32:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES (1,'Marta','Polo',2,'32234234','F','1965-02-28','','','2015-07-26 10:12:26','2015-07-26 10:59:48','2015-07-26 10:59:48','',1),(3,'Neira','Albey',1,'23492384','M','1966-02-28','','','2015-07-26 10:15:00','2015-07-26 10:15:00',NULL,'',1),(5,'Marta','Polo',2,'4234234','F','1965-02-28','','','2015-07-26 23:49:45','2015-07-26 23:49:45',NULL,'',1);
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
INSERT INTO `family_disability_type` VALUES (3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouping`
--

LOCK TABLES `grouping` WRITE;
/*!40000 ALTER TABLE `grouping` DISABLE KEYS */;
INSERT INTO `grouping` VALUES (1,'General'),(2,'Profesional'),(3,'Cuerpo de Baile'),(4,'Músico Instrumentista'),(5,'Músico Cantante'),(6,'Consultor');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (1,'Universidad de Buenos Aires'),(2,'Universidad Tecnológica Nacional'),(3,'Universidad Nacional de La Plata');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_area`
--

LOCK TABLES `it_area` WRITE;
/*!40000 ALTER TABLE `it_area` DISABLE KEYS */;
INSERT INTO `it_area` VALUES (1,'Desarrollo Web'),(2,'Bases de Datos'),(3,'Desarrollo Móvil'),(4,'Administración Servidores');
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
  `it_level_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `it_level`
--

LOCK TABLES `it_level` WRITE;
/*!40000 ALTER TABLE `it_level` DISABLE KEYS */;
INSERT INTO `it_level` VALUES (1,'Básico'),(2,'Intermedio'),(3,'Avanzado');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
INSERT INTO `job_status` VALUES (1,'En Actividad'),(2,'En trámite'),(3,'Jubilado'),(4,'Fallecido'),(5,'Baja por renuncia'),(6,'Baja por cesantía'),(7,'Baja por exoneración'),(8,'Baja por traslado'),(9,'Cargo Transferido');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kinship`
--

LOCK TABLES `kinship` WRITE;
/*!40000 ALTER TABLE `kinship` DISABLE KEYS */;
INSERT INTO `kinship` VALUES (1,'Padre'),(2,'Madre'),(3,'Hermano(a)'),(4,'Abuelo(a)'),(5,'Tío(a)'),(6,'Cónyuge'),(7,'Primo(a)');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Español'),(2,'Inglés'),(3,'Francés'),(4,'Portugués'),(5,'Alemán'),(6,'Ruso'),(7,'Japonés');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (1,'Vicente Lopez','2015-07-05 23:18:12','2015-07-05 23:18:12'),(2,'Olivos','2015-07-06 00:41:39','2015-07-06 00:41:39'),(3,'Capital Federal','2015-07-26 07:31:30','2015-07-26 07:31:30');
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
  `medical_social_id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `prepaid_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medical_data_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_medical_data_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_data`
--

LOCK TABLES `medical_data` WRITE;
/*!40000 ALTER TABLE `medical_data` DISABLE KEYS */;
INSERT INTO `medical_data` VALUES (6,'12345','A+','/var/www/html/rrhh/public/upload/201507301147','Apto One',1,1,1,1,'2015-07-31 02:47:18','2015-07-31 02:47:18'),(7,'848482','A+','/var/www/html/rrhh/public/upload/201507311240','Otro Apto Médico ',11,3,3,3,'2015-07-31 03:40:06','2015-07-31 03:42:48'),(9,'848482','A+','Cualquiera','Otro Apto Médico',11,1,1,1,'2015-07-31 06:08:57','2015-07-31 06:08:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_social`
--

LOCK TABLES `medical_social` WRITE;
/*!40000 ALTER TABLE `medical_social` DISABLE KEYS */;
INSERT INTO `medical_social` VALUES (1,'Social Security One','2015-07-30 06:07:09','2015-07-30 06:07:09',NULL),(2,'Social Security Two','2015-07-30 06:07:19','2015-07-30 06:07:19',NULL),(3,'Social Security Three','2015-07-30 06:07:28','2015-07-30 06:07:28',NULL);
/*!40000 ALTER TABLE `medical_social` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'Oficina 505',1),(2,'Oficina 2101',2),(3,'Oficina 3202',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepaid`
--

LOCK TABLES `prepaid` WRITE;
/*!40000 ALTER TABLE `prepaid` DISABLE KEYS */;
INSERT INTO `prepaid` VALUES (1,'Prepaid one','2015-07-30 06:07:37','2015-07-30 06:07:37',NULL),(2,'Prepaid two','2015-07-30 06:07:42','2015-07-30 06:07:42',NULL),(3,'Prepaid three','2015-07-30 06:07:50','2015-07-30 06:07:50',NULL);
/*!40000 ALTER TABLE `prepaid` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'2015-07-27','2014-07-24','2015-07-25','2015-07-28 05:37:10','2015-07-28 05:37:10',NULL,5,1,2,3,4,'D','IV',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_role`
--

LOCK TABLES `review_role` WRITE;
/*!40000 ALTER TABLE `review_role` DISABLE KEYS */;
INSERT INTO `review_role` VALUES (3,1,1,'','2015-06-01','2015-06-30','Descripción Rol Uno','2015-07-28 06:21:30','2015-07-28 06:21:30',NULL),(4,1,2,'','2015-07-01','2015-07-31','Descripción Rol Dos','2015-07-28 06:21:46','2015-07-28 06:21:46',NULL),(5,1,3,'','2015-09-01','2015-09-30','Descripcion Rol Tres','2015-07-28 06:39:39','2015-07-28 06:39:39',NULL),(6,1,1,'','2015-10-01','2015-10-30','Volví al estado uno','2015-07-28 06:41:56','2015-07-28 06:41:56',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Rol Uno'),(2,'Rol Dos'),(3,'Role Tres');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale`
--

LOCK TABLES `scale` WRITE;
/*!40000 ALTER TABLE `scale` DISABLE KEYS */;
INSERT INTO `scale` VALUES (1,'Planta Permanente'),(2,'Planta Transitoria'),(3,'Contrato ART 9'),(4,'Contrato de Obra'),(5,'Músico'),(6,'Músico Transitorio'),(7,'Designación Transitoria'),(8,'Cargo de Mayores Jerarquías'),(9,'Descentralizado'),(10,'Desconcentrado'),(11,'Extra Escalafonario'),(12,'Adscrito de otro Organismo'),(13,'Personal Docente'),(14,'Cargo Político'),(15,'Ad-Honorem');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (4,'lunes  martes miercoles jueves viernes ','09:30:00','18:30:00'),(5,'lunes  martes miercoles jueves viernes ','09:30:00','18:30:00'),(6,'lunes  martes miercoles jueves viernes ','09:30:00','18:30:00'),(7,'lunes  martes miercoles jueves viernes ','09:30:00','18:30:00'),(8,'lunes  martes miercoles jueves viernes sabado ','09:30:00','18:30:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `split`
--

LOCK TABLES `split` WRITE;
/*!40000 ALTER TABLE `split` DISABLE KEYS */;
INSERT INTO `split` VALUES (1,'Florida','2015-07-05 23:18:21','2015-07-06 00:40:29'),(2,'Munro','2015-07-06 00:41:16','2015-07-06 00:41:16'),(3,'Recoleta','2015-07-26 07:31:50','2015-07-26 07:31:50'),(4,'Retiro','2015-07-26 07:31:59','2015-07-26 07:31:59'),(5,'Palermo','2015-07-26 07:32:05','2015-07-26 07:32:05');
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
INSERT INTO `status` VALUES (1,'Status One','2015-07-05 22:02:40','2015-07-30 06:32:23'),(2,'Status Two','2015-07-05 22:02:45','2015-07-30 06:32:29'),(3,'Status Three','2015-07-30 06:32:37','2015-07-30 06:32:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stretch`
--

LOCK TABLES `stretch` WRITE;
/*!40000 ALTER TABLE `stretch` DISABLE KEYS */;
INSERT INTO `stretch` VALUES (1,'General'),(2,'Intermedio'),(3,'Avanzado');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplement`
--

LOCK TABLES `supplement` WRITE;
/*!40000 ALTER TABLE `supplement` DISABLE KEYS */;
INSERT INTO `supplement` VALUES (1,'Por Zona'),(2,'Por Jefatura'),(3,'Por Función Específica-técnica'),(4,'Por Función Específica-informática');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file`
--

LOCK TABLES `work_file` WRITE;
/*!40000 ALTER TABLE `work_file` DISABLE KEYS */;
INSERT INTO `work_file` VALUES (4,'2015-07-05',1,'',4,2,2,3,NULL,'','2015-07-27 06:18:25','2015-07-27 06:18:25',NULL),(5,'2015-07-25',1,'',4,2,2,3,NULL,'','2015-07-27 06:27:11','2015-07-28 01:41:33',NULL);
/*!40000 ALTER TABLE `work_file` ENABLE KEYS */;
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
INSERT INTO `work_file_congress` VALUES (5,1,'2015-07-29 06:09:50','2015-07-29 06:09:50',NULL);
/*!40000 ALTER TABLE `work_file_congress` ENABLE KEYS */;
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
INSERT INTO `work_file_course` VALUES (5,1,'2015-07-29 03:30:32','2015-07-29 03:30:32',NULL,NULL),(5,2,'2015-07-29 03:31:23','2015-07-29 03:31:23',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_education`
--

LOCK TABLES `work_file_education` WRITE;
/*!40000 ALTER TABLE `work_file_education` DISABLE KEYS */;
INSERT INTO `work_file_education` VALUES (1,5,1,'2015-07-29 03:29:12','2015-07-29 03:29:12',NULL),(2,5,2,'2015-07-29 03:29:57','2015-07-29 03:29:57',NULL);
/*!40000 ALTER TABLE `work_file_education` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_file_job_status`
--

LOCK TABLES `work_file_job_status` WRITE;
/*!40000 ALTER TABLE `work_file_job_status` DISABLE KEYS */;
INSERT INTO `work_file_job_status` VALUES (1,4,1,'2014-07-25','2015-07-24','',0,NULL,NULL),(2,5,1,'2014-07-25','2015-07-24','',0,NULL,NULL),(3,5,1,'2014-07-25','2015-07-24','',0,'2015-07-27 06:41:45','2015-07-27 03:41:45'),(4,5,1,'2014-07-25','2015-07-24','',0,'2015-07-27 06:42:41','2015-07-27 03:42:41'),(5,5,1,'2014-07-25','2015-07-24','',0,'2015-07-28 01:41:33','2015-07-27 22:41:33');
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
INSERT INTO `work_file_language` VALUES (5,1,'2015-07-29 04:21:27','2015-07-29 04:21:27',NULL,'Avanzado','Avanzado');
/*!40000 ALTER TABLE `work_file_language` ENABLE KEYS */;
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
INSERT INTO `work_file_schedule` VALUES (4,4,'','2014-07-25','2015-07-24','2015-07-27 06:18:25','2015-07-27 06:18:25',NULL),(5,5,'','2014-07-25','2015-07-24','2015-07-27 06:27:12','2015-07-27 06:27:12',NULL),(5,6,'','2014-07-25','2015-07-24','2015-07-27 06:41:46','2015-07-27 06:41:46',NULL),(5,7,'','2014-07-25','2015-07-24','2015-07-27 06:42:41','2015-07-27 06:42:41',NULL),(5,8,'','2014-07-25','2015-07-24','2015-07-28 01:41:33','2015-07-28 01:41:33',NULL);
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

-- Dump completed on 2015-07-31  1:15:38
