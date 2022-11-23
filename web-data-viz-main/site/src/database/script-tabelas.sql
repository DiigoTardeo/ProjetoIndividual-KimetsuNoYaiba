-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE Kimetsu;
USE Kimetsu;

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

INSERT INTO usuario VALUES
	(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123'),
	(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123'),
	(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123'),
	(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123'),
	(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123'),
	(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123'),
	(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123'),
	(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123');

CREATE TABLE personagem(
	idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nomePersonagem VARCHAR(45)
);

INSERT INTO personagem VALUES 
	(NULL, 'Kagaya Ubuyashiki'),
	(NULL, 'Gyomei Himejima'),
	(NULL, 'Sanemi Shinazugawa'),
	(NULL, 'Muichiro Tokito'),
	(NULL, 'Giyu Tomioka'),
	(NULL, 'Obanai Iguro'),
	(NULL, 'Mitsuri Kanroji'),
	(NULL, 'Tengen Uzui'),
	(NULL, 'Kyojuro Rengoku'),
	(NULL, 'Shinobu Kocho'),
	(NULL, 'Tanjiro Kamado'),
	(NULL, 'Nezuko Kamado'),
	(NULL, 'Inosuke Hashibira'),
	(NULL, 'Zenitsu Agatsuma'),
	(NULL, 'Muzan'),
	(NULL, 'Kokushibou'),
	(NULL, 'Douma'),
	(NULL, 'Akaza'),
	(NULL, 'Hantengu'),
	(NULL, 'Nakime'),
	(NULL, 'Gyokko'),
	(NULL, 'Daki e Gyuutarou'),
	(NULL, 'Kaigaku'),
	(NULL, 'Enmu'),
	(NULL, 'Hairo'),
	(NULL, 'Wakuraba'),
	(NULL, 'Mukago'),
	(NULL, 'Rui'),
	(NULL, 'Kyogai'),
	(NULL, 'Kamanue');
    
CREATE TABLE voto(
	fkUsuario INT,
    FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario),
	fkPersonagem INT,
    FOREIGN KEY (fkPersonagem)
		REFERENCES personagem(idPersonagem),
	PRIMARY KEY (fkUsuario,fkPersonagem)
);
select * from usuario;
drop table voto;
INSERT INTO voto VALUES
	(1, 5),
    (2, 5),
    (3, 5),
    (4, 5),
    (5, 5),
    (6, 5),
    (7, 5),
    (8, 25),
    (9, 25),
    (10, 22),
    (1, 23),
    (2, 24);

SELECT count(fkPersonagem), fkPersonagem FROM voto
	group by fkPersonagem;
    
SELECT count(fkPersonagem), 
	fkPersonagem FROM voto
		GROUP BY fkPersonagem
        ORDER BY count(fkPersonagem) desc limit 3;


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
