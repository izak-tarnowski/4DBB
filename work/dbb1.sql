-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tafeshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tafeshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tafeshop` ;
USE `tafeshop` ;

-- -----------------------------------------------------
-- Table `tafeshop`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tafeshop`.`customers` ;

CREATE TABLE IF NOT EXISTS `tafeshop`.`customers` (
  `customerId` INT NOT NULL,
  `companyName` VARCHAR(45) NULL DEFAULT NULL,
  `contactName` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) GENERATED ALWAYS AS () VIRTUAL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `postCode` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tafeshop`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tafeshop`.`categories` ;

CREATE TABLE IF NOT EXISTS `tafeshop`.`categories` (
  `categoryId` INT(10) NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(15) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tafeshop`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tafeshop`.`orders` ;

CREATE TABLE IF NOT EXISTS `tafeshop`.`orders` (
  `orderId` INT(10) NOT NULL AUTO_INCREMENT,
  `employeeId` INT(10) NULL DEFAULT NULL,
  `orderDate` DATETIME NULL DEFAULT NULL,
  `Customers_customerId` INT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `fk_orders_Customers_idx` (`Customers_customerId` ASC),
  CONSTRAINT `fk_orders_Customers`
    FOREIGN KEY (`Customers_customerId`)
    REFERENCES `tafeshop`.`customers` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tafeshop`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tafeshop`.`products` ;

CREATE TABLE IF NOT EXISTS `tafeshop`.`products` (
  `productId` INT(10) NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(45) NULL,
  `unitPrice` DECIMAL(19,4) NULL,
  `unitsInStock` SMALLINT(5) NULL,
  `categories_categoryId` INT(10) NULL,
  PRIMARY KEY (`productId`),
  INDEX `fk_products_categories1_idx` (`categories_categoryId` ASC),
  CONSTRAINT `fk_products_categories1`
    FOREIGN KEY (`categories_categoryId`)
    REFERENCES `tafeshop`.`categories` (`categoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tafeshop`.`details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tafeshop`.`details` ;

CREATE TABLE IF NOT EXISTS `tafeshop`.`details` (
  `unitPrice` DECIMAL(19,4) NULL,
  `quantity` SMALLINT NULL,
  `orders_orderId` INT(10) NOT NULL,
  `products_productId` INT(10) NOT NULL,
  PRIMARY KEY (`orders_orderId`, `products_productId`),
  INDEX `fk_details_products1_idx` (`products_productId` ASC),
  CONSTRAINT `fk_details_orders1`
    FOREIGN KEY (`orders_orderId`)
    REFERENCES `tafeshop`.`orders` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_details_products1`
    FOREIGN KEY (`products_productId`)
    REFERENCES `tafeshop`.`products` (`productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
