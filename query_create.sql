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

#Os 3 países com mais jogadores.

SELECT `player`.`flag` AS `nacionalidade`, count(*) AS `count`
FROM `player`
GROUP BY `player`.`flag`
ORDER BY `count`DESC 
limit 3;

#Os países com mais jogadores.

SELECT `player`.`flag` AS `Nacionalidade`, count(*) AS `count`
FROM `player`
GROUP BY `player`.`flag`
ORDER BY `count`desc;

#Quais jogadores tem os maiores records.

SELECT DISTINCT timeRecord, Player 
FROM records
ORDER BY timeRecord DESC
LIMIT 10;