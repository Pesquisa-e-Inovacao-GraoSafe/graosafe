CREATE DATABASE PI;
USE PI;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY auto_increment,
nome VARCHAR(255),
usuario VARCHAR(50),
dataCadastro DATETIME,
email VARCHAR(255),
senha VARCHAR(255),
telefone VARCHAR(20),
UF CHAR(2),
logradouro VARCHAR(255),
bairro VARCHAR(40),
cidade VARCHAR(40),
CEP CHAR(9)
);

ALTER TABLE empresa ADD CONSTRAINT chkemail 
	CHECK (email LIKE '%@gmail.com' OR email LIKE '%@outlook.com' OR email LIKE '%@hotmail.com');

CREATE TABLE equipamento (
idEquipamento INT PRIMARY KEY auto_increment,
dtInstalacao DATE,
dtManutencao DATETIME
);

ALTER TABLE equipamento RENAME COLUMN dtManutencao TO garantia;
ALTER TABLE equipamento MODIFY COLUMN garantia DATE;   

CREATE TABLE temperatura (
idTemperatura INT PRIMARY KEY auto_increment,
valor DECIMAL(3,1),
dtRegistro DATETIME,
sensor INT
);

ALTER TABLE temperatura ADD COLUMN numSerie CHAR(7)UNIQUE;
    
INSERT INTO empresa
	(nome, usuario, dataCadastro, email, senha, telefone, UF, logradouro, bairro, cidade, CEP) VALUES
	('Sementes do Sol Ltda.', 'sementes_sol', '2023-10-27 20:00:00', 'sementesdosol@gmail.com', 'senha123', '51999991111', 'RS', 'Av. das Nações Unidas, 1500', 'Centro', 'Passo Fundo', '99010-123'),
	('Terra Fértil Grãos S.A.', 'terra_fertil', '2023-10-27 21:30:00', 'vendasterrafertil@outlook.com', 'senha456', '62988882222', 'GO', 'Rua dos Grãos, 200', 'Jardim Goiás', 'Goiânia', '74810-400'),
	('Colheita Dourada Agroindústria', 'colheita_dourada', '2023-10-27 12:45:00', 'rhcolheitadourada@hotmail.com', 'senha789', '43977773333', 'PR', 'Estrada da Soja, km 5', 'Zona Rural', 'Londrina', '86000-000'),
	('Raízes do Campo Alimentos', 'raizes_campo', '2023-10-27 15:20:00', 'financeiroraizesdocampo@outlook.com', 'senhaabc', '34966664444', 'MG', 'Praça da Matriz, 10', 'Centro', 'Uberlândia', '38400-000'),
	('Verde Soja Exportação Ltda.', 'verde_soja', '2023-10-27 16:55:00', 'importverdesoja@gmail.com', 'senhaxyz', '77955555555', 'BA', 'Rodovia BR-242, s/n', 'Industrial', 'Luís Eduardo Magalhães', '47850-000'),
	('Soja Premium Brasil S.A.', 'soja_premium', '2023-10-27 14:10:00', 'qualidadesojapremium@hotmail.com', 'senha1a2b', '65944446666', 'MT', 'Av. Brasil, 1200', 'Centro', 'Sinop', '78550-000'),
	('Grãos Nobres do Cerrado Ltda.', 'graos_nobres', '2023-10-27 13:30:00', 'marketingraosnobres@outlook.com', 'senha3c4d', '16933337777', 'SP', 'Rua da Produção, 300', 'Vila Nova', 'Ribeirão Preto', '14000-000'),
	('Excelência Soja Indústria', 'excelencia_soja', '2023-10-27 10:45:00', 'comercialexcelenciasoja@hotmail.com', 'senha5e6f', '81922228888', 'PE', 'Distrito Industrial, Galpão 5', 'Industrial', 'Petrolina', '56300-000');

INSERT INTO equipamento (dtInstalacao, garantia) VALUES 
	('2024-10-27', '2027-10-27'),
	('2025-01-15', '2028-01-15'),
	('2024-05-01', '2027-05-01'),
	('2025-02-10', '2028-02-10'),
	('2024-12-05', '2027-12-05');
    
INSERT INTO temperatura (valor, dtRegistro, sensor, numSerie) VALUES
	(25.5, '2025-01-15 08:00:00', 1, 'LM35058'),
	(26.0, '2025-03-10 14:30:00', 1, 'LM35064'),
	(18.5, '2024-05-01 10:45:00', 2, 'LM35082'),
	(27.2, '2024-07-12 16:15:00', 3, 'LM35093'),
	(19.8, '2025-02-08 12:00:00', 2, 'LM35022'),
	(26.3, '2024-11-25 18:30:00', 1, 'LM35079'),
	(17.2, '2024-01-05 09:15:00', 3, 'LM35053'),
	(27.0, '2025-02-18 15:45:00', 2, 'LM35010'),
	(25.8, '2024-08-30 11:00:00', 1, 'LM35046'),
	(31.5, '2024-12-10 17:00:00', 3, 'LM35037');

SELECT * FROM empresa WHERE UF = 'SP';    
SELECT nome, usuario, email, UF FROM empresa WHERE usuario LIKE '%soja%';
SELECT * FROM empresa ORDER BY nome; 
SELECT * FROM empresa ORDER BY UF DESC;
SELECT UF, cidade FROM empresa WHERE nome LIKE '%a'ORDER BY usuario;
DESCRIBE empresa; 
ALTER TABLE empresa DROP COLUMN CEP;
DELETE FROM empresa WHERE idEmpresa = 1;

SELECT * FROM equipamento;
INSERT INTO equipamento (dtInstalacao) VALUES
	('2023-12-29'),
    ('2024-07-08'),
    ('2025-01-28');
SELECT garantia,
	ifnull(garantia, 'Sem data de garantia')
		FROM equipamento;
UPDATE equipamento SET garantia = '2028-10-27'
	WHERE idEquipamento = 1;
UPDATE equipamento SET garantia = '2029-01-15'
	WHERE idEquipamento = 2;
UPDATE equipamento SET garantia = '2028-05-01'
	WHERE idEquipamento = 3;
UPDATE equipamento SET garantia = '2029-02-10'
	WHERE idEquipamento = 4;
UPDATE equipamento SET garantia = '2028-12-05'
	WHERE idEquipamento = 5;

ALTER TABLE temperatura RENAME COLUMN numSerie TO numeroSerie;
SELECT 
	valor AS 'Registro de temperatura',
    dtREgistro AS 'Data do registro',
    sensor AS 'Identificação do sensor',
    numeroSerie AS 'Número de série do sensor'
FROM temperatura;

SELECT numeroSerie, 
CASE 
    WHEN numeroSerie LIKE "LM35%"THEN 'Sensor de temperatura'
    ELSE 'Outro tipo de sensor'
		END AS 'Tipo de sensor'
			FROM temperatura;