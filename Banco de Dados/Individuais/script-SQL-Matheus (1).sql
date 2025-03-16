drop database grupoPI;
create database grupoPI;
use grupoPI;

CREATE TABLE dadosCliente(
idCliente int primary key auto_increment not null,
nome VARCHAR(50) not null,
cnpj varchar(14) not null, -- 14 digítos pra maximizar o valor de dígitos
dtCadastro date not null,
email VARCHAR(100) not null, -- confirmar se o email é valido entre hotmail, outlook ou gmail
CONSTRAINT checkEmail check(email LIKE '%@gmail.com' or email LIKE '%@hotmail.com' or email LIKE '%@outlook.com'),
senha VARCHAR(100) not null,
telefone bigint not null,
UF VARCHAR(5),
rua VARCHAR(100),
bairro VARCHAR(20),
cidade VARCHAR(50),
cep int not null);

CREATE TABLE equipamento(
idEquipamento int primary key auto_increment not null,
dtFabricacao date not null,
dtCompra datetime not null,
dtInstalacao datetime not null, -- date time pra ver horário de tudo
dtManutencao datetime not null);

CREATE TABLE silo(
idSilo int not null,
idEmpresa int not null, -- não é primary key pq uma empresa pode ter vários silos e/ou vários equpamentos
tipoEquipamento varchar(50) not null,
tamanhoSilo int not null,
qtd int not null,
registroTemperatura DECIMAL(5,2) not null,
dataRegistro datetime not null);


ALTER TABLE dadosCliente ADD CONSTRAINT checkCnpj CHECK (LENGTH(cnpj) = 14);
ALTER TABLE dadosCliente ADD CONSTRAINT checkTelefone CHECK (LENGHT(telefone) <= 14 and LENGHT(telefone) >= 13);
ALTER TABLE dadosCliente ADD CONSTRAINT checkCep CHECK (LENGHT(cep) = 8);
INSERT INTO dadosCliente (nome, cnpj, dtCadastro, email, senha, telefone, UF, rua, bairro, cidade, cep)
VALUES
('Empresa ABC', 12345678000195, '2025-03-01', 'empresaabc@gmail.com', 'senha123', 11987654321, 'SP', 'Rua A', 'Bairro X', 'São Paulo', 12345678),
('Tech Solutions', 98765432000100, '2025-02-15', 'techsolutions@hotmail.com', 'senha456', 11976543210, 'RJ', 'Avenida B', 'Bairro Y', 'Rio de Janeiro', 87654321),
('Logistica LTDA', 19283746500010, '2025-01-30', 'logistica.ltda@outlook.com', 'senha789', 11965432109, 'MG', 'Rua C', 'Bairro Z', 'Belo Horizonte', 23456789);

INSERT INTO equipamento (dtFabricacao, dtCompra, dtInstalacao, dtManutencao)
VALUES
('2023-06-10', '2024-07-15 10:00:00', '2025-03-05 14:30:00', '2026-06-12'),
('2023-11-20', '2024-01-10 09:00:00', '2025-02-25 16:45:00', '2026-11-22'),
('2023-03-05', '2024-03-10 13:00:00', '2025-02-28 11:00:00', '2026-03-07');

ALTER TABLE silo ADD CONSTRAINT checkEquipamento CHECK(tipoEquipamento IN("LM35","DHT-11"));
INSERT INTO silo (idSilo, idEmpresa, tipoEquipamento, tamanhoSilo, qtd, registroTemperatura, dataRegistro)
VALUES
(1, 1, 'LH35', 50, 200, '23.5', '2025-03-05 10:00:00'),
(2, 1, 'LM35', 70, 300, '22.0', '2025-03-06 12:30:00'),
(1, 2, 'DHT-11', 40, 150, '18.5', '2025-03-07 14:00:00');

SELECT
idCliente as "Número de Ientificação da Empresa",
nome as "Nome da Empresa",
cnpj as "CNPJ",
dtCadastro as "Data de Cadastro",
email as "E-Mail",
senha as "Senha",
telefone as "Telefone (+55XXYYYYYYYYY)",
UF as "Unidade Federativa",
rua as "Rua",
bairro as "Bairro",
cidade as "Cidade",
cep as "CEP" FROM dadosCliente;


SELECT 
idEquipamento as 'Identificação do Sensor',
dtFabricacao as 'Data de Fabricação do Sensor', 
dtCompra as 'Data de compra', 
dtInstalacao as 'Data de instalação do sensor', 
dtManutencao as 'Data de manutenção do sensor' from equipamento;

SELECT
idSilo as 'Identificação do Silo',
idEmpresa as 'Identificação da Empresa',
tipoEquipamento as 'Sensor',
CONCAT(tamanhoSilo, ' hectares') as 'Tamanho do Terreno',
CONCAT(qtd, ' toneladas colhidas.') as 'Registro da colheita',
CONCAT(registroTemperatura,'°C') as 'Temperatura',
CASE WHEN registroTemperatura > 30 or registroTemperatura < 20 THEN "ALERTA" ELSE "Valor Ideal" END as Controle,
CASE WHEN registroTemperatura > 30 or registroTemperatura < 20 THEN CONCAT((qtd * 0.15), " toneladas") ELSE "Nenhum produto perdido." END as "Quantia Perdida pela Temperatura (15%)",
dataRegistro as 'Data de Registro' from silo;



