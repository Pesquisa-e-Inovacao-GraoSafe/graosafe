-- PAULO CESAR HERMANO PELICER - R.A. 01251081 - ADS A - SALA 6A

-- MINHA VERSÃO DO BANCO DE DADOS DE PI -  CONTROLE DE TEMPERATURA EM SILOS DE SOJA

CREATE DATABASE silo;

USE silo;

CREATE TABLE silo (
	idSilo INT(8) PRIMARY KEY AUTO_INCREMENT,
	capacidadeMaximaSilo DECIMAL(9,2),
	qtdSojaArmazenada DECIMAL(9,2),
	dtArmazenamentoSoja DATE 
	);
    
CREATE TABLE sensor (
	idSensor INT(8) PRIMARY KEY AUTO_INCREMENT,
	dtInstalacao DATE,
	dataHora DATETIME,
	statusFuncionamento VARCHAR(40) 
	);
    
CREATE TABLE temperatura (
	idTemperatura INT(8) PRIMARY KEY AUTO_INCREMENT,
    temperaturaAferida DECIMAL(9,2),
    dataHora DATETIME
    );

CREATE TABLE cliente (
	idcliente INT(8) PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(50),
    nomeFantasia VARCHAR(50),
    cnpj CHAR(14),
    descricaoLogradouro VARCHAR(50),
    tipoLogradouro VARCHAR(40),
    numeroEndereco INT(10),
    nomeBairro VARCHAR(50),
    nomeCidade VARCHAR(50),
    ufEstado CHAR(2),
    cep CHAR(10),
	dataCadastro DATE,    
    email VARCHAR(45),
    telComercial CHAR(11),
    codigoAtivacao VARCHAR(50)
    );
    
CREATE TABLE usuario (
	idUsuario INT(8) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cargoResponsavel VARCHAR(45),
    telComercial CHAR(11),
    email VARCHAR(45),
    senha VARCHAR (45)
    );
    
INSERT INTO silo (capacidadeMaximaSilo, qtdSojaArmazenada, dtArmazenamentoSoja) VALUES
(150000.00, 120000.50, '2024-09-10'),
(80000.00, 65000.75, '2024-10-05'),
(120000.00, 100500.25, '2024-11-20'),
(180000.00, 175000.00, '2024-12-15'),
(200000.00, 195000.60, '2025-01-08'),
(95000.00, 85000.40, '2025-02-12');

INSERT INTO sensor (dtInstalacao, dataHora, statusFuncionamento) VALUES
('2024-09-01', '2025-02-28 08:00:00', 'Ativo'),
('2024-09-15', '2025-02-28 08:10:00', 'Ativo'),
('2024-10-10', '2025-02-28 08:20:00', 'Manutenção'),
('2024-11-05', '2025-02-28 08:30:00', 'Ativo'),
('2024-12-20', '2025-02-28 08:40:00', 'Inativo'),
('2025-01-15', '2025-02-28 08:50:00', 'Ativo');

INSERT INTO temperatura (temperaturaAferida, dataHora) VALUES
(22.5, '2025-02-19 08:00:00'),
(24.1, '2025-02-20 08:00:00'),
(26.7, '2025-02-21 08:00:00'),
(28.3, '2025-02-22 08:00:00'),
(27.0, '2025-02-23 08:00:00'),
(25.5, '2025-02-24 08:00:00');

INSERT INTO cliente (razaoSocial, nomeFantasia, cnpj, descricaoLogradouro, tipoLogradouro, numeroEndereco, nomeBairro, nomeCidade, ufEstado, cep, dataCadastro, email, telComercial, codigoAtivacao) VALUES
('AgroTech Solutions Ltda', 'AgroTech', '12345678000190', 'Avenida Brasil', 'Avenida', 1200, 'Centro', 'São Paulo', 'SP', '01010-000', '2025-02-10', 'contato@agrotech.com.br', '11987654321', 'A1B2C3D4E5F6G7H8I9J0'),
('Silo Verde LTDA', 'Silo Verde', '98765432000155', 'Rua das Palmeiras', 'Rua', 45, 'Jardins', 'Curitiba', 'PR', '80010-000', '2025-01-25', 'comercial@siloverde.com', '41987654321', 'J9I8H7G6F5E4D3C2B1A0'),
('Campo Seguro SA', 'Campo Seguro', '32165498000122', 'Estrada Rural', 'Estrada', 500, 'Zona Rural', 'Goiânia', 'GO', '74000-000', '2024-12-15', 'suporte@camposeguro.com.br', '62987654321', 'K1L2M3N4O5P6Q7R8S9T0'),
('Grãos do Brasil Ltda', 'Grãos Brasil', '45698712000133', 'Avenida das Indústrias', 'Avenida', 900, 'Distrito Industrial', 'Belo Horizonte', 'MG', '31000-000', '2025-02-05', 'financeiro@graosbr.com.br', '31987654321', 'Z1Y2X3W4V5U6T7S8R9Q0'),
('Agro Forte Comércio', 'Agro Forte', '78912365000144', 'Rodovia BR-101', 'Rodovia', 2000, 'Área Industrial', 'Recife', 'PE', '50000-000', '2024-11-30', 'vendas@agroforte.com', '81987654321', 'Q1W2E3R4T5Y6U7I8O9P0'),
('Semente Boa Agropecuária', 'Semente Boa', '85274196000177', 'Rua do Comércio', 'Rua', 150, 'Centro', 'Porto Alegre', 'RS', '90000-000', '2025-02-20', 'contato@sementeboa.com.br', '51987654321', 'M1N2B3V4C5X6Z7A8S9D0');

INSERT INTO usuario (nome, cargoResponsavel, telComercial, email, senha) VALUES
('Carlos Ferreira', 'Gerente de Operações', '11987654321', 'carlos@agrotech.com.br', 'Senha123'),
('Mariana Souza', 'Analista de Qualidade', '41987654321', 'mariana@siloverde.com', 'Segura456'),
('Ricardo Lima', 'Supervisor de Armazém', '62987654321', 'ricardo@camposeguro.com.br', 'Teste789'),
('Fernanda Alves', 'Coordenadora de Logística', '31987654321', 'fernanda@graosbr.com.br', 'Log1234'),
('Bruno Martins', 'Diretor Comercial', '81987654321', 'bruno@agroforte.com', 'Venda567'),
('Tatiane Oliveira', 'Técnica de Monitoramento', '51987654321', 'tatiane@sementeboa.com.br', 'Monitor890');

SELECT * FROM silo;
SELECT * FROM sensor;
SELECT * FROM temperatura;
SELECT * FROM cliente;
SELECT * FROM usuario;

UPDATE sensor SET statusFuncionamento = "Inativo" WHERE idSensor = 3;

DELETE FROM sensor WHERE idSensor = 6;

ALTER TABLE sensor ADD CONSTRAINT checkStatusFuncionamento CHECK (statusFuncionamento IN ('Ativo', 'Inativo', 'Manutenção'));

SELECT * FROM cliente ORDER BY razaoSocial ASC;
    
    
    