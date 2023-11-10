SELECT
    COUNT(*) AS musicas_no_historico
    FROM historico_reproducao hr 
    INNER JOIN usuarios u ON u.id = hr.usuario_id
    WHERE u.nome = 'Barbara Liskov';