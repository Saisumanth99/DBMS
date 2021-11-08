-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema paytmdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema paytmdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `paytmdb` ;
USE `paytmdb` ;

-- -----------------------------------------------------
-- Table `paytmdb`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytmdb`.`Branch` (
  `bid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `branch_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytmdb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytmdb`.`Customer` (
  `cid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `id_proof` VARCHAR(45) NOT NULL,
  `pan_no` VARCHAR(45) NOT NULL,
  `occupation` VARCHAR(45) NULL,
  PRIMARY KEY (`cid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytmdb`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytmdb`.`Account` (
  `account_id` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  `account_no` VARCHAR(45) NOT NULL,
  `ifsc` VARCHAR(45) NOT NULL,
  `account_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytmdb`.`Customer_has_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytmdb`.`Customer_has_Account` (
  `Customer_cid` INT NOT NULL,
  `Account_account_id` INT NOT NULL,
  `Branch_bid` INT NOT NULL,
  PRIMARY KEY (`Customer_cid`, `Account_account_id`, `Branch_bid`),
  INDEX `fk_Customer_has_Account_Account1_idx` (`Account_account_id` ASC) VISIBLE,
  INDEX `fk_Customer_has_Account_Customer_idx` (`Customer_cid` ASC) VISIBLE,
  INDEX `fk_Customer_has_Account_Branch1_idx` (`Branch_bid` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_has_Account_Customer`
    FOREIGN KEY (`Customer_cid`)
    REFERENCES `paytmdb`.`Customer` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Account_Account1`
    FOREIGN KEY (`Account_account_id`)
    REFERENCES `paytmdb`.`Account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Account_Branch1`
    FOREIGN KEY (`Branch_bid`)
    REFERENCES `paytmdb`.`Branch` (`bid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
