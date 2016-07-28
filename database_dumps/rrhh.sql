-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table rrhh.actors
DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` text COLLATE utf8_unicode_ci NOT NULL,
  `last_name` text COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.actors_films
DROP TABLE IF EXISTS `actors_films`;
CREATE TABLE IF NOT EXISTS `actors_films` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int(10) unsigned NOT NULL,
  `film_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.additional
DROP TABLE IF EXISTS `additional`;
CREATE TABLE IF NOT EXISTS `additional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.administrative_act
DROP TABLE IF EXISTS `administrative_act`;
CREATE TABLE IF NOT EXISTS `administrative_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.administrative_history
DROP TABLE IF EXISTS `administrative_history`;
CREATE TABLE IF NOT EXISTS `administrative_history` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.adress
DROP TABLE IF EXISTS `adress`;
CREATE TABLE IF NOT EXISTS `adress` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.area
DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.art
DROP TABLE IF EXISTS `art`;
CREATE TABLE IF NOT EXISTS `art` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.box_office
DROP TABLE IF EXISTS `box_office`;
CREATE TABLE IF NOT EXISTS `box_office` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revenue` decimal(10,2) NOT NULL,
  `film_id` int(10) unsigned NOT NULL,
  `theater_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.building
DROP TABLE IF EXISTS `building`;
CREATE TABLE IF NOT EXISTS `building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.capacitation_credit
DROP TABLE IF EXISTS `capacitation_credit`;
CREATE TABLE IF NOT EXISTS `capacitation_credit` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_country1_idx` (`country_id`),
  CONSTRAINT `fk_city_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.congress
DROP TABLE IF EXISTS `congress`;
CREATE TABLE IF NOT EXISTS `congress` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.contact_type
DROP TABLE IF EXISTS `contact_type`;
CREATE TABLE IF NOT EXISTS `contact_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`type_id`),
  KEY `fk_contact_type_type1_idx` (`type_id`),
  CONSTRAINT `fk_contact_type_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.course
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.directors
DROP TABLE IF EXISTS `directors`;
CREATE TABLE IF NOT EXISTS `directors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.disability
DROP TABLE IF EXISTS `disability`;
CREATE TABLE IF NOT EXISTS `disability` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.disability_type
DROP TABLE IF EXISTS `disability_type`;
CREATE TABLE IF NOT EXISTS `disability_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.disciplinary_action
DROP TABLE IF EXISTS `disciplinary_action`;
CREATE TABLE IF NOT EXISTS `disciplinary_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.document_type
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.education
DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.education_level
DROP TABLE IF EXISTS `education_level`;
CREATE TABLE IF NOT EXISTS `education_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.education_status
DROP TABLE IF EXISTS `education_status`;
CREATE TABLE IF NOT EXISTS `education_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.email_type
DROP TABLE IF EXISTS `email_type`;
CREATE TABLE IF NOT EXISTS `email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_adress
DROP TABLE IF EXISTS `employee_adress`;
CREATE TABLE IF NOT EXISTS `employee_adress` (
  `employee_id` int(11) NOT NULL,
  `adress_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`adress_id`),
  KEY `fk_employee_has_adress_adress1_idx` (`adress_id`),
  KEY `fk_employee_has_adress_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_has_adress_adress1` FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_adress_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_contact_type
