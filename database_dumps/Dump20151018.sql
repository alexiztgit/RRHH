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
CREATE SCHEMA IF NOT EXISTS `rrhh` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema rrhh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rrhh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rrhh` DEFAULT CHARACTER SET latin1 ;
USE `rrhh` ;

-- -----------------------------------------------------
-- Table `rrhh`.`license_scale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`license_scale` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`license_scale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

USE `rrhh` ;

-- -----------------------------------------------------
-- Table `rrhh`.`license`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`license` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`license` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `work_file_id` INT(11) NOT NULL,
  `license_scale_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_license_work_file1_idx` (`work_file_id` ASC),
  INDEX `fk_license_license_scale1_idx` (`license_scale_id` ASC),
  CONSTRAINT `fk_license_work_file1`
    FOREIGN KEY (`work_file_id`)
    REFERENCES `rrhh`.`work_file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_license_license_scale1`
    FOREIGN KEY (`license_scale_id`)
    REFERENCES `rrhh`.`license_scale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rrhh`.`license_absent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`license_absent` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`license_absent` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `absent_date` DATE NULL DEFAULT NULL,
  `license_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_license_absent_license1_idx` (`license_id` ASC),
  CONSTRAINT `fk_license_absent_license1`
    FOREIGN KEY (`license_id`)
    REFERENCES `rrhh`.`license` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rrhh`.`license_exam`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`license_exam` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`license_exam` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `exam_date` DATE NULL DEFAULT NULL,
  `exam_from` DATE NULL DEFAULT NULL,
  `exam_to` DATE NULL DEFAULT NULL,
  `total_ability_days` INT(11) NULL DEFAULT NULL,
  `matter` VARCHAR(45) NULL DEFAULT NULL,
  `cathedra` VARCHAR(45) NULL DEFAULT NULL,
  `establishment` VARCHAR(45) NULL DEFAULT NULL,
  `license_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_licence_exam_license1_idx` (`license_id` ASC),
  CONSTRAINT `fk_licence_exam_license1`
    FOREIGN KEY (`license_id`)
    REFERENCES `rrhh`.`license` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rrhh`.`license_medical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`license_medical` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`license_medical` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `agent_firstname` VARCHAR(45) NULL DEFAULT NULL,
  `agent_lastname` VARCHAR(45) NULL DEFAULT NULL,
  `date_from` DATE NULL DEFAULT NULL,
  `matter` VARCHAR(45) NULL DEFAULT NULL,
  `domicile` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `clinic_name` VARCHAR(100) NULL DEFAULT NULL,
  `clinic_domicile` VARCHAR(200) NULL DEFAULT NULL,
  `clinic_phone` VARCHAR(45) NULL DEFAULT NULL,
  `license_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_license_medical_license1_idx` (`license_id` ASC),
  CONSTRAINT `fk_license_medical_license1`
    FOREIGN KEY (`license_id`)
    REFERENCES `rrhh`.`license` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rrhh`.`license_medical_family`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`license_medical_family` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`license_medical_family` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `agent_firstname` VARCHAR(45) NULL DEFAULT NULL,
  `agent_lastname` VARCHAR(45) NULL DEFAULT NULL,
  `date_from` DATE NULL DEFAULT NULL,
  `family_fullname` VARCHAR(200) NULL DEFAULT NULL,
  `family_parent` VARCHAR(45) NULL DEFAULT NULL,
  `family_domicile` VARCHAR(200) NULL DEFAULT NULL,
  `family_phone` VARCHAR(200) NULL DEFAULT NULL,
  `clinic_name` VARCHAR(100) NULL DEFAULT NULL,
  `clinic_domicile` VARCHAR(200) NULL DEFAULT NULL,
  `clinic_phone` VARCHAR(45) NULL DEFAULT NULL,
  `license_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_license_medical_family_license1_idx` (`license_id` ASC),
  CONSTRAINT `fk_license_medical_family_license1`
    FOREIGN KEY (`license_id`)
    REFERENCES `rrhh`.`license` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
