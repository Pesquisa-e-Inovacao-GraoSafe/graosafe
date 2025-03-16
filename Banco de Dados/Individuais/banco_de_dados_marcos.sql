CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE usuario(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR (30),
	empresaCliente VARCHAR(50) NOT NULL,
    cnpjCliente CHAR(14) UNIQUE,
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(30) NOT NULL CONSTRAINT CHK CHECK (EMAIL LIKE '%@%.com' OR email LIKE '%@%.com.br'),
	senha VARCHAR(8) NOT NULL,
    telefone VARCHAR(11),
	uf CHAR(2),
    cep CHAR(8),
    logradouro VARCHAR(20),
    bairro VARCHAR(20),
    cidade VARCHAR(20)
);

INSERT INTO usuario VALUES
	(DEFAULT, 'João', 'J. S.A', '12345678000112', DEFAULT, 'joão@gmail.com', '454as#45', '11999995490', 'MT', '12345000', 'Rua daqui', 'São Santo', 'Xique-Xique'),
	(DEFAULT, 'Maria', 'M. S.A', '23456789000123', DEFAULT, 'maria@yahoo.com.br', '467878@a', '1487565490', 'SP', '98765001', 'Rua de lá', 'Santo São', 'Ciudad');
    
SELECT * FROM usuario WHERE uf = 'MT';

CREATE TABLE sensorLM35(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    dtManutencao DATETIME,
    dtFabricacao DATETIME NOT NULL,
    dtInstalacao DATETIME NOT NULL,
    numeroSerie VARCHAR(10) UNIQUE,
    statusSensor VARCHAR(30) CONSTRAINT chkSensor CHECK (statusSensor IN ('Ativo', 'Inativo', 'Aguardando instalação')),
    empresaSensor VARCHAR(30)
);

INSERT INTO sensorLM35 VALUES
	(default, '2025-03-01 12:05:13', '2025-02-01 14:50:11', '2025-02-08 07:10:00','654564', 'Aguardando instalação', 'J. S.A'),
    (default, '2025-03-01 11:40:35', '2025-02-01 14:55:14', '2025-02-09 07:40:11', '654565', 'Inativo', 'M. S.A');
    
SELECT * FROM sensorLM35 WHERE dtInstalacao < '2025-02-09 07:40:11';

CREATE TABLE temperatura(
	idTemperatura INT PRIMARY KEY AUTO_INCREMENT,
    temperatura float(5,2),
    dtHoraRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    idSensor INT,
    idEmpresa INT
);

INSERT INTO temperatura VALUES
	(default, '24.54', default, 78, 78),
    (default, '30.00', default, 77, 77);

SELECT CONCAT(temperatura,  ' °C') AS 'Temperatura Registrada' FROM temperatura WHERE idEmpresa = 77;