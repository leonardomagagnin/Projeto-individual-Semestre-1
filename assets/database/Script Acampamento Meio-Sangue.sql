CREATE DATABASE acampamento_meio_sangue;
USE acampamento_meio_sangue;

CREATE TABLE chale (
id INT PRIMARY KEY AUTO_INCREMENT,
divindade VARCHAR(45) NOT NULL,
dominio VARCHAR(45),
frase VARCHAR(50)
); 

INSERT INTO chale VALUES
(DEFAULT, 'Zeus', 'Céus', 'Poder a Zeus'),
(DEFAULT, 'Hera', 'Família', 'Lealdade a Hera'),
(DEFAULT, 'Poseidon', 'Mares', 'Orgulho a Poseidon'),
(DEFAULT, 'Deméter', 'Agricultura', 'Abundância a Deméter'),
(DEFAULT, 'Ares', 'Guerra', 'Vitória a Ares'),
(DEFAULT, 'Atena', 'Sabedoria', 'Glória a Atena'),
(DEFAULT, 'Apollo', 'Sol e Medicina', 'Honra a Apollo'),
(DEFAULT, 'Ártemis', 'Lua e Caça', 'Mira a Artemis'),
(DEFAULT, 'Hefesto', 'Fogo e Forja', 'Força a Hefesto'),
(DEFAULT, 'Afrodite', 'Amor e Beleza', 'Graca a Afrodite'),
(DEFAULT, 'Hermes', 'Fronteiras', 'Proteção Divina a Hermes'),
(DEFAULT, 'Dionísio', 'Festa e Vinho', 'Liberdade a Dionísio'),
(DEFAULT, 'Hades', 'Submundo', 'Eternidade a Hades'),
(DEFAULT, 'Íris', 'Arco-íris e Mensagens', 'Esperança a Íris'),
(DEFAULT, 'Hypnos', 'Sono e Sonhos', 'Serenidade a Hynos'),
(DEFAULT, 'Nêmesis', '	Retribuição e equilíbrio', 'Justiça a Nêmesis'),
(DEFAULT, 'Nike', 'Vitória', 'Triumfo a Nike'),
(DEFAULT, 'Hebe', 'Juventude', 'Vitalidade a Hebe'),
(DEFAULT, 'Tyche', 'Sorte', 'Fortuna a Tyche'),
(DEFAULT, 'Hécate', 'Mágia', 'Mistério a Hécate');


CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45) NOT NULL UNIQUE,
senha VARCHAR(45) NOT NULL,
dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
reclamado TINYINT DEFAULT 0,
CONSTRAINT chReclamado CHECK(reclamado IN(1, 0)),
fk_chale INT DEFAULT 11,
FOREIGN KEY (fk_chale) REFERENCES chale(id)
);

INSERT INTO usuario (id, nome, email, senha, reclamado, fk_chale) VALUES 
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

-- Consultando o chalé mais ocupado
CREATE VIEW vw_contagem AS (
SELECT
    c.divindade,
    COUNT(u.id) AS total
FROM chale AS c
LEFT JOIN usuario AS u
    ON u.fk_chale = c.id
GROUP BY c.id, c.divindade);

SELECT * FROM vw_contagem ORDER BY total DESC LIMIT 1;

-- Consultando quantos usuários fizeram o quiz (foram reclamados) e quantos não fizeram
SELECT
	SUM(CASE WHEN reclamado = 1 THEN 1 ELSE 0 END) AS reclamados,
	SUM(CASE WHEN reclamado = 0 THEN 1 ELSE 0 END) AS naoReclamados
                    FROM usuario;
                    
-- Consultando quantos chalés possuem usuários
SELECT COUNT(DISTINCT c.id) AS chalesOcupados
                FROM chale c
                LEFT JOIN usuario u
                ON u.fk_chale = c.id
                WHERE u.id IS NOT NULL;

-- Consultando quantos chalés possuem usuários
SELECT COUNT(*) AS total
FROM chale c
LEFT JOIN usuario u
ON u.fk_chale = c.id
WHERE u.id IS NULL;

-- Consultando a quantidade de usuários novos cadastrados no último mês
SELECT COUNT(*) AS novosMes
FROM usuario
WHERE MONTH(dt_cadastro) = MONTH(CURRENT_DATE())
AND YEAR(dt_cadastro) = YEAR(CURRENT_DATE());