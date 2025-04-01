CREATE DATABASE ReservaHotel_Fisico;

USE ReservaHotel_Fisico;

CREATE TABLE hospedes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone CHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE quartos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL UNIQUE,
    tipo TINYINT NOT NULL,
    `status` TINYINT NOT NULL DEFAULT 0
);

CREATE TABLE reservas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `checkin` TIMESTAMP,
    `checkout` TIMESTAMP,
    hospedes_id INT NOT NULL,
    quartos_id INT NOT NULL
    CONSTRAINST `fk_reservas_hospedes`
        FOREIGN KEY (hospedes_id)
            REFERENCES hospedes (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT,
    CONSTRAINST `fk_reservas_quartos`
        FOREIGN KEY (quartos_id)
            REFERENCES quartos (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
);

