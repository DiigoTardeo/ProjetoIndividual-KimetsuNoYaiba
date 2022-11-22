CREATE DATABASE kimetsunoyaiba;
USE kimetsunoyaiba;

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
    
SELECT * FROM usuario;
SELECT * FROM voto;