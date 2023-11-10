SELECT
    m.nome AS cancao,
    COUNT(h.musica_id) AS reproducoes
    FROM historico_reproducao h
    INNER JOIN musicas m ON h.musica_id = m.id
    GROUP BY h.musica_id
    ORDER BY reproducoes DESC, cancao
    LIMIT 2;