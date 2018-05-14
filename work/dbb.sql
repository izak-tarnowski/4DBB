-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dvd_collection
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dvd_collection
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dvd_collection` ;
USE `dvd_collection` ;

-- -----------------------------------------------------
-- Table `dvd_collection`.`movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dvd_collection`.`movies` ;

CREATE TABLE IF NOT EXISTS `dvd_collection`.`movies` (
  `idmovies` INT NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `release_date` VARCHAR(45) NULL,
  PRIMARY KEY (`idmovies`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
