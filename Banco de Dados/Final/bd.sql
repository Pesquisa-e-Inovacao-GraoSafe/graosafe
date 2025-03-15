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
