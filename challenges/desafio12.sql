SELECT 
    a.nome AS artista,
    CASE
        WHEN COUNT(mf.musica_id) >= 5 THEN 'A'
        WHEN COUNT(mf.musica_id) = 4 OR COUNT(mf.musica_id) = 3 THEN 'B'
        WHEN COUNT(mf.musica_id) = 1 OR COUNT(mf.musica_id) = 2 THEN 'C'
        ELSE '-'
    END AS ranking
    FROM artistas a 
    LEFT JOIN musicas m ON m.artista_id = a.id
    LEFT JOIN musicas_favoritas mf ON mf.musica_id = m.id
    GROUP BY a.nome
    ORDER BY 
        CASE
            WHEN ranking = 'A' THEN 0
            WHEN ranking = 'B' THEN 1
            WHEN ranking = 'C' THEN 2
            ELSE 3
        END, artista;