-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Booking` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Booking_Customer1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NULL,
  `BookingID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`, `DeliveryID`),
  INDEX `fk_Orders_Booking_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_DeliveryStatus1_idx` (`DeliveryID` ASC) VISIBLE,
  INDEX `fk_Order_Menu1_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Order_Customer1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Booking`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Booking` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_DeliveryStatus1`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDB`.`DeliveryStatus` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Menu1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `fk_Staff_Customer1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItem` (
  `MenuItemID` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  `StarterName` VARCHAR(255) NOT NULL,
  `DessertName` VARCHAR(255) NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`MenuItemID`, `MenuID`),
  INDEX `fk_MenuItem_Menu1_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItem_Menu1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
