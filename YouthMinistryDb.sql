SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `YouthMinistry` ;
CREATE SCHEMA IF NOT EXISTS `YouthMinistry` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci ;
USE `YouthMinistry` ;

-- -----------------------------------------------------
-- Table `YouthMinistry`.`group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`group` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`group` (
  `groupid` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `group_name` VARCHAR(100) NOT NULL ,
  `group_desc` VARCHAR(255) NULL ,
  PRIMARY KEY (`groupid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouthMinistry`.`groupmembers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`groupmembers` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`groupmembers` (
  `groupid` INT UNSIGNED NOT NULL ,
  `memberid` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`groupid`, `memberid`) ,
  KEY (`memberid`),
  INDEX `groupid_idx` (`groupid` ASC) ,
  CONSTRAINT `groupid`
    FOREIGN KEY (`groupid` )
    REFERENCES `YouthMinistry`.`group` (`groupid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouthMinistry`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`role` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`role` (
  `roleid` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `role_name` VARCHAR(100) NOT NULL ,
  `role_desc` VARCHAR(255) NULL ,
  PRIMARY KEY (`roleid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouthMinistry`.`rolemembers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`rolemembers` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`rolemembers` (
  `roleid` INT UNSIGNED UNSIGNED NOT NULL ,
  `memberid` INT UNSIGNED UNSIGNED NOT NULL ,
  PRIMARY KEY (`roleid`, `memberid`) ,
  KEY (`memberid`),
  INDEX `groupid_idx` (`roleid` ASC) ,
  FOREIGN KEY (`roleid` )
    REFERENCES `YouthMinistry`.`role` (`roleid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouthMinistry`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`users` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`users` (
  `memberid` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(100) NULL ,
  `first_name` VARCHAR(45) NOT NULL ,
  `last_name` VARCHAR(45) NOT NULL ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` DATETIME NOT NULL ,
  PRIMARY KEY (`memberid`, `username`, `password`) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) ,
  INDEX `memberid_idx` (`memberid` ASC) ,
  INDEX `memberid_idx1` (`memberid` ASC) ,
  FOREIGN KEY (`memberid` )
    REFERENCES `YouthMinistry`.`groupmembers` (`memberid` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`memberid` )
    REFERENCES `YouthMinistry`.`rolemembers` (`memberid` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouthMinistry`.`eventgroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`eventgroup` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`eventgroup` (
  `eventid` INT UNSIGNED NOT NULL ,
  `groupid` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`eventid`, `groupid`) ,
  INDEX `groupid_idx` (`groupid` ASC) ,
  FOREIGN KEY (`groupid`)
    REFERENCES `YouthMinistry`.`group` (`groupid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouthMinistry`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `YouthMinistry`.`event` ;

CREATE TABLE IF NOT EXISTS `YouthMinistry`.`event` (
  `eventid` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `event_name` VARCHAR(255) NOT NULL ,
  `event_desc` VARCHAR(255) NULL ,
  `start_time` DATETIME,
  `end_time` DATETIME,
  PRIMARY KEY (`eventid`) ,
  INDEX `eventid_idx` (`eventid` ASC) ,
  FOREIGN KEY (`eventid` )
    REFERENCES `YouthMinistry`.`eventgroup` (`eventid` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;