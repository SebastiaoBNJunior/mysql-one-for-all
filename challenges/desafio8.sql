SELECT
    a.nome AS artista,
    al.nome AS album
    FROM artistas a 
    INNER JOIN albuns al ON al.artista_id = a.id
    WHERE a.nome = 'Elis Regina'
    ORDER BY album;