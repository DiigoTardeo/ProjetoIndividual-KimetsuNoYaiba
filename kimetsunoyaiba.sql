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
	fkPersonagem INT,
	FOREIGN KEY (fkPersonagem)
		REFERENCES personagem(idPersonagem),
	fkMestre INT,
	FOREIGN KEY (fkMestre)
		REFERENCES mestre(idMestre),
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

CREATE TABLE mestre(
	idMestre INT PRIMARY KEY AUTO_INCREMENT,
	nomeMestre VARCHAR(50),
	respiracao VARCHAR(50),
	CONSTRAINT tipoRespiracao CHECK (respiracao in('Chama', 'Sol', 'Água', 'Vento', 'Pedra', 'Amor', 'Inseto', 'Trovão', 'Som', 'Névoa', 'Fera', 'Serpente', 'Flor', 'Lua'))
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
    
INSERT INTO mestre VALUES
	(NULL, 'Sakonji Urokodaki', 'Água'),
	(NULL, 'Jigoro Kuwajina', 'Trovão'),
	(NULL, 'Gyomei Himejima', 'Pedra'),
	(NULL, 'Kanae Kocho', 'Flor'),
	(NULL, 'Shinjuro Rengoku', 'Chama');
	
select * from usuario;

SELECT count(fkPersonagem), fkPersonagem FROM voto
	group by fkPersonagem;
    
SELECT p.nomePersonagem, count(fkPersonagem) as votos 
	FROM Personagem p 
		JOIN Usuario u ON u.fkPersonagem = p.idPersonagem
        GROUP BY p.idPersonagem
        ORDER BY count(u.fkPersonagem) Desc limit 10;