DROP TABLE IF EXISTS `employee_contact_type`;
CREATE TABLE IF NOT EXISTS `employee_contact_type` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_email_type
DROP TABLE IF EXISTS `employee_email_type`;
CREATE TABLE IF NOT EXISTS `employee_email_type` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_has_other_type
DROP TABLE IF EXISTS `employee_has_other_type`;
CREATE TABLE IF NOT EXISTS `employee_has_other_type` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_job_status
DROP TABLE IF EXISTS `employee_job_status`;
CREATE TABLE IF NOT EXISTS `employee_job_status` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_log
DROP TABLE IF EXISTS `employee_log`;
CREATE TABLE IF NOT EXISTS `employee_log` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_log_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_employee_log_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_phone_type
DROP TABLE IF EXISTS `employee_phone_type`;
CREATE TABLE IF NOT EXISTS `employee_phone_type` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.employee_status
DROP TABLE IF EXISTS `employee_status`;
CREATE TABLE IF NOT EXISTS `employee_status` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.family
DROP TABLE IF EXISTS `family`;
CREATE TABLE IF NOT EXISTS `family` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.family_disability_type
DROP TABLE IF EXISTS `family_disability_type`;
CREATE TABLE IF NOT EXISTS `family_disability_type` (
  `family_id` int(11) NOT NULL,
  `disability_type_id` int(11) NOT NULL,
  PRIMARY KEY (`family_id`,`disability_type_id`),
  KEY `fk_family_has_disability_type_disability_type1_idx` (`disability_type_id`),
  KEY `fk_family_has_disability_type_family1_idx` (`family_id`),
  CONSTRAINT `fk_family_has_disability_type_disability_type1` FOREIGN KEY (`disability_type_id`) REFERENCES `disability_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_has_disability_type_family1` FOREIGN KEY (`family_id`) REFERENCES `family` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.films
DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `director_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.films_theaters
DROP TABLE IF EXISTS `films_theaters`;
CREATE TABLE IF NOT EXISTS `films_theaters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int(10) unsigned NOT NULL,
  `theater_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.grouping
DROP TABLE IF EXISTS `grouping`;
CREATE TABLE IF NOT EXISTS `grouping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.institution
DROP TABLE IF EXISTS `institution`;
CREATE TABLE IF NOT EXISTS `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.it_area
DROP TABLE IF EXISTS `it_area`;
CREATE TABLE IF NOT EXISTS `it_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.it_course
DROP TABLE IF EXISTS `it_course`;
CREATE TABLE IF NOT EXISTS `it_course` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.it_level
DROP TABLE IF EXISTS `it_level`;
CREATE TABLE IF NOT EXISTS `it_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.job_status
DROP TABLE IF EXISTS `job_status`;
CREATE TABLE IF NOT EXISTS `job_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.kinship
DROP TABLE IF EXISTS `kinship`;
CREATE TABLE IF NOT EXISTS `kinship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.license
DROP TABLE IF EXISTS `license`;
CREATE TABLE IF NOT EXISTS `license` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.license_absent
DROP TABLE IF EXISTS `license_absent`;
CREATE TABLE IF NOT EXISTS `license_absent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `absent_date` date DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license_absent_license1_idx` (`license_id`),
  CONSTRAINT `fk_license_absent_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.license_exam
DROP TABLE IF EXISTS `license_exam`;
CREATE TABLE IF NOT EXISTS `license_exam` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.license_medical
DROP TABLE IF EXISTS `license_medical`;
CREATE TABLE IF NOT EXISTS `license_medical` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.license_medical_family
DROP TABLE IF EXISTS `license_medical_family`;
CREATE TABLE IF NOT EXISTS `license_medical_family` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.license_scale
DROP TABLE IF EXISTS `license_scale`;
CREATE TABLE IF NOT EXISTS `license_scale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.locality
DROP TABLE IF EXISTS `locality`;
CREATE TABLE IF NOT EXISTS `locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.medical_data
DROP TABLE IF EXISTS `medical_data`;
CREATE TABLE IF NOT EXISTS `medical_data` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.medical_social
DROP TABLE IF EXISTS `medical_social`;
CREATE TABLE IF NOT EXISTS `medical_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.mentions_congrats
DROP TABLE IF EXISTS `mentions_congrats`;
CREATE TABLE IF NOT EXISTS `mentions_congrats` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.ochestra
DROP TABLE IF EXISTS `ochestra`;
CREATE TABLE IF NOT EXISTS `ochestra` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.office
DROP TABLE IF EXISTS `office`;
CREATE TABLE IF NOT EXISTS `office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `building_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_office_building1_idx` (`building_id`),
  CONSTRAINT `fk_office_building1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.office_tool
DROP TABLE IF EXISTS `office_tool`;
CREATE TABLE IF NOT EXISTS `office_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `office_toolcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.other_type
DROP TABLE IF EXISTS `other_type`;
CREATE TABLE IF NOT EXISTS `other_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.performance_evaluation
DROP TABLE IF EXISTS `performance_evaluation`;
CREATE TABLE IF NOT EXISTS `performance_evaluation` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_value_unique` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.phone_type
DROP TABLE IF EXISTS `phone_type`;
CREATE TABLE IF NOT EXISTS `phone_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.prepaid
DROP TABLE IF EXISTS `prepaid`;
CREATE TABLE IF NOT EXISTS `prepaid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.private_service
DROP TABLE IF EXISTS `private_service`;
CREATE TABLE IF NOT EXISTS `private_service` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.province
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.public_service
DROP TABLE IF EXISTS `public_service`;
CREATE TABLE IF NOT EXISTS `public_service` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.review
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.review_role
DROP TABLE IF EXISTS `review_role`;
CREATE TABLE IF NOT EXISTS `review_role` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.review_situation
DROP TABLE IF EXISTS `review_situation`;
CREATE TABLE IF NOT EXISTS `review_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.sanction
DROP TABLE IF EXISTS `sanction`;
CREATE TABLE IF NOT EXISTS `sanction` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.scale
DROP TABLE IF EXISTS `scale`;
CREATE TABLE IF NOT EXISTS `scale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.schedule
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` varchar(500) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.seizure
DROP TABLE IF EXISTS `seizure`;
CREATE TABLE IF NOT EXISTS `seizure` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.split
DROP TABLE IF EXISTS `split`;
CREATE TABLE IF NOT EXISTS `split` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.status
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.stretch
DROP TABLE IF EXISTS `stretch`;
CREATE TABLE IF NOT EXISTS `stretch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.supplement
DROP TABLE IF EXISTS `supplement`;
CREATE TABLE IF NOT EXISTS `supplement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.theaters
DROP TABLE IF EXISTS `theaters`;
CREATE TABLE IF NOT EXISTS `theaters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.throttle
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE IF NOT EXISTS `throttle` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.type
DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.users_groups
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file
DROP TABLE IF EXISTS `work_file`;
CREATE TABLE IF NOT EXISTS `work_file` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_additional_knowledge
DROP TABLE IF EXISTS `work_file_additional_knowledge`;
CREATE TABLE IF NOT EXISTS `work_file_additional_knowledge` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_congress
DROP TABLE IF EXISTS `work_file_congress`;
CREATE TABLE IF NOT EXISTS `work_file_congress` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_copy
DROP TABLE IF EXISTS `work_file_copy`;
CREATE TABLE IF NOT EXISTS `work_file_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_copy_has_congress
DROP TABLE IF EXISTS `work_file_copy_has_congress`;
CREATE TABLE IF NOT EXISTS `work_file_copy_has_congress` (
  `work_file_copy_id` int(11) NOT NULL,
  `congress_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_copy_id`,`congress_id`),
  KEY `fk_work_file_copy_has_congress_congress1_idx` (`congress_id`),
  KEY `fk_work_file_copy_has_congress_work_file_copy1_idx` (`work_file_copy_id`),
  CONSTRAINT `fk_work_file_copy_has_congress_congress1` FOREIGN KEY (`congress_id`) REFERENCES `congress` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_congress_work_file_copy1` FOREIGN KEY (`work_file_copy_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_copy_language
DROP TABLE IF EXISTS `work_file_copy_language`;
CREATE TABLE IF NOT EXISTS `work_file_copy_language` (
  `work_file_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`work_file_id`,`language_id`),
  KEY `fk_work_file_copy_has_language_language1_idx` (`language_id`),
  KEY `fk_work_file_copy_has_language_work_file_copy1_idx` (`work_file_id`),
  CONSTRAINT `fk_work_file_copy_has_language_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_language_work_file_copy1` FOREIGN KEY (`work_file_id`) REFERENCES `work_file_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_course
DROP TABLE IF EXISTS `work_file_course`;
CREATE TABLE IF NOT EXISTS `work_file_course` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_education
DROP TABLE IF EXISTS `work_file_education`;
CREATE TABLE IF NOT EXISTS `work_file_education` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_it_course
DROP TABLE IF EXISTS `work_file_it_course`;
CREATE TABLE IF NOT EXISTS `work_file_it_course` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_job_status
DROP TABLE IF EXISTS `work_file_job_status`;
CREATE TABLE IF NOT EXISTS `work_file_job_status` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_language
DROP TABLE IF EXISTS `work_file_language`;
CREATE TABLE IF NOT EXISTS `work_file_language` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_office_tool
DROP TABLE IF EXISTS `work_file_office_tool`;
CREATE TABLE IF NOT EXISTS `work_file_office_tool` (
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

-- Data exporting was unselected.


-- Dumping structure for table rrhh.work_file_schedule
DROP TABLE IF EXISTS `work_file_schedule`;
CREATE TABLE IF NOT EXISTS `work_file_schedule` (
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

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
