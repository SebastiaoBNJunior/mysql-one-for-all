SELECT u.nome as pessoa_usuaria,
    COUNT(h.musica_id) AS musicas_ouvidas,
    ROUND(SUM(m.duracao_segundos) / 60, 2) AS total_minutos
    FROM usuarios u
    INNER JOIN historico_reproducao h ON h.usuario_id = u.id
    INNER JOIN musicas m ON m.id = h.musica_id
    GROUP BY u.nome
    ORDER BY pessoa_usuaria ASC;