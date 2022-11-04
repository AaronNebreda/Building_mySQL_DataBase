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
-- -----------------------------------------------------
-- Schema videos
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema concesionario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema concesionario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `concesionario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema publications
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `publications` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actores` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`languages` (
  `langauge_id` INT NOT NULL,
  `name` VARCHAR(15) NULL,
  PRIMARY KEY (`langauge_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`films` (
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
    REFERENCES `mydb`.`languages` (`langauge_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_categories1`
    FOREIGN KEY (`categories_category_id`)
    REFERENCES `mydb`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_films1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `mydb`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`oldHDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`oldHDD` (
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  INDEX `fk_oldHDD_actores1_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_oldHDD_films1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_oldHDD_actores1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `mydb`.`actores` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oldHDD_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `mydb`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rental` (
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
    REFERENCES `mydb`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `concesionario` ;

-- -----------------------------------------------------
-- Table `concesionario`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concesionario`.`cars` (
  `ID` INT NOT NULL,
  `VIN` CHAR(17) NULL DEFAULT NULL,
  `Manufacturer` VARCHAR(25) NULL DEFAULT NULL,
  `Model` VARCHAR(25) NULL DEFAULT NULL,
  `Year` YEAR NULL DEFAULT NULL,
  `Color` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `concesionario`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concesionario`.`customers` (
  `ID` INT NOT NULL,
  `Customer ID` INT NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Phone` VARCHAR(20) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(25) NULL DEFAULT NULL,
  `State_Province` VARCHAR(25) NULL DEFAULT NULL,
  `Country` VARCHAR(25) NULL DEFAULT NULL,
  `Postal` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Customer ID_UNIQUE` (`Customer ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `concesionario`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concesionario`.`salespersons` (
  `ID` INT NOT NULL,
  `Staff_D` CHAR(5) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Store` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Staff ID_UNIQUE` (`Staff_D` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `concesionario`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concesionario`.`invoices` (
  `ID` INT NOT NULL,
  `Invoice_Number` CHAR(9) NOT NULL,
  `Date` DATE NOT NULL,
  `Cars` INT NOT NULL,
  `Salespersons` INT NOT NULL,
  `Customers` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Invoice Number_UNIQUE` (`Invoice_Number` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars`)
    REFERENCES `concesionario`.`cars` (`ID`),
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers`)
    REFERENCES `concesionario`.`customers` (`ID`),
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons`)
    REFERENCES `concesionario`.`salespersons` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `publications` ;

-- -----------------------------------------------------
-- Table `publications`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`authors` (
  `au_id` VARCHAR(11) NOT NULL,
  `au_lname` VARCHAR(40) NOT NULL,
  `au_fname` VARCHAR(20) NOT NULL,
  `phone` CHAR(12) NOT NULL,
  `address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` CHAR(5) NULL DEFAULT NULL,
  `contract` TINYINT NOT NULL,
  PRIMARY KEY (`au_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`stores` (
  `stor_id` CHAR(4) NOT NULL,
  `stor_name` VARCHAR(40) NULL DEFAULT NULL,
  `stor_address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` CHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`stor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`discounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`discounts` (
  `discounttype` VARCHAR(40) NOT NULL,
  `stor_id` CHAR(4) NULL DEFAULT NULL,
  `lowqty` SMALLINT NULL DEFAULT NULL,
  `highqty` SMALLINT NULL DEFAULT NULL,
  `discount` DECIMAL(4,2) NOT NULL,
  INDEX `discounts_stor_id` (`stor_id` ASC) VISIBLE,
  CONSTRAINT `discounts_ibfk_1`
    FOREIGN KEY (`stor_id`)
    REFERENCES `publications`.`stores` (`stor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`jobs` (
  `job_id` SMALLINT NOT NULL,
  `job_desc` VARCHAR(50) NOT NULL,
  `min_lvl` SMALLINT NOT NULL,
  `max_lvl` SMALLINT NOT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`publishers` (
  `pub_id` CHAR(4) NOT NULL,
  `pub_name` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `country` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`pub_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`employee` (
  `emp_id` CHAR(9) NOT NULL,
  `fname` VARCHAR(20) NOT NULL,
  `minit` CHAR(1) NULL DEFAULT NULL,
  `lname` VARCHAR(30) NOT NULL,
  `job_id` SMALLINT NOT NULL,
  `job_lvl` SMALLINT NULL DEFAULT NULL,
  `pub_id` CHAR(4) NOT NULL,
  `hire_date` DATETIME NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `employee_job_id` (`job_id` ASC) VISIBLE,
  INDEX `employee_pub_id` (`pub_id` ASC) VISIBLE,
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`job_id`)
    REFERENCES `publications`.`jobs` (`job_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`most_profiting_authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`most_profiting_authors` (
  `au_id` VARCHAR(11) CHARACTER SET 'utf8mb3' NOT NULL,
  `total_profits` DECIMAL(65,12) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `publications`.`pub_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`pub_info` (
  `pub_id` CHAR(4) NOT NULL,
  `logo` LONGBLOB NULL DEFAULT NULL,
  `pr_info` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`pub_id`),
  CONSTRAINT `pub_info_ibfk_1`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`titles` (
  `title_id` VARCHAR(6) NOT NULL,
  `title` VARCHAR(80) NOT NULL,
  `type` CHAR(12) NOT NULL,
  `pub_id` CHAR(4) NULL DEFAULT NULL,
  `price` DECIMAL(19,4) NULL DEFAULT NULL,
  `advance` DECIMAL(19,4) NULL DEFAULT NULL,
  `royalty` INT NULL DEFAULT NULL,
  `ytd_sales` INT NULL DEFAULT NULL,
  `notes` VARCHAR(200) NULL DEFAULT NULL,
  `pubdate` DATETIME NOT NULL,
  PRIMARY KEY (`title_id`),
  INDEX `titles_pub_id` (`pub_id` ASC) VISIBLE,
  CONSTRAINT `titles_ibfk_1`
    FOREIGN KEY (`pub_id`)
    REFERENCES `publications`.`publishers` (`pub_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`roysched`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`roysched` (
  `title_id` VARCHAR(6) NOT NULL,
  `lorange` INT NULL DEFAULT NULL,
  `hirange` INT NULL DEFAULT NULL,
  `royalty` INT NULL DEFAULT NULL,
  INDEX `roysched_title_id` (`title_id` ASC) VISIBLE,
  CONSTRAINT `roysched_ibfk_1`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`sales` (
  `stor_id` CHAR(4) NOT NULL,
  `ord_num` VARCHAR(20) NOT NULL,
  `ord_date` DATETIME NOT NULL,
  `qty` SMALLINT NOT NULL,
  `payterms` VARCHAR(12) NOT NULL,
  `title_id` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`stor_id`, `ord_num`, `title_id`),
  INDEX `sales_title_id` (`title_id` ASC) VISIBLE,
  CONSTRAINT `sales_ibfk_1`
    FOREIGN KEY (`stor_id`)
    REFERENCES `publications`.`stores` (`stor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_2`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `publications`.`titleauthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publications`.`titleauthor` (
  `au_id` VARCHAR(11) NOT NULL,
  `title_id` VARCHAR(6) NOT NULL,
  `au_ord` TINYINT NULL DEFAULT NULL,
  `royaltyper` INT NULL DEFAULT NULL,
  PRIMARY KEY (`au_id`, `title_id`),
  INDEX `titleauthor_title_id` (`title_id` ASC) VISIBLE,
  CONSTRAINT `titleauthor_ibfk_1`
    FOREIGN KEY (`title_id`)
    REFERENCES `publications`.`titles` (`title_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `titleauthor_ibfk_2`
    FOREIGN KEY (`au_id`)
    REFERENCES `publications`.`authors` (`au_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
