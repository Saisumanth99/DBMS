-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`train` (
  `train_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_station` VARCHAR(45) NOT NULL,
  `end_station` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`train_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ticket` (
  `ticket_id` INT NOT NULL,
  `seat_no` VARCHAR(45) NOT NULL,
  `cost` INT NOT NULL,
  `is_reserved` TINYINT NOT NULL,
  `train_id` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_train_id_idx` (`train_id` ASC) VISIBLE,
  INDEX `fk_ticket_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`),
  CONSTRAINT `fk_train_id`
    FOREIGN KEY (`train_id`)
    REFERENCES `mydb`.`train` (`train_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `ticket_ticket_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_ticket1_idx` (`ticket_ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_ticket1`
    FOREIGN KEY (`ticket_ticket_id`)
    REFERENCES `mydb`.`ticket` (`ticket_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
