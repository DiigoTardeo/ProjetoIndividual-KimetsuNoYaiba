-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE kimetsunoyaiba;
USE kimetsunoyaiba;
\
CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	dtNasc DATE,
	altura DECIMAL(3,2),
	peso DECIMAL(4,1),
	funcao VARCHAR(45),
	email VARCHAR(50),
	senha VARCHAR(50),
	fkPersonagem INT,
	FOREIGN KEY (fkPersonagem)
		REFERENCES Personagem(idPersonagem),
	constraint tipoFuncao CHECK (funcao in('Costureiro', 'Exterminador', 'Ferreiro','Kakushi'))
);

CREATE TABLE personagem(
	idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nomePersonagem VARCHAR(45)
);

CREATE TABLE sugestao(
	idSugestao INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fkUsuario INT,
	FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario)
);

INSERT INTO usuario VALUES
(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123', NULL), 
(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123', NULL), 
(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123', NULL), 
(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123', NULL), 
(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123', NULL), 
(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123', NULL), 
(NULL, 'Enzzo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'enzzo.enzzo@enzzo.com', '123', NULL), 
(NULL, 'Rodrigo', '2022-05-27', 1.69, 50.0, 'Ferreiro', 'rodrigo.rodrigo@rodrigo.com', '123', NULL); 

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
	(NULL, 'Muzan Kibutsuji'),
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
    
select * from usuario;

SELECT count(fkPersonagem), fkPersonagem FROM voto
	group by fkPersonagem;
    
SELECT p.nomePersonagem, count(fkPersonagem) as votos 
	FROM Personagem p 
		JOIN Usuario u ON u.fkPersonagem = p.idPersonagem
        GROUP BY p.idPersonagem
        ORDER BY count(u.fkPersonagem) Desc limit 10;


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
