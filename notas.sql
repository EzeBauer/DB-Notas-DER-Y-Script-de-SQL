SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema notas_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema notas_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notas_db` DEFAULT CHARACTER SET utf8 ;
USE `notas_db` ;

-- -----------------------------------------------------
-- Table `notas_db`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_db`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `fecha_modificacion` DATE NOT NULL,
  `descripcion` TEXT NOT NULL,
  `eliminar` TINYINT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `notas_db`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_db`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_db`.`categorias_notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_db`.`categorias_notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `id_nota` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_categoria_idx` (`id_categoria` ASC) VISIBLE,
  INDEX `id_notas_idx` (`id_nota` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `notas_db`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_notas`
    FOREIGN KEY (`id_nota`)
    REFERENCES `notas_db`.`notas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
