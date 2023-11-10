SELECT
    MIN(p.valor) AS faturamento_minimo,
    MAX(p.valor) AS faturamento_maximo,
    ROUND(AVG(p.valor), 2) AS faturamento_medio,
    SUM(p.valor) AS faturamento_total
    FROM planos p
    INNER JOIN usuarios u ON u.plano_id = p.id;