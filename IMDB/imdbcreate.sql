-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema imdbdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema imdbdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imdbdb` ;
USE `imdbdb` ;

-- -----------------------------------------------------
-- Table `imdbdb`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdbdb`.`actor` (
  `actor_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `exprience` INT NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdbdb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdbdb`.`movie` (
  `movie_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `producer_name` VARCHAR(45) NOT NULL,
  `director_name` VARCHAR(45) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `actor_actor_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `fk_movie_actor_idx` (`actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_actor`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `imdbdb`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdbdb`.`tv_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdbdb`.`tv_series` (
  `tv_series_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `director_name` VARCHAR(45) NOT NULL,
  `producer_name` VARCHAR(45) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `no_of_episodes` INT NOT NULL,
  `actor_actor_id` INT NOT NULL,
  PRIMARY KEY (`tv_series_id`),
  INDEX `fk_tv_series_actor1_idx` (`actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_tv_series_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `imdbdb`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
