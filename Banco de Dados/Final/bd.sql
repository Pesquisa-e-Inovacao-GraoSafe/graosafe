create database grupoPI;
use grupoPI;

CREATE TABLE Cliente(
idCliente int primary key auto_increment not null,
razaoSocial VARCHAR(50) not null,
nomeFantasia VARCHAR(50) not null,
cnpj varchar(14) not null, -- 14 digítos pra maximizar o valor de dígitos
dtCadastro datetime default current_timestamp,
email VARCHAR(100) not null, -- confirmar se o email é valido entre hotmail, outlook ou gmail
CONSTRAINT checkEmail check(email LIKE '%@gmail.com' or email LIKE '%@hotmail.com' or email LIKE '%@outlook.com'),
senha VARCHAR(100) not null,
telefone varchar(14) not null,
UF CHAR(2) not null,
rua VARCHAR(100) not null,
bairro VARCHAR(20) not null,
cidade VARCHAR(50) not null,
cep int not null);

CREATE TABLE sensorLM35(
idSensor int primary key auto_increment not null,
numSerie VARCHAR(100) unique,
dtFabricacao date not null,
dtCompra datetime not null,
statusManutencao VARCHAR(20) not null,
CONSTRAINT checkManutencao CHECK(statusManutencao IN("Ativo","Inativo","Manutencao")),
dtManutencao datetime not null
);

CREATE TABLE silo(
idSilo int not null primary key,
idCliente int not null,  -- não é primary key porque uma empresa pode ter vários silos e/ou vários equipamentos
dtInstalacao datetime not null, -- date time pra ver horário de tudo
idSensor int not null);

CREATE TABLE temperatura(
	idTemperatura int primary key auto_increment,
    idSensor int not null unique,
    idCliente int not null,
    temperatura float(5,2) not null,
    dtRegistro datetime default current_timestamp
);

ALTER TABLE Cliente ADD CONSTRAINT checkCnpj CHECK (LENGTH(cnpj) = 14);
ALTER TABLE Cliente ADD CONSTRAINT checkTelefone CHECK (LENGTH(telefone) <= 14 and LENGTH(telefone) >= 12);
ALTER TABLE Cliente ADD CONSTRAINT checkCep CHECK (LENGTH(cep) = 8);
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