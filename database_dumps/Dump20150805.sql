-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema rrhh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rrhh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rrhh` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `rrhh` ;

-- -----------------------------------------------------
-- Table `rrhh`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`country` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`city` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `country_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_country1_idx` (`country_id` ASC),
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `rrhh`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`contact_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`contact_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`id`, `type_id`),
  INDEX `fk_contact_type_type1_idx` (`type_id` ASC),
  CONSTRAINT `fk_contact_type_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `rrhh`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`actors` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`actors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `last_name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `birth_date` DATE NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`actors_films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`actors_films` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`actors_films` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_id` INT(10) UNSIGNED NOT NULL,
  `film_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`additional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`additional` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`additional` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`area` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`locality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`locality` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`locality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`province` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`province` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`split`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`split` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`split` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`adress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`adress` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`adress` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `number` VARCHAR(45) NULL,
  `floor` VARCHAR(45) NULL,
  `department` VARCHAR(45) NULL,
  `province_id` INT NOT NULL,
  `locality_id` INT NOT NULL,
  `split_id` INT NOT NULL,
  `postal_code` VARCHAR(45) NULL DEFAULT NULL,
  `neighborhood` VARCHAR(255) NULL,
  `phone` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `active` BIT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  INDEX `fk_adress_province1_idx` (`province_id` ASC),
  INDEX `fk_adress_locality1_idx` (`locality_id` ASC),
  INDEX `fk_adress_split1_idx` (`split_id` ASC),
  CONSTRAINT `fk_adress_locality1`
    FOREIGN KEY (`locality_id`)
    REFERENCES `rrhh`.`locality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adress_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `rrhh`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adress_split1`
    FOREIGN KEY (`split_id`)
    REFERENCES `rrhh`.`split` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`box_office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`box_office` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`box_office` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `revenue` DECIMAL(10,2) NOT NULL,
  `film_id` INT(10) UNSIGNED NOT NULL,
  `theater_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`building`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`building` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`building` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`category` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`document_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`document_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`document_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`congress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`congress` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`congress` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `especiality` VARCHAR(45) NULL,
  `certificate` VARCHAR(45) NULL,
  `end_date` DATE NULL,
  `ended` BIT NULL DEFAULT b'1',
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`directors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`directors` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`directors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `last_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`disability_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`disability_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`disability_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `document` VARCHAR(100) NULL,
  `lastname` VARCHAR(100) NULL,
  `name` VARCHAR(100) NULL,
  `gender` CHAR NULL,
  `cuil` VARCHAR(100) NULL,
  `birthdate` DATE NULL,
  `marital_status` VARCHAR(45) NULL,
  `document_type_id` INT NOT NULL,
  `city_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_document_type_idx` (`document_type_id` ASC),
  INDEX `fk_employee_city1_idx` (`city_id` ASC),
  CONSTRAINT `fk_employee_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `rrhh`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_document_type`
    FOREIGN KEY (`document_type_id`)
    REFERENCES `rrhh`.`document_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`art`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`art` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`art` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`prepaid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`prepaid` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`prepaid` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`medical_social`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`medical_social` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`medical_social` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`medical_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`medical_data` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`medical_data` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(45) NULL,
  `blood_type` VARCHAR(45) NULL,
  `medical_file` VARCHAR(45) NULL,
  `medical_apto` VARCHAR(45) NULL,
  `employee_id` INT NOT NULL,
  `art_id` INT NOT NULL,
  `prepaid_id` INT NOT NULL,
  `medical_social_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medical_data_employee1_idx` (`employee_id` ASC),
  INDEX `fk_medical_data_art1_idx` (`art_id` ASC),
  INDEX `fk_medical_data_prepaid1_idx` (`prepaid_id` ASC),
  INDEX `fk_medical_data_medical_social1_idx` (`medical_social_id` ASC),
  CONSTRAINT `fk_medical_data_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medical_data_art1`
    FOREIGN KEY (`art_id`)
    REFERENCES `rrhh`.`art` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medical_data_prepaid1`
    FOREIGN KEY (`prepaid_id`)
    REFERENCES `rrhh`.`prepaid` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medical_data_medical_social1`
    FOREIGN KEY (`medical_social_id`)
    REFERENCES `rrhh`.`medical_social` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`disability`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`disability` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`disability` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `generated_date` VARCHAR(45) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `certificate_url` VARCHAR(500) NULL,
  `certificate_creator` VARCHAR(255) NULL,
  `active` BIT NULL DEFAULT b'1',
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `disability_type_id` INT NOT NULL,
  `medical_data_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_disability_disability_type1_idx` (`disability_type_id` ASC),
  INDEX `fk_disability_medical_data1_idx` (`medical_data_id` ASC),
  CONSTRAINT `fk_disability_disability_type1`
    FOREIGN KEY (`disability_type_id`)
    REFERENCES `rrhh`.`disability_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disability_medical_data1`
    FOREIGN KEY (`medical_data_id`)
    REFERENCES `rrhh`.`medical_data` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`course` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `certificate` VARCHAR(45) NULL,
  `end_date` DATE NULL,
  `ended` BIT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`kinship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`kinship` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`kinship` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`family`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`family` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`family` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `kinship_id` INT NOT NULL,
  `document` VARCHAR(255) NULL,
  `gender` CHAR NULL,
  `birthdate` DATE NULL,
  `living_with` BIT NULL,
  `garden_assignation` BIT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `active` BIT NOT NULL DEFAULT b'1',
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_family_kinship1_idx` (`kinship_id` ASC),
  INDEX `fk_family_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_family_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_kinship1`
    FOREIGN KEY (`kinship_id`)
    REFERENCES `rrhh`.`kinship` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`email_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`email_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`email_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`family_disability_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`family_disability_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`family_disability_type` (
  `family_id` INT NOT NULL,
  `disability_type_id` INT NOT NULL,
  PRIMARY KEY (`family_id`, `disability_type_id`),
  INDEX `fk_family_has_disability_type_disability_type1_idx` (`disability_type_id` ASC),
  INDEX `fk_family_has_disability_type_family1_idx` (`family_id` ASC),
  CONSTRAINT `fk_family_has_disability_type_disability_type1`
    FOREIGN KEY (`disability_type_id`)
    REFERENCES `rrhh`.`disability_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_has_disability_type_family1`
    FOREIGN KEY (`family_id`)
    REFERENCES `rrhh`.`family` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_email_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_email_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_email_type` (
  `employee_id` INT NOT NULL,
  `email_type_id` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `active` BIT NOT NULL DEFAULT b'1',
  PRIMARY KEY (`employee_id`, `email_type_id`),
  INDEX `fk_employee_has_email_type_email_type1_idx` (`email_type_id` ASC),
  INDEX `fk_employee_has_email_type_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_has_email_type_email_type1`
    FOREIGN KEY (`email_type_id`)
    REFERENCES `rrhh`.`email_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_email_type_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_log` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_log` (
  `id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `code` INT NULL,
  `detail` VARCHAR(45) NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_log_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_log_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`education_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`education_level` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`education_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`education_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`education_status` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`education_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`institution` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`institution` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`education` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `education_title` VARCHAR(500) NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `ended` BIT NULL DEFAULT b'1',
  `education_level_id` INT NOT NULL,
  `institution_id` INT NOT NULL,
  `education_status_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_education_education_level1_idx` (`education_level_id` ASC),
  INDEX `fk_education_institution1_idx` (`institution_id` ASC),
  INDEX `fk_education_education_status1_idx` (`education_status_id` ASC),
  CONSTRAINT `fk_education_education_level1`
    FOREIGN KEY (`education_level_id`)
    REFERENCES `rrhh`.`education_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_education_status1`
    FOREIGN KEY (`education_status_id`)
    REFERENCES `rrhh`.`education_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_institution1`
    FOREIGN KEY (`institution_id`)
    REFERENCES `rrhh`.`institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_contact_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_contact_type` (
  `id_employee_contact_type` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `contact_type_id` INT NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  `active` BIT NULL DEFAULT b'1',
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id_employee_contact_type`),
  INDEX `fk_employee_has_contact_type_contact_type1_idx` (`contact_type_id` ASC),
  INDEX `fk_employee_has_contact_type_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_has_contact_type_contact_type1`
    FOREIGN KEY (`contact_type_id`)
    REFERENCES `rrhh`.`contact_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_contact_type_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`other_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`other_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`other_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_has_other_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_has_other_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_has_other_type` (
  `employee_id` INT NOT NULL,
  `other_type_id` INT NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  `active` BIT NOT NULL DEFAULT b'1',
  PRIMARY KEY (`employee_id`, `other_type_id`),
  INDEX `fk_employee_has_other_type_other_type1_idx` (`other_type_id` ASC),
  INDEX `fk_employee_has_other_type_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_has_other_type_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_other_type_other_type1`
    FOREIGN KEY (`other_type_id`)
    REFERENCES `rrhh`.`other_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_adress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_adress` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_adress` (
  `employee_id` INT NOT NULL,
  `adress_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `adress_id`),
  INDEX `fk_employee_has_adress_adress1_idx` (`adress_id` ASC),
  INDEX `fk_employee_has_adress_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_has_adress_adress1`
    FOREIGN KEY (`adress_id`)
    REFERENCES `rrhh`.`adress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_adress_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`status` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_status` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_status` (
  `id_employee_status` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `from` DATE NOT NULL DEFAULT '0000-00-00 00:00:00',
  `to` DATE NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  INDEX `fk_employee_has_status_status1_idx` (`status_id` ASC),
  INDEX `fk_employee_has_status_employee1_idx` (`employee_id` ASC),
  PRIMARY KEY (`id_employee_status`),
  CONSTRAINT `fk_employee_has_status_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_status_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `rrhh`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`phone_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`phone_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`phone_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_phone_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_phone_type` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_phone_type` (
  `employee_id` INT NOT NULL,
  `phone_type_id` INT NOT NULL,
  `number` VARCHAR(100) NOT NULL,
  `active` VARCHAR(45) NULL,
  PRIMARY KEY (`employee_id`, `phone_type_id`),
  INDEX `fk_employee_has_phone_type_phone_type1_idx` (`phone_type_id` ASC),
  INDEX `fk_employee_has_phone_type_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_has_phone_type_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_phone_type_phone_type1`
    FOREIGN KEY (`phone_type_id`)
    REFERENCES `rrhh`.`phone_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`job_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`job_status` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`job_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`employee_job_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`employee_job_status` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`employee_job_status` (
  `employee_id` INT NOT NULL,
  `job_status_id` INT NOT NULL,
  `start_date` TIMESTAMP NULL,
  `end_date` TIMESTAMP NULL,
  `active` BIT NOT NULL DEFAULT b'1',
  PRIMARY KEY (`employee_id`, `job_status_id`),
  INDEX `fk_employee_has_job_status_job_status1_idx` (`job_status_id` ASC),
  INDEX `fk_employee_has_job_status_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_has_job_status_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_job_status_job_status1`
    FOREIGN KEY (`job_status_id`)
    REFERENCES `rrhh`.`job_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`films` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`films` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `release_date` DATE NOT NULL,
  `director_id` INT(11) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`films_theaters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`films_theaters` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`films_theaters` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` INT(10) UNSIGNED NOT NULL,
  `theater_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`grouping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`grouping` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`grouping` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`password_resets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`password_resets` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`password_resets` (
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  INDEX `password_resets_email_index` (`email` ASC),
  INDEX `password_resets_token_index` (`token` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`migrations` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`migrations` (
  `migration` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `batch` INT(11) NOT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`office` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`office` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `building_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_office_building1_idx` (`building_id` ASC),
  CONSTRAINT `fk_office_building1`
    FOREIGN KEY (`building_id`)
    REFERENCES `rrhh`.`building` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`it_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`it_level` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`it_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`office_tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`office_tool` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`office_tool` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `office_toolcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`it_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`it_area` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`it_area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`language` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`language` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`it_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`it_course` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`it_course` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `it_area_id` INT NOT NULL,
  `it_especiality_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_it_course_it_area1_idx` (`it_area_id` ASC),
  INDEX `fk_it_course_it_especiality1_idx` (`it_especiality_id` ASC),
  CONSTRAINT `fk_it_course_it_area1`
    FOREIGN KEY (`it_area_id`)
    REFERENCES `rrhh`.`it_area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_course_it_level1`
    FOREIGN KEY (`it_especiality_id`)
    REFERENCES `rrhh`.`it_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_copy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_copy` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_copy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_copy_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_copy_language` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_copy_language` (
  `work_file_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`work_file_id`, `language_id`),
  INDEX `fk_work_file_copy_has_language_language1_idx` (`language_id` ASC),
  INDEX `fk_work_file_copy_has_language_work_file_copy1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_work_file_copy_has_language_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `rrhh`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_language_work_file_copy1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file_copy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`schedule` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`schedule` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `days` VARCHAR(500) NULL,
  `time_in` TIME NULL,
  `time_out` TIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`stretch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`stretch` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`stretch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`scale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`scale` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`scale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`supplement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`supplement` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`supplement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NULL,
  `employee_id` INT NOT NULL,
  `additionals` BIT NULL,
  `supplement_id` INT NULL,
  `additional_id` INT NULL,
  `area_id` INT NOT NULL,
  `office_id` INT NOT NULL,
  `dependency_code` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL,
  `active` BIT NULL DEFAULT b'1',
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_work_file_employee1_idx` (`employee_id` ASC),
  INDEX `fk_work_file_supplement1_idx` (`supplement_id` ASC),
  INDEX `fk_work_file_additional1_idx` (`additional_id` ASC),
  INDEX `fk_work_file_area1_idx` (`area_id` ASC),
  INDEX `fk_work_file_office_idx` (`office_id` ASC),
  CONSTRAINT `fk_work_file_additional1`
    FOREIGN KEY (`additional_id`)
    REFERENCES `rrhh`.`additional` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `rrhh`.`employee` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_area1`
    FOREIGN KEY (`area_id`)
    REFERENCES `rrhh`.`area` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_office`
    FOREIGN KEY (`office_id`)
    REFERENCES `rrhh`.`office` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_supplement1`
    FOREIGN KEY (`supplement_id`)
    REFERENCES `rrhh`.`supplement` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`review` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_afip` DATE NULL,
  `in_afip` DATE NULL,
  `out_afip` DATE NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` VARCHAR(45) NULL,
  `work_file_id` INT NOT NULL,
  `scale_id` INT NOT NULL,
  `grouping_id` INT NOT NULL,
  `stretch_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `level` VARCHAR(255) NULL,
  `executive_function` VARCHAR(255) NULL,
  `grade` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_work_file1_idx` (`work_file_id` ASC),
  INDEX `fk_review_scale1_idx` (`scale_id` ASC),
  INDEX `fk_review_grouping1_idx` (`grouping_id` ASC),
  INDEX `fk_review_stretch1_idx` (`stretch_id` ASC),
  INDEX `fk_review_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_review_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `rrhh`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_grouping1`
    FOREIGN KEY (`grouping_id`)
    REFERENCES `rrhh`.`grouping` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_stretch1`
    FOREIGN KEY (`stretch_id`)
    REFERENCES `rrhh`.`stretch` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_scale1`
    FOREIGN KEY (`scale_id`)
    REFERENCES `rrhh`.`scale` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`role` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`review_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`review_role` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`review_role` (
  `review_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `active` BIT NULL DEFAULT b'1',
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `description` VARCHAR(500) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`review_id`, `role_id`),
  INDEX `fk_review_role_role1_idx` (`role_id` ASC),
  INDEX `fk_review_role_review1_idx` (`review_id` ASC),
  CONSTRAINT `fk_review_role_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `rrhh`.`review` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_role_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `rrhh`.`role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_it_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_it_course` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_it_course` (
  `work_file_id` INT NOT NULL,
  `it_course_id` INT NOT NULL,
  PRIMARY KEY (`work_file_id`, `it_course_id`),
  INDEX `fk_work_file_copy_has_it_course_it_course1_idx` (`it_course_id` ASC),
  INDEX `fk_work_file_copy_has_it_course_work_file_copy1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_work_file_copy_has_it_course_it_course1`
    FOREIGN KEY (`it_course_id`)
    REFERENCES `rrhh`.`it_course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_it_course_work_file_copy1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file_copy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`users` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `password` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `remember_token` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_job_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_job_status` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_job_status` (
  `work_file_job_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `work_file_id` INT NOT NULL,
  `job_status_id` INT NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `active` BIT NOT NULL DEFAULT b'1',
  `id_work_file_job_status` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`job_status_id`, `work_file_job_status_id`),
  INDEX `fk_work_file_job_status_job_status1_idx` (`job_status_id` ASC),
  INDEX `fk_work_file_job_status_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_work_file_job_status_job_status1`
    FOREIGN KEY (`job_status_id`)
    REFERENCES `rrhh`.`job_status` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_job_status_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_schedule` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_schedule` (
  `work_file_id` INT NOT NULL,
  `schedule_id` INT NOT NULL,
  `active` BIT NULL DEFAULT b'1',
  `date_from` DATE NULL,
  `date_to` DATE NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`work_file_id`, `schedule_id`),
  INDEX `fk_work_file_schedule_schedule1_idx` (`schedule_id` ASC),
  INDEX `fk_work_file_schedule_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_work_file_schedule_schedule1`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `rrhh`.`schedule` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_work_file_schedule_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`theaters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`theaters` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`theaters` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_education` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_education` (
  `work_file_id` INT NOT NULL,
  `education_id` INT NOT NULL,
  PRIMARY KEY (`work_file_id`, `education_id`),
  INDEX `fk_work_file_copy_has_education_education1_idx` (`education_id` ASC),
  INDEX `fk_work_file_copy_has_education_work_file_copy1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_work_file_copy_has_education_education1`
    FOREIGN KEY (`education_id`)
    REFERENCES `rrhh`.`education` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_education_work_file_copy1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file_copy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_course` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_course` (
  `work_file_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`work_file_id`, `course_id`),
  INDEX `fk_work_file_copy_has_course_course1_idx` (`course_id` ASC),
  INDEX `fk_work_file_copy_has_course_work_file_copy1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_work_file_copy_has_course_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `rrhh`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_course_work_file_copy1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file_copy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_copy_has_congress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_copy_has_congress` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_copy_has_congress` (
  `work_file_copy_id` INT NOT NULL,
  `congress_id` INT NOT NULL,
  PRIMARY KEY (`work_file_copy_id`, `congress_id`),
  INDEX `fk_work_file_copy_has_congress_congress1_idx` (`congress_id` ASC),
  INDEX `fk_work_file_copy_has_congress_work_file_copy1_idx` (`work_file_copy_id` ASC),
  CONSTRAINT `fk_work_file_copy_has_congress_congress1`
    FOREIGN KEY (`congress_id`)
    REFERENCES `rrhh`.`congress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_copy_has_congress_work_file_copy1`
    FOREIGN KEY (`work_file_copy_id`)
    REFERENCES `rrhh`.`work_file_copy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`work_file_office_tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`work_file_office_tool` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`work_file_office_tool` (
  `id_work_file_office_tool` INT NOT NULL AUTO_INCREMENT,
  `work_file_id` INT NOT NULL,
  `office_tool_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  INDEX `fk_work_file_has_office_tool_office_tool1_idx` (`office_tool_id` ASC),
  INDEX `fk_work_file_has_office_tool_work_file1_idx` (`work_file_id` ASC),
  PRIMARY KEY (`id_work_file_office_tool`),
  CONSTRAINT `fk_work_file_has_office_tool_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_file_has_office_tool_office_tool1`
    FOREIGN KEY (`office_tool_id`)
    REFERENCES `rrhh`.`office_tool` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`administrative_act`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`administrative_act` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`administrative_act` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`public_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`public_service` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`public_service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `organism` VARCHAR(500) NULL,
  `review_id` INT NULL,
  `motivation` VARCHAR(500) NULL,
  `destination` VARCHAR(500) NULL,
  `date_from` DATE NULL,
  `date_to` DATE NULL,
  `act_number` VARCHAR(100) NULL,
  `act_date` DATE NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `work_file_id` INT NOT NULL,
  `administrative_act_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_public_service_work_file1_idx` (`work_file_id` ASC),
  INDEX `fk_public_service_administrative_act1_idx` (`administrative_act_id` ASC),
  CONSTRAINT `fk_public_service_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_public_service_administrative_act1`
    FOREIGN KEY (`administrative_act_id`)
    REFERENCES `rrhh`.`administrative_act` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`private_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`private_service` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`private_service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `institution_name` VARCHAR(500) NOT NULL,
  `legal_adress` VARCHAR(500) NOT NULL,
  `charge_function` VARCHAR(500) NOT NULL,
  `remunerated` VARCHAR(100) NOT NULL,
  `date_from` DATE NOT NULL,
  `date_to` DATE NOT NULL,
  `out_motivation` TEXT NOT NULL,
  `work_file_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_private_service_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_private_service_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'TETE';


-- -----------------------------------------------------
-- Table `rrhh`.`mentions_congrats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`mentions_congrats` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`mentions_congrats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `jurisdiction` VARCHAR(500) NOT NULL,
  `organization` VARCHAR(500) NOT NULL,
  `motivation` VARCHAR(500) NOT NULL,
  `act_number` VARCHAR(200) NOT NULL,
  `mention_date` DATE NOT NULL,
  `observation` TEXT NULL,
  `administrative_act_id` INT NOT NULL,
  `work_file_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mentions_congrats_administrative_act1_idx` (`administrative_act_id` ASC),
  INDEX `fk_mentions_congrats_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_mentions_congrats_administrative_act1`
    FOREIGN KEY (`administrative_act_id`)
    REFERENCES `rrhh`.`administrative_act` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mentions_congrats_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'us';


-- -----------------------------------------------------
-- Table `rrhh`.`seizure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`seizure` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`seizure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `expedient_number` VARCHAR(200) NOT NULL,
  `date_From` DATE NOT NULL,
  `charter` VARCHAR(200) NOT NULL,
  `tribunal` VARCHAR(200) NOT NULL,
  `secretary` VARCHAR(200) NOT NULL,
  `cars` VARCHAR(200) NOT NULL,
  `ammount` VARCHAR(200) NOT NULL,
  `worked` VARCHAR(200) NOT NULL,
  `earned` VARCHAR(200) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `work_file_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seizure_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_seizure_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`performance_evaluation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`performance_evaluation` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`performance_evaluation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year_evaluation` YEAR NOT NULL,
  `qualification` VARCHAR(100) NOT NULL,
  `used` VARCHAR(100) NOT NULL,
  `level` VARCHAR(100) NOT NULL,
  `grade_evaluation` VARCHAR(100) NOT NULL,
  `bonification` VARCHAR(100) NOT NULL,
  `notification` DATE NOT NULL,
  `observations` TEXT NULL,
  `work_file_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_performance_evaluation_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_performance_evaluation_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`capacitation_credit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`capacitation_credit` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`capacitation_credit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year_credit` YEAR NOT NULL,
  `credit_quantity` INT(8) NOT NULL,
  `credit_used` INT(8) NOT NULL,
  `credit_total` INT(8) NOT NULL,
  `validity_date` DATE NOT NULL,
  `observations` TEXT NULL,
  `work_file_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_capacitation_credit_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_capacitation_credit_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`adminisitrative_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`adminisitrative_history` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`adminisitrative_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stretch_id` INT NOT NULL,
  `grouping_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `scale_id` INT NOT NULL,
  `act_number` VARCHAR(200) NULL,
  `act_date` DATE NULL,
  `date_from` DATE NULL,
  `motivation` TEXT NULL,
  `administrative_act_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `work_file_id` INT NOT NULL,
  INDEX `fk_table1_stretch1_idx` (`stretch_id` ASC),
  INDEX `fk_table1_grouping1_idx` (`grouping_id` ASC),
  INDEX `fk_table1_scale1_idx` (`scale_id` ASC),
  INDEX `fk_table1_category1_idx` (`category_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_adminisitrative_history_administrative_act1_idx` (`administrative_act_id` ASC),
  INDEX `fk_adminisitrative_history_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_table1_stretch1`
    FOREIGN KEY (`stretch_id`)
    REFERENCES `rrhh`.`stretch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_grouping1`
    FOREIGN KEY (`grouping_id`)
    REFERENCES `rrhh`.`grouping` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_scale1`
    FOREIGN KEY (`scale_id`)
    REFERENCES `rrhh`.`scale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `rrhh`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adminisitrative_history_administrative_act1`
    FOREIGN KEY (`administrative_act_id`)
    REFERENCES `rrhh`.`administrative_act` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adminisitrative_history_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`ochestra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`ochestra` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`ochestra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stretch_id` INT NOT NULL,
  `grouping_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `scale_id` INT NOT NULL,
  `act_number` VARCHAR(200) NULL,
  `act_date` DATE NULL,
  `date_from` DATE NULL,
  `motivation` TEXT NULL,
  `administrative_act_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `work_file_id` INT NOT NULL,
  INDEX `fk_table1_stretch1_idx` (`stretch_id` ASC),
  INDEX `fk_table1_grouping1_idx` (`grouping_id` ASC),
  INDEX `fk_table1_scale1_idx` (`scale_id` ASC),
  INDEX `fk_table1_category1_idx` (`category_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_adminisitrative_history_administrative_act1_idx` (`administrative_act_id` ASC),
  INDEX `fk_adminisitrative_history_work_file1_idx` (`work_file_id` ASC),
  CONSTRAINT `fk_table1_stretch10`
    FOREIGN KEY (`stretch_id`)
    REFERENCES `rrhh`.`stretch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_grouping10`
    FOREIGN KEY (`grouping_id`)
    REFERENCES `rrhh`.`grouping` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_scale10`
    FOREIGN KEY (`scale_id`)
    REFERENCES `rrhh`.`scale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_category10`
    FOREIGN KEY (`category_id`)
    REFERENCES `rrhh`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orchestra_act10`
    FOREIGN KEY (`administrative_act_id`)
    REFERENCES `rrhh`.`administrative_act` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orchestra_file10`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`sanction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`sanction` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`sanction` (
  `id` INT NOT NULL,
  `institution` VARCHAR(500) NULL,
  `act_number` INT NULL,
  `sanction_date` DATE NULL,
  `disciplinary_action` VARCHAR(500) NULL,
  `cause` VARCHAR(500) NULL,
  `santion_from` DATE NULL,
  `sanction_to` DATE NULL,
  `work_file_id` INT NOT NULL,
  `administrative_act_id` INT NOT NULL,
  INDEX `fk_sanction_work_file1_idx` (`work_file_id` ASC),
  INDEX `fk_sanction_administrative_act1_idx` (`administrative_act_id` ASC),
  CONSTRAINT `fk_sanction_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanction_administrative_act1`
    FOREIGN KEY (`administrative_act_id`)
    REFERENCES `rrhh`.`administrative_act` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
