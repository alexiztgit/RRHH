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
-- Table `rrhh`.`office_tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`office_tool` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`office_tool` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  `office_toolcol` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `rrhh`.`administrative_act`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`administrative_act` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`administrative_act` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(200) NOT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rrhh`.`public_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rrhh`.`public_service` ;

CREATE TABLE IF NOT EXISTS `rrhh`.`public_service` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `organism` VARCHAR(500) NULL COMMENT '',
  `review_id` INT NULL COMMENT '',
  `motivation` VARCHAR(500) NULL COMMENT '',
  `destination` VARCHAR(500) NULL COMMENT '',
  `date_from` DATE NULL COMMENT '',
  `date_to` DATE NULL COMMENT '',
  `act_number` VARCHAR(100) NULL COMMENT '',
  `act_date` DATE NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `deleted_at` TIMESTAMP NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  `administrative_act_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_public_service_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
  INDEX `fk_public_service_administrative_act1_idx` (`administrative_act_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `institution_name` VARCHAR(500) NOT NULL COMMENT '',
  `legal_adress` VARCHAR(500) NOT NULL COMMENT '',
  `charge_function` VARCHAR(500) NOT NULL COMMENT '',
  `remunerated` VARCHAR(100) NOT NULL COMMENT '',
  `date_from` DATE NOT NULL COMMENT '',
  `date_to` DATE NOT NULL COMMENT '',
  `out_motivation` TEXT NOT NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_private_service_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `jurisdiction` VARCHAR(500) NOT NULL COMMENT '',
  `organization` VARCHAR(500) NOT NULL COMMENT '',
  `motivation` VARCHAR(500) NOT NULL COMMENT '',
  `act_number` VARCHAR(200) NOT NULL COMMENT '',
  `mention_date` DATE NOT NULL COMMENT '',
  `observation` TEXT NULL COMMENT '',
  `administrative_act_id` INT NOT NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_mentions_congrats_administrative_act1_idx` (`administrative_act_id` ASC)  COMMENT '',
  INDEX `fk_mentions_congrats_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `expedient_number` VARCHAR(200) NOT NULL COMMENT '',
  `date_From` DATE NOT NULL COMMENT '',
  `charter` VARCHAR(200) NOT NULL COMMENT '',
  `tribunal` VARCHAR(200) NOT NULL COMMENT '',
  `secretary` VARCHAR(200) NOT NULL COMMENT '',
  `cars` VARCHAR(200) NOT NULL COMMENT '',
  `ammount` VARCHAR(200) NOT NULL COMMENT '',
  `worked` VARCHAR(200) NOT NULL COMMENT '',
  `earned` VARCHAR(200) NOT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_seizure_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `year_evaluation` YEAR NOT NULL COMMENT '',
  `qualification` VARCHAR(100) NOT NULL COMMENT '',
  `used` VARCHAR(100) NOT NULL COMMENT '',
  `level` VARCHAR(100) NOT NULL COMMENT '',
  `grade_evaluation` VARCHAR(100) NOT NULL COMMENT '',
  `bonification` VARCHAR(100) NOT NULL COMMENT '',
  `notification` DATE NOT NULL COMMENT '',
  `observations` TEXT NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_performance_evaluation_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `year_credit` YEAR NOT NULL COMMENT '',
  `credit_quantity` INT(8) NOT NULL COMMENT '',
  `credit_used` INT(8) NOT NULL COMMENT '',
  `credit_total` INT(8) NOT NULL COMMENT '',
  `validity_date` DATE NOT NULL COMMENT '',
  `observations` TEXT NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_capacitation_credit_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `stretch_id` INT NOT NULL COMMENT '',
  `grouping_id` INT NOT NULL COMMENT '',
  `category_id` INT NOT NULL COMMENT '',
  `scale_id` INT NOT NULL COMMENT '',
  `act_number` VARCHAR(200) NULL COMMENT '',
  `act_date` DATE NULL COMMENT '',
  `date_from` DATE NULL COMMENT '',
  `motivation` TEXT NULL COMMENT '',
  `administrative_act_id` INT NOT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  INDEX `fk_table1_stretch1_idx` (`stretch_id` ASC)  COMMENT '',
  INDEX `fk_table1_grouping1_idx` (`grouping_id` ASC)  COMMENT '',
  INDEX `fk_table1_scale1_idx` (`scale_id` ASC)  COMMENT '',
  INDEX `fk_table1_category1_idx` (`category_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_adminisitrative_history_administrative_act1_idx` (`administrative_act_id` ASC)  COMMENT '',
  INDEX `fk_adminisitrative_history_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `stretch_id` INT NOT NULL COMMENT '',
  `grouping_id` INT NOT NULL COMMENT '',
  `category_id` INT NOT NULL COMMENT '',
  `scale_id` INT NOT NULL COMMENT '',
  `act_number` VARCHAR(200) NULL COMMENT '',
  `act_date` DATE NULL COMMENT '',
  `date_from` DATE NULL COMMENT '',
  `motivation` TEXT NULL COMMENT '',
  `administrative_act_id` INT NOT NULL COMMENT '',
  `created_at` TIMESTAMP NULL COMMENT '',
  `updated_at` TIMESTAMP NULL COMMENT '',
  `work_file_id` INT NOT NULL COMMENT '',
  INDEX `fk_table1_stretch1_idx` (`stretch_id` ASC)  COMMENT '',
  INDEX `fk_table1_grouping1_idx` (`grouping_id` ASC)  COMMENT '',
  INDEX `fk_table1_scale1_idx` (`scale_id` ASC)  COMMENT '',
  INDEX `fk_table1_category1_idx` (`category_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_adminisitrative_history_administrative_act1_idx` (`administrative_act_id` ASC)  COMMENT '',
  INDEX `fk_adminisitrative_history_work_file1_idx` (`work_file_id` ASC)  COMMENT '',
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
