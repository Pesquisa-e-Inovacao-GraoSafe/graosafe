CREATE DATABASE Grupo_de_PI;
USE Grupo_de_PI;

CREATE TABLE Empresa (
ID INT PRIMARY KEY AUTO_INCREMENT,
Usuario VARCHAR (100),
Nome VARCHAR(50),
CNPJ CHAR(18),
DtCadastro DATE,
Email VARCHAR(100),
Senha VARCHAR(30),
Telefone CHAR(15),
UF CHAR(2),
Rua VARCHAR(50),
Bairro VARCHAR(50),
Cidade VARCHAR(50),
Cep CHAR(9)
);

INSERT INTO Empresa (Usuario, Nome, CNPJ, DtCadastro, Email, Senha, Telefone, UF, Rua, Bairro, Cidade, Cep)
VALUES
('JoaoFerreira', 'Grãos do Sol Ltda', '12.345.678/0001-01', '2022-07-12', 'graosdosol@gmail.com', 'Soja#2022!', '(11) 90765-4321', 'SP', 'Rua Soja Branca', 'Bairro Verde', 'São Paulo', '01001-000'),
('BeatrizPereira', 'Sementes da Terra Ltda', '23.456.789/0001-02', '2021-05-08', 'sementesdaterra@outlook.com', 'Raiz@2021$', '(21) 93654-7890', 'RJ', 'Av. Grãos Verdes', 'Centro Agrícola', 'Rio de Janeiro', '20040-020'),
('MarceloSantos', 'Campo de Ouro Ltda', '34.567.890/0001-03', '2023-03-15', 'campodeouro@gmail.com', 'Campo@2023!', '(31) 96543-8765', 'MG', 'Rua das Sementes', 'Bairro São João', 'Belo Horizonte', '30110-010'),
('CarlaOliveira', 'Soja do Futuro Ltda', '45.678.901/0001-04', '2024-01-22', 'sojadofuturo@outlook.com', 'Futuro@2024#', '(41) 93456-7890', 'PR', 'Rua do Plantio', 'Vila Agricola', 'Curitiba', '80010-000'),
('FelipeCosta', 'Verde Campo Ltda', '56.789.012/0001-05', '2020-11-30', 'verdecampo@gmail.com', 'Verde!Campo@2020', '(51) 92345-6789', 'RS', 'Av. das Sojeiras', 'Bairro Grãos', 'Porto Alegre', '90010-000'),
('LuciaMoura', 'Poder da Soja Ltda', '67.890.123/0001-06', '2022-09-10', 'poderdasoja@outlook.com', 'Soja#Poder22', '(61) 91987-6543', 'DF', 'Setor Plantação', 'Zona Rural', 'Brasília', '70000-000'),
('EduardoRibeiro', 'Soja Pura Ltda', '78.901.234/0001-07', '2025-02-17', 'sojapura@gmail.com', 'Pura#Soja!2025', '(62) 90012-3456', 'GO', 'Rua Soja Real', 'Bairro Novo', 'Goiânia', '74000-000'),
('FernandaSouza', 'Raiz do Grão Ltda', '89.012.345/0001-08', '2023-06-25', 'raizdograo@outlook.com', 'Raiz2023@Grão', '(71) 91234-5678', 'BA', 'Rua das Culturas', 'Bairro Agro', 'Salvador', '40010-000'),
('RodrigoAlves', 'Planeta Soja Ltda', '90.123.456/0001-09', '2021-04-19', 'planetasoja@gmail.com', 'Planeta$Soja!2021', '(81) 91876-5432', 'PE', 'Av. do Grão', 'Bairro Agropecuário', 'Recife', '50030-000'),
('TatianeLima', 'Semente de Ouro Ltda', '01.234.567/0001-10', '2020-08-13', 'sementedeouro@outlook.com', 'Ouro#Semente!2020', '(85) 93000-1111', 'CE', 'Rua do Plantio', 'Bairro Rural', 'Fortaleza', '60000-000');

SELECT * FROM Empresa;

CREATE TABLE Equipamento (
ID INT PRIMARY KEY AUTO_INCREMENT,
Data_Fabricacao DATE,
Data_Compra DATE,
Data_Instalacao DATE,
Data_Manutencao DATE
);

INSERT INTO Equipamento (Data_Fabricacao, Data_Compra, Data_Instalacao, Data_Manutencao)
VALUES 
('2020-08-01', '2020-09-01', '2021-08-10', '2022-08-20'),
('2021-06-01', '2021-07-15', '2021-9-20', '2022-06-30'),
('2023-02-10', '2023-03-01', '2024-02-10', '2025-02-15'),
('2024-04-01', '2024-05-15', '2024-07-20', '2025-04-10'),
('2020-12-01', '2021-01-15', '2021-04-01', '2022-12-20'),
('2021-08-01', '2021-11-25', '2022-02-15', '2023-05-05'),
('2023-09-01', '2023-12-01', '2024-03-15', '2025-10-05'),
('2021-11-01', '2022-10-15', '2022-12-15', '2023-12-01'),
('2024-02-15', '2024-03-05', '2024-08-25', '2025-03-01'),
('2021-01-10', '2021-09-01', '2022-01-15', '2023-02-10');

SELECT * FROM Equipamento;

CREATE TABLE Silo (
ID INT PRIMARY KEY AUTO_INCREMENT,
ID_Empresa VARCHAR(20),
Tipo_de_Silo VARCHAR(30),
Tamanho_Silo VARCHAR(10),
Temperatura VARCHAR(10),
Quantidade_Graos VARCHAR(50)
);

INSERT INTO Silo (ID_Empresa, Tipo_de_Silo, Tamanho_Silo, Temperatura, Quantidade_Graos)
VALUES 
('SojaForte2020', 'Silo Metálico', '2000m³', '18°C', 6.732),
('AgroMaxIndustria', 'Silo de Concreto', '3000m³', '19°C', 3.522),
('SoyaTechBrasil', 'Silo de Armazenagem Vertical', '4000m³', '17°C', 6.345),
('AgroVerdeSP', 'Silo Metálico', '5000m³', '16°C', 1.134),
('GraosMais', 'Silo de Armazenagem Horizontal', '6000m³', '15°C', 4.211),
('SojaPrimeMT', 'Silo de Concreto', '2000m³', '35°C', 7.242),
('MilhoVerdeMT', 'Silo de Armazenagem Vertical', '3000m³', '36°C', 2.223),
('AgroSulMS', 'Silo Metálico', '4000m³', '37°C', 3.113),
('GraosSul', 'Silo de Concreto', '5000m³', '38°C', 5.131),
('SojaBrasil2025', 'Silo de Armazenagem Horizontal', '6000m³', '40°C', 7.253);

SELECT * FROM Silo;

