-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hoteldb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hoteldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hoteldb` DEFAULT CHARACTER SET utf8 ;
USE `hoteldb` ;

-- -----------------------------------------------------
-- Table `hoteldb`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`Hotel` (
  `hotel_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteldb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteldb`.`Customer` (
  `cid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `vaccine_status` TINYINT NOT NULL,
  `email` VARCHAR(45) NULL,
  `Hotel_hotel_id` INT NOT NULL,
  `is_loyal` TINYINT NOT NULL,
  PRIMARY KEY (`cid`),
  INDEX `fk_Customer_Hotel_idx` (`Hotel_hotel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Hotel`
    FOREIGN KEY (`Hotel_hotel_id`)
    REFERENCES `hoteldb`.`Hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
