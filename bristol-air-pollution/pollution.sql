-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pollution-db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pollution-db` ;

-- -----------------------------------------------------
-- Schema pollution-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pollution-db` DEFAULT CHARACTER SET utf8 ;
USE `pollution-db` ;

-- -----------------------------------------------------
-- Table `pollution-db`.`site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pollution-db`.`site` ;

CREATE TABLE IF NOT EXISTS `pollution-db`.`site` (
  `id` INT NOT NULL,
  `site_name` VARCHAR(100) NULL,
  `geo_point_2d` VARCHAR(30) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pollution-db`.`readings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pollution-db`.`readings` ;

CREATE TABLE IF NOT EXISTS `pollution-db`.`readings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `instrument_type` VARCHAR(100) NULL,
  `nox` FLOAT(9,5) NULL,
  `no2` FLOAT(9,5) NULL,
  `no` FLOAT(9,5) NULL,
  `pm_10` FLOAT(9,5) NULL,
  `nvpm_10` FLOAT(9,5) NULL,
  `vpm_10` FLOAT(9,5) NULL,
  `nvpm_25` FLOAT(9,5) NULL,
  `pm_25` FLOAT(9,5) NULL,
  `vpm_25` FLOAT(9,5) NULL,
  `co` FLOAT(9,5) NULL,
  `o3` FLOAT(9,5) NULL,
  `so2` FLOAT(9,5) NULL,
  `air_temperature` FLOAT(9,5) NULL,
  `rh` FLOAT(9,5) NULL,
  `air_pressure` FLOAT(9,5) NULL,
  `date_start` DATETIME NULL,
  `date_end` DATETIME NULL,
  `current` TINYINT NULL,
  `date_time` DATETIME NULL,
  `siteid` INT NOT NULL,
  PRIMARY KEY (`id`, `siteid`),
  INDEX `fk_site_id_idx` (`siteid` ASC) VISIBLE,
  CONSTRAINT `fk_site_id`
    FOREIGN KEY (`siteid`)
    REFERENCES `pollution-db`.`site` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pollution-db`.`schema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pollution-db`.`schema` ;

CREATE TABLE IF NOT EXISTS `pollution-db`.`schema` (
  `idSchema` INT NOT NULL,
  `measure` VARCHAR(45) NULL,
  `unit` VARCHAR(45) NULL,
  PRIMARY KEY (`idSchema`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
