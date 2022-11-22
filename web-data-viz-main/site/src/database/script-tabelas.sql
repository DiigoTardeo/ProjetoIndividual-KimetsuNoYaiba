-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE ;
USE ;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	dtNasc DATE,
	altura DECIMAL(3,2),
	peso DECIMAL(4,1),
	funcao VARCHAR(45),
	email VARCHAR(50),
	senha VARCHAR(50),
	constraint tipoFuncao CHECK (funcao in('Costureiro', 'Exterminador', 'Ferreiro','Kakushi'))
);

CREATE TABLE voto(
	idVoto INT AUTO_INCREMENT,
    nomePersonagem VARCHAR(45),
    fkUsuario INT,
    FOREIGN KEY (fkUsuario)
		REFERENCES Usuario(idUsuario),
	PRIMARY KEY(idVoto,fkUsuario)
);

INSERT INTO voto VALUES 
	(NULL, 'Kagaya Ubuyashiki', 1),
	(NULL, 'Gyomei Himejima', 1),
	(NULL, 'Sanemi Shinazugawa', 1),
	(NULL, 'Muichiro Tokito', 1),
	(NULL, 'Giyu Tomioka', 1),
	(NULL, 'Obanai Iguro', 1),
	(NULL, 'Mitsuri Kanroji', 1),
	(NULL, 'Tengen Uzui', 1),
	(NULL, 'Kyojuro Rengoku', 1),
	(NULL, 'Shinobu Kocho', 1),
	(NULL, 'Tanjiro Kamado', 1),
	(NULL, 'Nezuko Kamado', 1),
	(NULL, 'Inosuke Hashibira', 1),
	(NULL, 'Zenitsu Agatsuma', 1),
	(NULL, 'Muzan', 1),
	(NULL, 'Kokushibou', 1),
	(NULL, 'Douma', 1),
	(NULL, 'Akaza', 1),
	(NULL, 'Hantengu', 1),
	(NULL, 'Nakime', 1),
	(NULL, 'Gyokko', 1),
	(NULL, 'Daki e Gyuutarou', 1),
	(NULL, 'Kaigaku', 1),
	(NULL, 'Enmu', 1),
	(NULL, 'Hairo', 1),
	(NULL, 'Wakuraba', 1),
	(NULL, 'Mukago', 1),
	(NULL, 'Rui', 1),
	(NULL, 'Kyogai', 1),
	(NULL, 'Kamanue', 1);


/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */


/*
comando para sql server - banco remoto - ambiente de produção
*/

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
