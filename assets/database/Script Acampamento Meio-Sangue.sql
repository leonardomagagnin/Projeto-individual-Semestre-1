CREATE DATABASE acampamento_meio_sangue;
USE acampamento_meio_sangue;

CREATE TABLE chale (
id INT PRIMARY KEY AUTO_INCREMENT,
divindade VARCHAR(45) NOT NULL,
dominio VARCHAR(45)
); 

INSERT INTO chale VALUES
(DEFAULT, 'Zeus', 'Céus'),
(DEFAULT, 'Hera', 'Família'),
(DEFAULT, 'Poseidon', 'Mares'),
(DEFAULT, 'Deméter', 'Agricultura'),
(DEFAULT, 'Ares', 'Guerra'),
(DEFAULT, 'Atena', 'Sabedoria'),
(DEFAULT, 'Apollo', 'Sol e Medicina'),
(DEFAULT, 'Ártemis', 'Lua e Caça'),
(DEFAULT, 'Hefesto', 'Fogo e Forja'),
(DEFAULT, 'Afrodite', 'Amor e Beleza'),
(DEFAULT, 'Hermes', 'Fronteiras'),
(DEFAULT, 'Dionísio', 'Festa e Vinho'),
(DEFAULT, 'Hades', 'Submundo');


CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
reclamado TINYINT,
CONSTRAINT chReclamado CHECK(reclamado IN(1, 0)),
fk_chale INT DEFAULT 1,
FOREIGN KEY (fk_chale) REFERENCES chale(id)
);
