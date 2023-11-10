SELECT COUNT(DISTINCT m.id) AS cancoes, COUNT(DISTINCT a.id) AS artistas, COUNT(DISTINCT al.id) AS albuns 
    FROM musicas m 
    LEFT JOIN artistas a ON m.artista_id = a.id
    LEFT JOIN albuns al ON al.id = m.album_id;