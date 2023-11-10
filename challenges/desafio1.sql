DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.artista
(
	artista_id	INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(512) NOT NULL
) engine= InnoDB;

INSERT INTO SpotifyClone.artista (artista_id, nome_artista) VALUES
	(1,'Baco Exu do Blues'),
	(2, 'Beyoncé'),
	(3, 'Blind Guardian'),
	(4, 'Elis Regina'),
	(5, 'Nina Simone'),
    (6, 'Queen');

CREATE TABLE SpotifyClone.album 
(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(512) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    artista_id	INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.album (nome, ano_lancamento, artista_id) 
VALUES
	('Renaissance', 2022, 2),
	('Jazz', 1978, 6),
	('Hot Space', 1982, 6),
	('Falso Brilhante', 1998, 4),
	('Vento de Maio', 2001, 4),
    ('QVVJFA?', 2003, 1),
    ('Somewhere Far Beyond', 2007, 3),
    ('I Put A Spell On You', 2012, 5);

    CREATE TABLE SpotifyClone.usuarios 
(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(512) NOT NULL,
    idade INT NOT NULL,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id),
    data_assinatura	DATE
) engine = InnoDB;

INSERT INTO SpotifyClone.usuarios (usuario_id, nome_usuario, idade, plano_id, data_assinatura) VALUES
	(1, 'Barbara Liskov', '82', 1, '2019-10-20'),
	(2, 'Robert Cecil Martin', '58', 1, '2017-01-06'),
	(3, 'Ada Lovelace', '37', 2, '2017-12-30'),
	(4, 'Martin Fowler', '46', 2, '2017-01-17'),
	(5, 'Sandi Metz', '58', 2, '2018-04-29'),
	(6, 'Paulo Freire', '19', 3, '2018-02-14'),
	(7, 'Bell Hooks', '26', 3, '2018-01-05'),
	(8, 'Christopher Alexander', '85', 4, '2019-06-05'),
	(9, 'Judith Butler', '45', 4, '2020-05-13'),
	(10, 'Jorge Amado', '58', 4, '2017-02-17');

CREATE TABLE SpotifyClone.planos 
(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(512),
    valor DOUBLE
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_id, nome_plano, valor) VALUES
	(1, 'gratuito', 0),
	(2, 'familiar', 7.99),
	(3, 'universitário', 5.99),
	(4, 'pessoal', 6.99);


CREATE TABLE SpotifyClone.cancao 
(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_cancao	VARCHAR(512) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancao (cancao_id, nome_cancao, duracao_segundos, album_id) VALUES
	(1, 'Alien Superstar', 116, 1),
	(2, 'Virgo’s Groove', 369, 1),
	(3, 'Break My Soul', 279, 1),
	(4, 'Don’t Stop me Now', 203, 2),
	(5, 'Under Pressure', 152, 3),
	(6, 'Como Nossos Pais', 105, 4),
	(7, 'O Medo de Amar É o Medo de Ser Livre', 207, 5),
	(8, 'Samba em Paris', 267, 6),
	(9, 'The Bard’s Song', 244, 7),
	(10,'Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.historico_reproducao 
(
    usuario_id	INT,
    cancao_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancao (cancao_id),
    PRIMARY KEY (usuario_id, cancao_id),
    data_da_reproducao	DATETIME
) engine = InnoDB;

INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id, data_da_reproducao) VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 3, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 1, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.seguindo_artistas 
(
    usuario_id	INT,
    artista_id	INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id),
    PRIMARY KEY (usuario_id, artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id) VALUES
	(1, 2),
	(1, 6),
	(1, 4),
	(2, 2),
	(2, 4),
	(3, 6),
	(4, 1),
	(5, 3),
	(5, 5),
	(6, 5),
	(6, 2),
	(7, 5),
	(9, 4),
	(10, 6);