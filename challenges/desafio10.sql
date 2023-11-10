CREATE TABLE musicas_favoritas 
(
    musica_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (musica_id) REFERENCES musicas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    PRIMARY KEY (musica_id, usuario_id)
);

INSERT INTO musicas_favoritas (usuario_id, musica_id) VALUES
	(1, 3),
	(1, 6),
	(1, 10),
	(2, 4),
	(3, 1),
	(3, 3),
	(4, 7),
	(4, 4),
	(5, 10),
	(5, 2),
	(8, 4),
	(9, 7),
	(10, 3);
