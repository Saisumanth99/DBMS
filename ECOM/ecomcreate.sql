-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecomdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecomdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecomdb` DEFAULT CHARACTER SET utf8 ;
USE `ecomdb` ;

-- -----------------------------------------------------
-- Table `ecomdb`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomdb`.`supplier` (
  `supplier_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `is_verified` TINYINT NOT NULL,
  `supply_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomdb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomdb`.`order` (
  `order_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `customer_cid` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer1_idx` (`customer_cid` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_cid`)
    REFERENCES `ecomdb`.`customer` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomdb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomdb`.`customer` (
  `cid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `is_authorized` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NULL,
  `order_order_id` INT NOT NULL,
  PRIMARY KEY (`cid`),
  INDEX `fk_customer_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `ecomdb`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecomdb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomdb`.`item` (
  `item_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `rating` INT NOT NULL,
  `desc` VARCHAR(45) NOT NULL,
  `supplier_supplier_id` INT NOT NULL,
  `order_order_id` INT NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_item_supplier_idx` (`supplier_supplier_id` ASC) VISIBLE,
  INDEX `fk_item_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_supplier`
    FOREIGN KEY (`supplier_supplier_id`)
    REFERENCES `ecomdb`.`supplier` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `ecomdb`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
