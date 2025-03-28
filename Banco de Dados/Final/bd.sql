drop database grupoPI;
create database grupoPI;
use grupoPI;

CREATE TABLE Cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(50) NOT NULL,
nomeFantasia VARCHAR(50) NOT NULL,
cnpj CHAR(14) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
email VARCHAR(100) NOT NULL, -- Confirmando se o email possui @, mas sem verificar o domínio pois cada empresa pode ter seu próprio domínio
CONSTRAINT checkEmail check(email LIKE '%@%'),
senha VARCHAR(100) NOT NULL,
telefone VARCHAR(14) NOT NULL,
UF CHAR(2) NOT NULL,
rua VARCHAR(100) NOT NULL,
bairro VARCHAR(20) NOT NULL,
cidade VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL
);

CREATE TABLE sensorLM35(
idSensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numSerie VARCHAR(100) UNIQUE NOT NULL,
dtFabricacao  DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
dtCompra DATETIME NOT NULL,
statusManutencao VARCHAR(10) DEFAULT "Inativo" NOT NULL,
CONSTRAINT checkManutencao CHECK(statusManutencao IN("Ativo","Inativo","Manutencao")),
dtManutencao DATETIME NOT NULL
);

CREATE TABLE silo(
idSilo INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL,  -- Não é unique porque uma empresa pode ter vários silos e/ou vários equipamentos
dtInstalacao  DATETIME, 
idSensor INT NOT NULL);

