-- MySQL Script generated by MySQL Workbench
-- Wed Oct  9 15:58:34 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Uczelnia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Uczelnia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Uczelnia` DEFAULT CHARACTER SET utf8 ;
USE `Uczelnia` ;

-- -----------------------------------------------------
-- Table `Uczelnia`.``
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Uczelnia`.`` (
  `Imie` INT NOT NULL,
  `Nazwisko` VARCHAR(45) NULL,
  PRIMARY KEY (`Imie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uczelnia`.`Wydział`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Uczelnia`.`Wydział` (
  `id_wydzialu` INT NOT NULL,
  `Nazwa wydzialu` VARCHAR(45) NOT NULL,
  `Adres` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_wydzialu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uczelnia`.`Grupa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Uczelnia`.`Grupa` (
  `Identyfikator` INT NOT NULL,
  `Nazwa` VARCHAR(45) NOT NULL,
  `Kierunek` VARCHAR(45) NOT NULL,
  `Specjalonosc` VARCHAR(45) NOT NULL,
  `Semestr` VARCHAR(45) NOT NULL,
  `Wydział_id_wydzialu` INT NOT NULL,
  `Wydział_id_wydzialu1` INT NOT NULL,
  PRIMARY KEY (`Identyfikator`, `Wydział_id_wydzialu`, `Wydział_id_wydzialu1`),
  UNIQUE INDEX `Identyfikator_UNIQUE` (`Identyfikator` ASC) VISIBLE,
  INDEX `fk_Grupa_Wydział1_idx` (`Wydział_id_wydzialu1` ASC) VISIBLE,
  CONSTRAINT `fk_Grupa_Wydział1`
    FOREIGN KEY (`Wydział_id_wydzialu1`)
    REFERENCES `Uczelnia`.`Wydział` (`id_wydzialu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uczelnia`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Uczelnia`.`Student` (
  `id_studenta` INT NOT NULL,
  `Identyfikator` VARCHAR(45) NOT NULL,
  `Imie` VARCHAR(45) NOT NULL,
  `Nazwisko` VARCHAR(45) NOT NULL,
  `Data urodzenia` INT NOT NULL,
  `Grupa_Identyfikator` INT NOT NULL,
  `Grupa_Wydział_id_wydzialu` INT NOT NULL,
  PRIMARY KEY (`id_studenta`, `Grupa_Identyfikator`, `Grupa_Wydział_id_wydzialu`),
  UNIQUE INDEX `Identyfikator_UNIQUE` (`Identyfikator` ASC) VISIBLE,
  INDEX `fk_Student_Grupa1_idx` (`Grupa_Identyfikator` ASC, `Grupa_Wydział_id_wydzialu` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Grupa1`
    FOREIGN KEY (`Grupa_Identyfikator` , `Grupa_Wydział_id_wydzialu`)
    REFERENCES `Uczelnia`.`Grupa` (`Identyfikator` , `Wydział_id_wydzialu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uczelnia`.`Pracownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Uczelnia`.`Pracownik` (
  `id_pracownika` INT NOT NULL,
  `Imie` VARCHAR(45) NOT NULL,
  `Nazwisko` VARCHAR(45) NOT NULL,
  `Tytul naukowy` VARCHAR(45) NOT NULL,
  `Wydział_id_wydzialu` INT NOT NULL,
  PRIMARY KEY (`id_pracownika`, `Wydział_id_wydzialu`),
  INDEX `fk_Pracownik_Wydział1_idx` (`Wydział_id_wydzialu` ASC) VISIBLE,
  CONSTRAINT `fk_Pracownik_Wydział1`
    FOREIGN KEY (`Wydział_id_wydzialu`)
    REFERENCES `Uczelnia`.`Wydział` (`id_wydzialu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
