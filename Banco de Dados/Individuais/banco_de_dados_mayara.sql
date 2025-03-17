create database PI;
use PI;

-- Tabela Cadastro 

create table Cadastro(
idEmpresa int primary key auto_increment,
NomeEmpresa varchar(50),
CNPJ char(14),
dtCadastro datetime default current_timestamp not null,
Email varchar(50),
Telefone char(11),
Senha char (8),
UF char (2),
CEP char(8),
Endereco varchar(50),
Bairro varchar (40),
Cidade varchar (40),
constraint chkemail check(email like '%@%')
);
-- Dados tabela Cadastro 
insert into Cadastro (NomeEmpresa, CNPJ,Email,Telefone,Senha,UF,CEP,Endereco,Bairro,Cidade)values
('EmpresaA', 11111111111112, 'empresaA@hotmail.com', 11958848746, 12345678, 'BH', 08756789, 'Rua empresa A', 'Bairro A', 'Minas Gerais');

-- Renomeando colunas
 Select idEmpresa as 'ID da Empresa',
 NomeEmpresa as 'Nome da Empresa',
 dtCadastro as 'Data do cadastro' 
 from Cadastro;
 
 
-- Tabela Dado do Sensor

create table DadoSensor(
NomeEmpresa varchar (50) primary key not null,
idSensor int not null, 
idSilo int not null,
dataRegistro datetime default current_timestamp not null,
RegistroTemperatura decimal (4,2) not null);

-- Dados tabela Sensor 
insert into DadoSensor (NomeEmpresa, idSensor,idSilo,RegistroTemperatura) values
('Empresa A', 1, 1, 24.8); 

-- Renomeando colunas
Select
NomeEmpresa as 'Nome da Empresa',
idSensor as 'ID do Sensor',
idSilo as 'ID da Silo',
dataRegistro as 'Data e hora do Registro',
RegistroTemperatura as 'Temperatura' from DadoSensor;

-- Tabela Silo


create table Silo(
NomeEmpresa varchar(50) primary key,
idSilo int,
TipoSilo varchar (12),
TamanhoM2 decimal (5,1),
constraint chkTipoSilo 
check(TipoSilo in ('Metalico','Espera','Concreto','Secador','Armazenador','Expedição','Bag','Bolsa','Graneleiro'))
);

-- Dados tabela Sensor 
insert into Silo (NomeEmpresa, idSilo,TipoSilo,TamanhoM2) values
('Empresa A' , 1, 'metalico', 100);

-- Renomeando colunas
Select 
NomeEmpresa as 'Nome da Empresa',
idSilo as 'ID da Silo',
TipoSilo as 'Tipo de Silo',
TamanhoM2 as 'Tamanho do Silo em M2' from Silo;

