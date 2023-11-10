SELECT
    a.nome AS artista,
    al.nome AS album,
    COUNT(ua.usuario_id) AS pessoas_seguidoras
    FROM artistas a 
    INNER JOIN usuarios_artistas ua ON ua.artista_id = a.id
    INNER JOIN albuns al ON al.artista_id = ua.artista_id
    GROUP BY a.nome, al.nome
    ORDER BY pessoas_seguidoras DESC, artista, album;