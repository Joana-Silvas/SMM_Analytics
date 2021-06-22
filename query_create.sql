#Top 10 jogadores com mais estrelas//

SELECT * 
FROM (
	SELECT firstClear AS Jogador, SUM(stars) AS Estrelas
    FROM courses_meta
    GROUP BY firstClear
)AS Recordistas
WHERE Estrelas > 1000
ORDER BY Estrelas desc
LIMIT 10;