-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb3 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`alunos` (
  `idAlunos` INT NOT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `Idade` INT NULL DEFAULT NULL,
  `Edereco` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAlunos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `biblioteca`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livros` (
  `idLivros` INT NOT NULL,
  `Nome_livro` VARCHAR(45) NULL DEFAULT NULL,
  `Valor_Livro` INT NULL DEFAULT NULL,
  `Codigo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idLivros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `biblioteca`.`emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`emprestimo` (
  `FK_alunos` INT NOT NULL,
  `FK_livros` INT NOT NULL,
  `Valor_Emprestimo` INT NULL DEFAULT NULL,
  `ID_emprestimo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`FK_alunos`, `FK_livros`),
  INDEX `fk_Alunos_has_Livros_Livros1_idx` (`FK_livros` ASC) VISIBLE,
  INDEX `fk_Alunos_has_Livros_Alunos_idx` (`FK_alunos` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_has_Livros_Alunos`
    FOREIGN KEY (`FK_alunos`)
    REFERENCES `biblioteca`.`alunos` (`idAlunos`),
  CONSTRAINT `fk_Alunos_has_Livros_Livros1`
    FOREIGN KEY (`FK_livros`)
    REFERENCES `biblioteca`.`livros` (`idLivros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
