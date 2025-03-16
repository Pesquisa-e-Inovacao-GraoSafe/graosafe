CREATE DATABASE silos;
USE Silos;


CREATE TABLE Empresa (
    idEmpresa INT AUTO_INCREMENT PRIMARY KEY,
    nomeFantasia VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE,
    dataCadastro DATE NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);
INSERT INTO Empresa (nomeFantasia, CNPJ, telefone, email, dataCadastro, rua, bairro, numero, uf, cidade)
VALUES 
('Fazenda Boa Vista', '12345678901234', '1111111111', 'fazendaboavista@example.com', '2025-02-15', 'Rua das Palmeiras', 'Centro', 1, 'SP', 'São Paulo'),
('Sítio Verde', '23456789012345', '2222222222', 'sitioverde@example.com', '2024-03-10', 'Rua das Flores', 'Jardim das Acácias', 2, 'RJ', 'Rio de Janeiro'),
('Chácara Esperança', '34567890123456', '3333333333', 'chacaraesperanca@example.com', '2024-04-05', 'Rua do Campo', 'Vila Nova', 3, 'MG', 'Belo Horizonte'),
('Horta Feliz', '45678901234567', '4444444444', 'hortafeliz@example.com', '2024-05-20', 'Rua das Hortas', 'Parque das Árvores', 4, 'RS', 'Porto Alegre'),
('Agro Sustentável', '56789012345678', '5555555555', 'agrosustentavel@example.com', '2024-06-30', 'Rua da Colheita', 'Bairro Verde', 5, 'BA', 'Salvador');

ALTER TABLE Empresa ADD COLUMN site VARCHAR(100);
SELECT * FROM Empresa;
SELECT * FROM Empresa WHERE nomeFantasia LIKE 'H%';

CREATE TABLE SensorTemperatura (
    idSensor INT AUTO_INCREMENT PRIMARY KEY, 
    dataInstalacao DATE NOT NULL,
    dataManutencao DATE,
    dataFabricacao DATE NOT NULL,
    numeroSerie VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    CONSTRAINT checkModelo CHECK (modelo IN ('LM35'))
);
INSERT INTO SensorTemperatura (dataInstalacao, dataManutencao, dataFabricacao, numeroSerie, modelo, fabricante)
VALUES 
('2024-02-15', '2024-08-15', '2023-12-01', 'SN12345', 'LM35', 'Fabricante A'),
('2024-03-10', '2024-09-10', '2023-11-15', 'SN23456', 'LM35', 'Fabricante B'),
('2024-04-05', '2024-10-05', '2023-10-20', 'SN34567', 'LM35', 'Fabricante C'),
('2024-05-20', '2024-11-20', '2023-09-25', 'SN45678', 'LM35', 'Fabricante D'),
('2024-06-30', '2024-12-30', '2023-08-30', 'SN56789', 'LM35', 'Fabricante E');

ALTER TABLE SensorTemperatura ADD COLUMN localInstalacao VARCHAR(100);
ALTER TABLE SensorTemperatura ADD COLUMN status VARCHAR(50);
SELECT * FROM SensorTemperatura WHERE fabricante = 'Fabricante A';
UPDATE SensorTemperatura
SET status = 'Ativo', localInstalacao = 'Sala de Controle' WHERE idSensor = 1;
SELECT * FROM SensorTemperatura;

CREATE TABLE Silo (
    idSilo INT AUTO_INCREMENT PRIMARY KEY,
    capacidadeToneladas DECIMAL(10, 2) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    dataUltimaInspecao DATE
);

INSERT INTO Silo (capacidadeToneladas, tipo, dataUltimaInspecao) VALUES
(250, 'armazenador', '2025-02-02'),
(400, 'armazenador', '2024-12-10'),
(150.75, 'Grãos', '2024-06-15'),
(200.50, 'secador', '2023-11-20'),
(175.00, 'expedição', '2025-01-10');

ALTER TABLE Silo ADD COLUMN localizacao VARCHAR(100);
SELECT * FROM Silo WHERE tipo = 'Grãos';
SELECT * FROM Silo WHERE localizacao = 'Fazenda Boa Vista';
ALTER TABLE Silo ADD COLUMN status VARCHAR(50);
UPDATE Silo SET status = 'Manutenção', dataUltimaInspecao = '2025-03-16' WHERE idSilo = 1;
SELECT capacidadeToneladas AS Capacidade, tipo AS Tipo, dataUltimaInspecao AS Data_Inspecao FROM Silo
WHERE tipo = 'Grãos';
