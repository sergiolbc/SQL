-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema video_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema video_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `video_store` DEFAULT CHARACTER SET utf8 ;
USE `video_store` ;

-- -----------------------------------------------------
-- Table `video_store`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_store`.`customer` (
  `customer_id` INT(11) NOT NULL,
  `customer_name` VARCHAR(255) NULL DEFAULT NULL,
  `customer_address` VARCHAR(255) NULL DEFAULT NULL,
  `customer_city` VARCHAR(50) NULL DEFAULT NULL,
  `customer_state` VARCHAR(25) NULL DEFAULT NULL,
  `customer_postal` VARCHAR(10) NULL DEFAULT NULL,
  `customer_number` VARCHAR(20) NULL DEFAULT NULL,
  `customer_balance` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_number_UNIQUE` (`customer_number` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `video_store`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_store`.`video` (
  `video_id` INT(11) NOT NULL,
  `video_rented` VARCHAR(50) NULL DEFAULT NULL,
  `video_name` VARCHAR(255) NULL DEFAULT NULL,
  `video_genre` VARCHAR(50) NULL DEFAULT NULL,
  `video_release_date` DATE NULL DEFAULT NULL,
  `video_director` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `video_store`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_store`.`rental` (
  `rental_id` INT(11) NOT NULL,
  `video_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `checkout_date` VARCHAR(45) NULL DEFAULT NULL,
  `due_date` VARCHAR(45) NULL DEFAULT NULL,
  `return_date` VARCHAR(45) NULL DEFAULT NULL,
  `fee_charge` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`, `video_id`, `customer_id`),
  INDEX `fk_video_id_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `video_store`.`customer` (`customer_id`),
  CONSTRAINT `fk_video_id`
    FOREIGN KEY (`video_id`)
    REFERENCES `video_store`.`video` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `video_store` ;

-- -----------------------------------------------------
-- procedure show_cust_info
-- -----------------------------------------------------

DELIMITER $$
USE `video_store`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_cust_info`(user_entry varchar(255))
BEGIN
		SELECT customer_id, customer_name, customer_address, customer_city, customer_state, customer_postal, customer_number, customer_balance
        FROM customer
        WHERE user_entry LIKE customer_id OR user_entry LIKE customer_name OR user_entry LIKE customer_address OR user_entry LIKE customer_city OR user_entry LIKE customer_state OR user_entry LIKE customer_postal OR user_entry LIKE customer_number OR user_entry LIKE customer_balance;
        
        END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure show_mov_info
-- -----------------------------------------------------

DELIMITER $$
USE `video_store`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_mov_info`(user_entry varchar(255))
BEGIN
		SELECT video_id, video_rented, video_name, video_genre, video_release_date, video_director
        FROM video
        WHERE user_entry LIKE video_id OR user_entry LIKE video_rented OR user_entry LIKE video_name OR user_entry LIKE video_genre OR user_entry LIKE video_release_date OR user_entry LIKE video_director;
        
        END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
