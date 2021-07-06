-- MySQL Script generated by MySQL Workbench
-- Wed Jun 23 16:46:44 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Helical_Conveyor_Desing(HCD)
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Helical_Conveyor_Desing(HCD)` ;

-- -----------------------------------------------------
-- Schema Helical_Conveyor_Desing(HCD)
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Helical_Conveyor_Desing(HCD)` DEFAULT CHARACTER SET utf8 ;
USE `Helical_Conveyor_Desing(HCD)` ;

-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Motor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Motor` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Motor` (
  `id_Motor` VARCHAR(45) NOT NULL,
  `sentidoGiro` VARCHAR(45) NULL,
  `posicionInstalacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Motor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Usuario` (
  `id_Usuario` VARCHAR(45) NOT NULL,
  `nickName` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `profesionOficio` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Material` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Material` (
  `id_Material` VARCHAR(45) NOT NULL,
  `nombreMaterial` VARCHAR(45) NULL,
  `tipoMezcla` VARCHAR(45) NULL,
  `clasificacion` VARCHAR(45) NULL,
  `tipoMaterial` VARCHAR(45) NULL,
  `abrasividad` VARCHAR(45) NULL,
  `densidad` DOUBLE NULL,
  `fluidez` VARCHAR(45) NULL,
  `categoriaPeso` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Material`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Transportador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Transportador` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Transportador` (
  `id_Transportador` VARCHAR(45) NOT NULL,
  `nombreTransportador` VARCHAR(45) NULL,
  `velocidadTransporte` DOUBLE NULL,
  `coeficienteRelleno` DOUBLE NULL,
  `areaRelleno` DOUBLE NULL,
  `inclinacion` INT NULL,
  `coeficienteInclinacion` DOUBLE NULL,
  `capacidadTransportador` DOUBLE NULL,
  `fechaDiseño` DATETIME NULL,
  `Transportadorcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Transportador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Tubo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Tubo` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Tubo` (
  `id_Tubo` VARCHAR(45) NOT NULL,
  `diametroNominalTubo` DOUBLE NULL,
  `Transportador_id_Transportador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Tubo`),
  INDEX `fk_Tubo_Transportador1_idx` (`Transportador_id_Transportador` ASC) VISIBLE,
  CONSTRAINT `fk_Tubo_Transportador1`
    FOREIGN KEY (`Transportador_id_Transportador`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Transportador` (`id_Transportador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Helice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Helice` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Helice` (
  `id_Helice` VARCHAR(10) NOT NULL,
  `diametroHelice` DOUBLE NULL,
  `sentidoHelice` VARCHAR(45) NULL,
  `tipoHelice` VARCHAR(45) NULL,
  `pasoHelice` VARCHAR(45) NULL,
  `sentidoGiro` VARCHAR(45) NULL,
  `velocidadGiro` DOUBLE NULL,
  `Transportador_id_Transportador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Helice`),
  INDEX `fk_Helice_Transportador1_idx` (`Transportador_id_Transportador` ASC) VISIBLE,
  CONSTRAINT `fk_Helice_Transportador1`
    FOREIGN KEY (`Transportador_id_Transportador`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Transportador` (`id_Transportador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Motor_has_Transportador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Motor_has_Transportador` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Motor_has_Transportador` (
  `Motor_id_Motor` VARCHAR(45) NOT NULL,
  `Transportador_id_Transportador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Motor_id_Motor`, `Transportador_id_Transportador`),
  INDEX `fk_Motor_has_Transportador_Transportador1_idx` (`Transportador_id_Transportador` ASC) VISIBLE,
  INDEX `fk_Motor_has_Transportador_Motor_idx` (`Motor_id_Motor` ASC) VISIBLE,
  CONSTRAINT `fk_Motor_has_Transportador_Motor`
    FOREIGN KEY (`Motor_id_Motor`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Motor` (`id_Motor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Motor_has_Transportador_Transportador1`
    FOREIGN KEY (`Transportador_id_Transportador`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Transportador` (`id_Transportador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Material_has_Transportador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Material_has_Transportador` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Material_has_Transportador` (
  `Material_id_Material` VARCHAR(45) NOT NULL,
  `Transportador_id_Transportador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Material_id_Material`, `Transportador_id_Transportador`),
  INDEX `fk_Material_has_Transportador_Transportador1_idx` (`Transportador_id_Transportador` ASC) VISIBLE,
  INDEX `fk_Material_has_Transportador_Material1_idx` (`Material_id_Material` ASC) VISIBLE,
  CONSTRAINT `fk_Material_has_Transportador_Material1`
    FOREIGN KEY (`Material_id_Material`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Material` (`id_Material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Material_has_Transportador_Transportador1`
    FOREIGN KEY (`Transportador_id_Transportador`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Transportador` (`id_Transportador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Usuario_has_Transportador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Usuario_has_Transportador` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Usuario_has_Transportador` (
  `Usuario_id_Usuario` VARCHAR(45) NOT NULL,
  `Transportador_id_Transportador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario_id_Usuario`, `Transportador_id_Transportador`),
  INDEX `fk_Usuario_has_Transportador_Transportador1_idx` (`Transportador_id_Transportador` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Transportador_Usuario1_idx` (`Usuario_id_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Transportador_Usuario1`
    FOREIGN KEY (`Usuario_id_Usuario`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Transportador_Transportador1`
    FOREIGN KEY (`Transportador_id_Transportador`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Transportador` (`id_Transportador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Helical_Conveyor_Desing(HCD)`.`Tubo_has_Helice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Helical_Conveyor_Desing(HCD)`.`Tubo_has_Helice` ;

CREATE TABLE IF NOT EXISTS `Helical_Conveyor_Desing(HCD)`.`Tubo_has_Helice` (
  `Tubo_id_Tubo` VARCHAR(45) NOT NULL,
  `Helice_id_Helice` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Tubo_id_Tubo`, `Helice_id_Helice`),
  INDEX `fk_Tubo_has_Helice_Helice1_idx` (`Helice_id_Helice` ASC) VISIBLE,
  INDEX `fk_Tubo_has_Helice_Tubo1_idx` (`Tubo_id_Tubo` ASC) VISIBLE,
  CONSTRAINT `fk_Tubo_has_Helice_Tubo1`
    FOREIGN KEY (`Tubo_id_Tubo`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Tubo` (`id_Tubo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tubo_has_Helice_Helice1`
    FOREIGN KEY (`Helice_id_Helice`)
    REFERENCES `Helical_Conveyor_Desing(HCD)`.`Helice` (`id_Helice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;