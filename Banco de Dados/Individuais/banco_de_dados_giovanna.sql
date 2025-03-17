CREATE DATABASE GRAOSAFE;
USE GRAOSAFE;

CREATE TABLE Empresa 
(idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(40),
cnpj CHAR(14)NOT NULL,
cep CHAR(8) NOT NULL,
cidade VARCHAR(40) NOT NULL,
bairro VARCHAR(50) NOT NULL,
uf CHAR(2) NOT NULL,
telefone CHAR(9) NOT NULL,
dtCadastro DATETIME DEFAULT current_timestamp
);

CREATE TABLE Silo
(idSilo INT PRIMARY KEY AUTO_INCREMENT,
idEmpresa INT NOT NULL,
idSensor INT NOT NULL UNIQUE,
capacidadeSilo FLOAT
);

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT, 
numSerie INT,
dtFabricação DATETIME DEFAULT current_timestamp,
situacao VARCHAR(8) DEFAULT 'estoque',
CONSTRAINT chkSituacao CHECK(situacao in('vendido', 'estoque'))
);

CREATE TABLE vendaSensor(
idVenda INT PRIMARY KEY AUTO_INCREMENT,
idSensor INT UNIQUE,
idEmpresa INT,
dtCompra DATETIME DEFAULT current_timestamp,
dtGarantia DATETIME,
notaFiscal CHAR(9)
);

CREATE TABLE registroTemperatura(
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
idSilo INT NOT NULL,
dataHorario DATETIME DEFAULT CURRENT_TIMESTAMP(),
temperatura DECIMAL(5,2) NOT NULL
);

CREATE TABLE usuario( 
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(40),
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(40) NOT NULL,
idEmpresa INT,
CONSTRAINT chkEmailUsuario CHECK(email LIKE '%@%'));

INSERT INTO empresa (nomeEmpresa, cnpj, cep, cidade, bairro, uf, telefone, dtCadastro) VALUES 
('GraoSafe', '19284939000132', '02212010', 'São Paulo', 'Centro', 'SP', '998394859', default),
('AgroSilo', '19385930000123','02144030', 'Campinas', 'Tatuapé', 'SP', '193456789', default),
('SojaSilo', '29384920000123','02287463', 'Curitiba', 'Jardim das Flores', 'PR', '413456789', default),
('AgroSoja', '84938593000187','02937462', 'Porto Alegre', 'Redenção', 'RS', '993928493', default),
('Milhão', '84392938000145','02212010', 'São Paulo', 'Centro', 'SC', '993829193', default),
('SoyAgro', '13579246800102','02071003', 'Belo Horizonte', 'Centro Histórico', 'MG', '912939293', default);

INSERT INTO Silo (idEmpresa, idSensor, capacidadeSilo) VALUES
(1, 1, 150),
(1, 2, 150),
(1, 3, 150),
(2, 4, 100),
(3, 5, 200),
(4, 6, 200),
(5, 7, 250),
(6, 8, 100),
(6, 9, 240),
(6, 10, 200);

INSERT INTO Sensor (numSerie, dtFabricação, situacao) VALUES
(398213222, default, default),
(284738694, default, 'vendido'),
(837463758, default, default),
(283746374, default, 'vendido'),
(874387583, default, 'vendido'),
(473828448, default, default);

INSERT INTO registroTemperatura (idSilo, dataHorario, temperatura)
VALUES
(1, default, 24),
(2, default, 23),
(3, default, 10),
(4, default, 5),
(5, default, 39),
(6, default, 25);

INSERT INTO usuario (nomeUsuario, email, senha, idEmpresa) VALUES
('Maria', 'maria@gmail.com', 'senha832893', 1),
('Joana', 'joana@gmail.com', '47398snha', 2),
('Pedro', 'pedra@gmail.com', 'password1232', 3),
('Lucas', 'lucas2@gmail.com', 'chave232', 4),
('Fernanda', 'fernanda2@gmail.com', 'dkdksjf', 5),
('Lucas', 'lucas@gmail.com', 'acesso2993', 6);

INSERT INTO vendaSensor (idSensor, idEmpresa, dtCompra, notaFiscal) VALUES
(1, 4, default, '333333333'),
(2, 4, default, '828385732'),
(3, 4, default, '919191919');

DESC Empresa;

ALTER TABLE Usuario ADD CONSTRAINT chkUsuario01 CHECK(email like '%@%');

SELECT nomeUsuario 
as Nome, email 
as Email 
FROM Usuario; 

SELECT 
nomeEmpresa as 'Nome da Empresa', 
cnpj as CNPJ, 
cidade as Cidade 
FROM Empresa; 

SELECT * FROM EMPRESA;

DELETE FROM Empresa WHERE idEmpresa = 18;

UPDATE Empresa 
SET nomeEmpresa = 'Silosoy' 
WHERE idEmpresa = 14;

ALTER TABLE Empresa 
MODIFY COLUMN nomeEmpresa VARCHAR(40) NOT NULL;

DROP TABLE usuario;
DROP DATABASE GRAOSAFE;

SELECT * FROM registroTemperatura;