CREATE TABLE temperatura(
	idTemperatura INT PRIMARY KEY AUTO_INCREMENT,
    idSensor INT NOT NULL,
    idCliente INT NOT NULL,
    temperatura FLOAT(5,2) NOT NULL,
    dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE Cliente ADD CONSTRAINT checkTelefone CHECK (LENGTH(telefone) <= 14 and LENGTH(telefone) >= 12);
INSERT INTO Cliente (razaoSocial, nomeFantasia, cnpj, dtCadastro, email, senha, telefone, UF, rua, bairro, cidade, cep)
VALUES
('Mercado Donuts', 'Empresa ABC', 12345678000195, '2025-03-01', 'empresaabc@gmail.com', 'senha123', 5511987654321, 'SP', 'Rua A', 'Bairro X', 'São Paulo', 12345678),
('MGTech', 'Tech Solutions', 98765432000100, '2025-02-15', 'techsolutions@hotmail.com', 'senha456', 5511976543210, 'RJ', 'Rua B', 'Bairro Y', 'Rio de Janeiro', 87654321),
('Logitecnica', 'Logistica LTDA', 19283746500010, '2025-01-30', 'logistica.ltda@outlook.com', 'senha789', 5511965432109, 'MG', 'Rua C', 'Bairro Z', 'Belo Horizonte', 23456789);

INSERT INTO sensorLM35 (numSerie, dtFabricacao, dtCompra, dtManutencao, statusManutencao)
VALUES
('9AKREG935G9', '2023-06-10', '2024-07-15 10:00:00', '2025-03-05 14:30:00', 'Ativo'),
('SAF4290KF29', '2023-11-20', '2024-01-10 09:00:00', '2025-02-25 16:45:00', 'Inativo'),
('ASDKF94K9F2', '2023-03-05', '2024-03-10 13:00:00', '2025-02-28 11:00:00', 'Inativo');

INSERT INTO silo (idSilo, idCliente, idSensor, dtInstalacao)
VALUES
(1, 1, 1, '2025-03-05 10:00:00'),
(2, 2, 2, '2025-03-06 12:30:00'),
(3, 3, 3, '2025-03-07 14:00:00');

INSERT INTO temperatura (idSensor, idCliente, temperatura) VALUES
(1, 1, 24.5),
(2, 2, 29),
(3, 3, 35);
    
SELECT
idCliente as "Número de identificação da Empresa",
razaoSocial as "Nome da Empresa",
nomeFantasia as "Nome Fantasia",
cnpj as "CNPJ",
dtCadastro as "Data de Cadastro",
email as "E-Mail",
senha as "Senha",
CONCAT("+", telefone) as "Telefone (XXYYZZZZZZZZZ)",
UF as "Unidade Federativa",
rua as "Rua",
bairro as "Bairro",
cidade as "Cidade",
cep as "CEP" FROM Cliente;

select * from temperatura where temperatura >30 or temperatura<20;

SELECT 
idSensor as 'Identificação do Sensor',
numSerie as 'Número de série',
dtFabricacao as 'Data de Fabricação do Sensor', 
dtCompra as 'Data de compra', 
dtManutencao as 'Data de manutenção do sensor',
statusSensor as "Status do sensor" from sensorLM35;

SELECT
idSilo as 'Identificação do Silo',
idCliente as 'Identificação da Empresa',
idSensor as 'Sensor',
dtInstalacao as "Data de Instalação do Sensor" from silo;

SELECT 
idTemperatura as "Identificação",
idSensor as "Identificação do Sensor",
idCliente as "Identificação do Cliente",
CONCAT(temperatura,'°C') as 'Temperatura',
CASE WHEN temperatura > 30 or temperatura < 20 
THEN "ALERTA" 
ELSE "Valor Ideal" END as Controle,
dtRegistro as 'Data de Registro' from temperatura;

SELECT * FROM temperatura WHERE temperatura > 30 or temperatura < 20;

INSERT INTO Cliente (razaoSocial, nomeFantasia, cnpj, email, senha, telefone, UF, rua, bairro, cidade, cep) VALUES
('Empresa ABC Ltda', 'ABC Soluções', '12345678000195', 'cliente1@gmail.com', 'Senha123!', '119876543210', 'SP', 'Av. Paulista, 1000', 'Centro', 'São Paulo', 12345678),
('Tech Innovators S.A.', 'TechIn', '98765432000167', 'cliente2@hotmail.com', 'Segura@2024', '219876543210', 'RJ', 'Rua das Inovações, 500', 'Botafogo', 'Rio de Janeiro', 22250040),
('AgroMais Comércio Ltda', 'AgroMais', '11223344000188', 'cliente3@outlook.com', 'Agro@1234', '619876543210', 'DF', 'SQN 202 Bloco A', 'Asa Norte', 'Brasília', 70832000),
('EletroMax Indústria Ltda', 'EletroMax', '33445566000122', 'cliente4@gmail.com', 'Eletro@2024', '319876543210', 'MG', 'Rua dos Eletrônicos, 120', 'Savassi', 'Belo Horizonte', 30112000),
('Construtora Forte S.A.', 'Forte Engenharia', '55667788000144', 'cliente5@hotmail.com', 'Forte@Eng123', '419876543210', 'BA', 'Av. Paralela, 8000', 'Pituba', 'Salvador', 41830000),
('BioTech Solutions Ltda', 'BioTech', '66778899000155', 'cliente6@outlook.com', 'Bio@Tech321', '519876543210', 'RS', 'Rua das Inovações, 350', 'Moinhos de Vento', 'Porto Alegre', 90560000);

INSERT INTO sensorLM35 (numSerie, dtFabricacao, dtCompra, statusSensor, dtManutencao) VALUES
('SN1234567890', '2024-01-10', '2024-02-15 10:30:00', 'Ativo', '2025-02-15 10:30:00'),
('SN0987654321', '2023-12-05', '2024-02-20 11:45:00', 'Manutencao', '2025-02-20 11:45:00'),
('SN5678901234', '2024-02-01', '2024-03-01 14:00:00', 'Inativo', '2025-03-01 14:00:00'),
('SN1122334455', '2024-01-20', '2024-03-10 09:15:00', 'Ativo', '2025-03-10 09:15:00'),
('SN5566778899', '2023-11-30', '2024-03-15 16:45:00', 'Manutencao', '2025-03-15 16:45:00'),
('SN6677889900', '2024-02-10', '2024-03-20 08:00:00', 'Ativo', '2025-03-20 08:00:00');

DELETE FROM sensorLM35 WHERE idSensor BETWEEN 6 AND 8;

UPDATE sensorLM35 SET statusSensor = "Ativo" WHERE idSensor = 5;

INSERT INTO silo (idSilo, idCliente, dtInstalacao, idSensor) VALUES
(4, 4, '2024-04-01 08:00:00', 4),
(5, 5, '2024-04-05 10:30:00', 5),
(6, 6, '2024-04-10 14:00:00', 6),
(7, 4, '2024-04-15 09:15:00', 4),
(8, 5, '2024-04-20 16:45:00', 5),
(9, 6, '2024-04-25 08:00:00', 6);

INSERT INTO temperatura (idSensor, idCliente, temperatura, dtRegistro) VALUES
(4, 4, 28, '2025-03-01 08:30:00'),
(5, 5, 30, '2025-03-02 09:45:00'),
(6, 6, 27, '2025-03-03 14:20:00');

INSERT INTO sensorLM35 (idSensor, numSerie, dtFabricacao, dtCompra, statusSensor, dtManutencao) VALUES
(6, 'SN5678901234', '2024-02-01', '2024-03-01 14:00:00', 'Inativo', '2025-03-01 14:00:00'),
(7, 'SN1122334455', '2024-01-20', '2024-03-10 09:15:00', 'Ativo', '2025-03-10 09:15:00'),
(8, 'SN5566778899', '2023-11-30', '2024-03-15 16:45:00', 'Manutencao', '2025-03-15 16:45:00');