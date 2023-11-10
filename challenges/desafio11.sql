SELECT 
    al.nome AS album,
    COUNT(mf.musica_id) AS favoritadas
    FROM musicas m
    INNER JOIN musicas_favoritas mf ON mf.musica_id = m.id
    INNER JOIN albuns al ON al.id = m.album_id
    GROUP BY al.nome
    ORDER BY favoritadas DESC
    LIMIT 3;