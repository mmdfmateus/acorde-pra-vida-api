SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- mudando permisoes
-- -----------------------------------------------------
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

-- -----------------------------------------------------
-- Schema AcordePraVida
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `AcordePraVida` ;
CREATE SCHEMA IF NOT EXISTS `AcordePraVida` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `AcordePraVida` ;

-- -----------------------------------------------------
-- Table `AcordePraVida`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcordePraVida`.`user` ;

CREATE TABLE IF NOT EXISTS `AcordePraVida`.`user` (
`userId` INT PRIMARY KEY AUTO_INCREMENT,
`isEmailConfirmed` BOOLEAN NOT NULL,
`email` VARCHAR(256) NOT NULL,
`password` VARCHAR(256) NOT NULL,
`name` VARCHAR(256) NOT NULL,
`authToken` VARCHAR(256),
`roleId` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AcordePraVida`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcordePraVida`.`role` ;

CREATE TABLE IF NOT EXISTS `AcordePraVida`.`role` (
`roleId` INT PRIMARY KEY AUTO_INCREMENT,
`role` VARCHAR(256))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AcordePraVida`.`song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcordePraVida`.`song` ;

CREATE TABLE IF NOT EXISTS `AcordePraVida`.`song` (
`songId` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(256),
`content` VARCHAR(1024),
`level` INT NULL,
`views` INT NULL,
`videoUrl` VARCHAR(256) NOT NULL,
`genre` VARCHAR(256) NOT NULL,
`userId` INT NOT NULL,
`artistId` INT NOT NULL,
`rating` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AcordePraVida`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcordePraVida`.`artist` ;

CREATE TABLE IF NOT EXISTS `AcordePraVida`.`artist` (
`artistId` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(256),
`views` INT NULL,
`genre` VARCHAR(256) NOT NULL,
`photoUrl` VARCHAR(256) NOT NULL, 
`rating` INT NOT NULL)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- foreign keys
-- -----------------------------------------------------

ALTER TABLE `user` ADD CONSTRAINT `fk_has_role` FOREIGN KEY ( `roleId` ) REFERENCES `role` ( `roleId` );

ALTER TABLE `song` ADD CONSTRAINT `fk_created_by_user` FOREIGN KEY ( `userId` ) REFERENCES `user` ( `userId` );

ALTER TABLE `song` ADD CONSTRAINT `fk_has_artist` FOREIGN KEY ( `artistId` ) REFERENCES `artist` ( `artistId` );

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;