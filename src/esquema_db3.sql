-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema videos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videos` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema videos
-- -----------------------------------------------------

USE `videos` ;

-- -----------------------------------------------------
-- Table `videos`.`actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`actores` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videos`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`categories` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videos`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`languages` (
  `langauge_id` INT NOT NULL,
  `name` VARCHAR(15) NULL,
  PRIMARY KEY (`langauge_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videos`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`films` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(50) NULL,
  `langauge_id` INT NOT NULL,
  `rental_duration` INT NULL,
  `rental_rate` FLOAT NULL,
  `length` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(10) NULL,
  `special_features` VARCHAR(45) NULL,
  `categories_category_id` INT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_films_languages_idx` (`langauge_id` ASC) VISIBLE,
  INDEX `fk_films_categories1_idx` (`categories_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_languages`
    FOREIGN KEY (`langauge_id`)
    REFERENCES `videos`.`languages` (`langauge_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_categories1`
    FOREIGN KEY (`categories_category_id`)
    REFERENCES `videos`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videos`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_films1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `videos`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videos`.`oldHDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`oldHDD` (
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  INDEX `fk_oldHDD_actores1_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_oldHDD_films1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_oldHDD_actores1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `videos`.`actores` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oldHDD_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `videos`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videos`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videos`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL,
  `inventory_id` INT NOT NULL,
  `customer_id` INT NULL,
  `return_date` DATETIME NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `videos`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;