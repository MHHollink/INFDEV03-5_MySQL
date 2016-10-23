-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema assignment
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignment
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment` DEFAULT CHARACTER SET utf8 ;
USE `assignment` ;

-- -----------------------------------------------------
-- Table `assignment`.`Addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Addresses` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Addresses` (
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `number` VARCHAR(45) NULL,
  `postal code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country`, `postal code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Projects` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Projects` (
  `id` INT NOT NULL,
  `budget` DOUBLE NULL,
  `allocatedhours` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Headquarters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Headquarters` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Headquarters` (
  `name` VARCHAR(45) NOT NULL,
  `rooms` INT NULL,
  `rent` DECIMAL(4) NULL,
  `Address_country` VARCHAR(45) NULL,
  `Address_postal code` VARCHAR(45) NULL,
  `Project_id` INT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_Headquarters_Adress1_idx` (`Address_country` ASC, `Address_postal code` ASC),
  INDEX `fk_Headquarters_Project1_idx` (`Project_id` ASC),
  CONSTRAINT `fk_Headquarters_Adress1`
    FOREIGN KEY (`Address_country` , `Address_postal code`)
    REFERENCES `assignment`.`Addresses` (`country` , `postal code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Headquarters_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `assignment`.`Projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Employees` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Employees` (
  `bsn` INT(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `Headquarters_name` VARCHAR(45) NULL,
  PRIMARY KEY (`bsn`),
  INDEX `fk_Employee_Headquarters1_idx` (`Headquarters_name` ASC),
  CONSTRAINT `fk_Employee_Headquarters1`
    FOREIGN KEY (`Headquarters_name`)
    REFERENCES `assignment`.`Headquarters` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Positions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Positions` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Positions` (
  `name` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NULL,
  `fee_per_hour` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Degrees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Degrees` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Degrees` (
  `course` VARCHAR(45) NOT NULL,
  `school` VARCHAR(45) NULL,
  `level` VARCHAR(45) NULL,
  PRIMARY KEY (`course`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Employee_has_Degrees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Employee_has_Degrees` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Employee_has_Degrees` (
  `Employee_bsn` INT(10) NOT NULL,
  `Degrees_course` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Employee_bsn`, `Degrees_course`),
  INDEX `fk_Employee_has_Degrees_Degrees1_idx` (`Degrees_course` ASC),
  INDEX `fk_Employee_has_Degrees_Employee1_idx` (`Employee_bsn` ASC),
  CONSTRAINT `fk_Employee_has_Degrees_Employee1`
    FOREIGN KEY (`Employee_bsn`)
    REFERENCES `assignment`.`Employees` (`bsn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_has_Degrees_Degrees1`
    FOREIGN KEY (`Degrees_course`)
    REFERENCES `assignment`.`Degrees` (`course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Employee_lives_at_Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Employee_lives_at_Address` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Employee_lives_at_Address` (
  `Employee_bsn` INT(10) NOT NULL,
  `Adress_country` VARCHAR(45) NOT NULL,
  `Adress_postal code` VARCHAR(45) NOT NULL,
  `Is_Main` TINYINT(1) NULL,
  PRIMARY KEY (`Employee_bsn`, `Adress_country`, `Adress_postal code`),
  INDEX `fk_Lives_at_Adress1_idx` (`Adress_country` ASC, `Adress_postal code` ASC),
  CONSTRAINT `fk_Lives_at_Employee1`
    FOREIGN KEY (`Employee_bsn`)
    REFERENCES `assignment`.`Employees` (`bsn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lives_at_Adress1`
    FOREIGN KEY (`Adress_country` , `Adress_postal code`)
    REFERENCES `assignment`.`Addresses` (`country` , `postal code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`.`Employee_has_Position_in_Project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`.`Employee_has_Position_in_Project` ;

CREATE TABLE IF NOT EXISTS `assignment`.`Employee_has_Position_in_Project` (
  `Positions_name` VARCHAR(45) NOT NULL,
  `Employees_bsn` INT(10) NOT NULL,
  `Projects_id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`Positions_name`, `Employees_bsn`, `Projects_id`),
  INDEX `fk_Employee_has_Position_in_Project_Employees1_idx` (`Employees_bsn` ASC),
  INDEX `fk_Employee_has_Position_in_Project_Projects1_idx` (`Projects_id` ASC),
  CONSTRAINT `fk_Employee_has_Position_in_Project_Positions1`
    FOREIGN KEY (`Positions_name`)
    REFERENCES `assignment`.`Positions` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_has_Position_in_Project_Employees1`
    FOREIGN KEY (`Employees_bsn`)
    REFERENCES `assignment`.`Employees` (`bsn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_has_Position_in_Project_Projects1`
    FOREIGN KEY (`Projects_id`)
    REFERENCES `assignment`.`Projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
