CREATE SCHEMA `passagem_onibus` ;

USE `passagem_onibus`

CREATE TABLE `passagem_onibus`.`passageiros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `telefone` CHAR(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE);

CREATE TABLE `passagem_onibus`.`onibus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `n_assentos` INT NOT NULL,
  `empresa` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE);

CREATE TABLE `passagem_onibus`.`viagens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `origem` VARCHAR(100) NOT NULL,
  `destino` VARCHAR(100) NOT NULL,
  `data_saida` DATE NOT NULL,
  `horario_saida` TIME NOT NULL,
  `onibus_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_onibus_id_idx` (`onibus_id` ASC) VISIBLE,
  CONSTRAINT `fk_onibus_id`
    FOREIGN KEY (`onibus_id`)
    REFERENCES `passagem_onibus`.`onibus` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

