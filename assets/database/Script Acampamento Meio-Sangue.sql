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
email VARCHAR(45) NOT NULL UNIQUE,
senha VARCHAR(45) NOT NULL,
reclamado TINYINT,
CONSTRAINT chReclamado CHECK(reclamado IN(1, 0)),
fk_chale INT DEFAULT 11,
FOREIGN KEY (fk_chale) REFERENCES chale(id)
);

INSERT INTO usuario VALUES 
(DEFAULT, 'Percy Jackson', 'percy@email.com', 'Percabeth123', 1, 3),
(DEFAULT, 'Annabeth Chase', 'aachase@email.com', 'Ath12345', 1, 6),
(DEFAULT, 'Clarisse La Rue', 'clarisse@email.com', 'Cl123456', 1, 5),
(DEFAULT, 'Jason Grace', 'jason@email.com', 'Jas12345', 1, 1),
(DEFAULT, 'Leo Valdez', 'valdez@email.com', 'Leo123456', 1, 9),
(DEFAULT, 'Nico DiAngelo', 'nico@email.com', 'Nico123456', 1, 13),
(DEFAULT, 'Will Solace', 'will@email.com', 'Will123456', 1, 7),
(DEFAULT, 'Piper McLean', 'piper@email.com', 'Piper123456', 1, 10),
(DEFAULT, 'Travis Stoll', 'travis@email.com', 'Stoll12345', 1, 11),
(DEFAULT, 'Connor Stoll', 'connor@email.com', 'Stoll12345', 1, 11),
(DEFAULT, 'Silena Beauregard', 'silena@email.com', 'Sil123456', 1, 10),
(DEFAULT, 'Charles Beckendorf', 'charles@email.com', 'Ch1234567', 1, 9),
(DEFAULT, 'Hazel Levesque', 'hazel@email.com', 'Haz123456', 1, 13),
(DEFAULT, 'Thalia Grace', 'thalia@email.com', 'Th123456', 1, 1),
(DEFAULT, 'Zoë Nightshade', 'zoe@email.com', 'Zoe123456', 1, 8),
(DEFAULT, 'Bianca di Angelo', 'bianca@email.com', 'Bia123456', 1, 9);

SELECT * FROM usuario;