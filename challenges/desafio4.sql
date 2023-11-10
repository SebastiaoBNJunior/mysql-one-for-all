SELECT u.nome AS pessoa_usuaria,
    IF(MAX(YEAR(h.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
    FROM usuarios u
    LEFT JOIN historico_reproducao h ON h.usuario_id = u.id
    GROUP BY pessoa_usuaria
    ORDER BY pessoa_usuaria;