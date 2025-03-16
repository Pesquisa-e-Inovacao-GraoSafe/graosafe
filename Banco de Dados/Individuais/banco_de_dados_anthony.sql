drop database projetoPI;
create database projetoPI;
use projetoPI;

CREATE TABLE Empresa(
idEmpresa int primary key auto_increment not null,
razaoSocial VARCHAR(50) not null,
cnpj char(18) not null, 
dtCadastro date not null,
email VARCHAR(100) not null, 
senha VARCHAR(25) not null,
telefone VARCHAR(15) not null,
UF VARCHAR(5) not null,
rua VARCHAR(100) not null,
numero VARCHAR(10) not null,
bairro VARCHAR(20) not null,
cidade VARCHAR(50) not null,
cep int not null,

CONSTRAINT checkEmail check(email LIKE '%@gmail.com' or email LIKE '%@hotmail.com' or email LIKE '%@outlook.com')
);

CREATE TABLE Sensor(
idSensor int primary key auto_increment not null,
nomeSensor VARCHAR (20),
numSerie int,
dtFabricacao date not null,
dtCompra datetime not null,
dtInstalacao datetime not null, 
dtManutencao datetime not null,
empresaInstalado VARCHAR(50)
);

CREATE TABLE silo(
idEmpresa int auto_increment primary key,
empresaSilo VARCHAR(50),
idSilo int not null,
capacidadeSilo_m3 int not null,
capacidadeSilo_ton int not null,
registroTemperatura DECIMAL(5,2) not null,
dataRegistro datetime not null
);


INSERT INTO Empresa (razaoSocial, cnpj, dtCadastro, email, senha, telefone, UF, rua, numero, bairro, cidade, cep) VALUES
('AgroTech Ltda', '12.345.678/0001-90', '2024-01-15', 'contato@outlook.com', 'senha123', '(11) 99999-1111', 'SP', 'Av. Paulista', '1000', 'Centro', 'São Paulo', 12345678),
('Grãos do Brasil', '23.456.789/0001-01', '2024-02-10', 'empresa@gmail.com', 'segura@123', '(21) 98888-2222', 'RJ', 'Rua das Palmeiras', '200', 'Copacabana', 'Rio de Janeiro', 87654321),
('Cereais do Sul', '34.567.890/0001-02', '2024-03-05', 'suporte@outlook.com', 'forte789', '(41) 97777-3333', 'PR', 'Av. Curitiba', '50', 'Centro', 'Curitiba', 34567890),
('Alimentos S/A', '45.678.901/0001-03', '2024-04-20', 'info@hotmail.com', '123mudar', '(51) 96666-4444', 'RS', 'Rua Porto Alegre', '75', 'Bela Vista', 'Porto Alegre', 45678901),
('Safra Boa Ltda', '56.789.012/0001-04', '2024-05-30', 'comercial@gmail.com', 'agro@2024', '(31) 95555-5555', 'MG', 'Av. Minas', '500', 'Savassi', 'Belo Horizonte', 56789012);


INSERT INTO Sensor (nomeSensor, numSerie, dtFabricacao, dtCompra, dtInstalacao, dtManutencao, empresaInstalado) VALUES
('LM35', 1001, '2023-01-10', '2024-01-15 08:30:00', '2024-01-20 10:00:00', '2024-06-01 15:00:00', 'AgroTech Ltda'),
('LM35', 1002, '2023-02-05', '2024-02-12 09:00:00', '2024-02-18 11:30:00', '2024-07-02 14:30:00', 'Grãos do Brasil'),
('LM35', 1003, '2023-03-15', '2024-03-10 07:45:00', '2024-03-15 13:00:00', '2024-08-05 16:00:00', 'Cereais do Sul'),
('LM35', 1004, '2023-04-20', '2024-04-18 10:15:00', '2024-04-22 09:45:00', '2024-09-10 17:30:00', 'Alimentos S/A'),
('LM35', 1005, '2023-05-25', '2024-05-25 12:30:00', '2024-05-30 14:15:00', '2024-10-15 18:45:00', 'Safra Boa Ltda');


INSERT INTO Silo (idEmpresa, empresaSilo, idSilo, capacidadeSilo_m3, capacidadeSilo_ton, registroTemperatura, dataRegistro) VALUES
(1, 'AgroTech Ltda', 1, 500, 300, 25.5, '2024-01-25 08:00:00'),
(2, 'Grãos do Brasil', 2, 600, 400, 26.2, '2024-02-15 09:30:00'),
(3, 'Cereais do Sul', 3, 700, 500, 24.8, '2024-03-20 11:45:00'),
(4, 'Alimentos S/A', 4, 800, 600, 27.1, '2024-04-25 14:00:00'),
(5, 'Safra Boa Ltda', 5, 900, 700, 23.9, '2024-05-30 16:15:00');

desc Empresa;

SELECT * from Empresa;
SELECT * from Sensor;
SELECT * from Silo;

update Empresa set razaoSocial = 'Soja Brasil' where idEmpresa = 1;
update Sensor set empresaInstalado = 'Soja Brasil' where idSensor = 1;
update Silo set empresaSilo = 'Soja Brasil' where idSilo = 1;

delete from Sensor where idSensor = 3 ;
 
alter table Empresa modify column uf char(2);
alter table Empresa rename column rua to logradouro;
alter table Sensor drop column dtManutencao;


