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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
