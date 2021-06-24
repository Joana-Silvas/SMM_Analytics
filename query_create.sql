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



#Média de pontuação de records.
SELECT avg(`records`.`timeRecord`) AS `avg`
FROM `records`;


#Comparação entre as dificuldades.

SELECT `courses`.`difficulty` AS `difficulty`, count(*) AS `Nº de Fases`
FROM `courses`
GROUP BY `courses`.`difficulty`
ORDER BY `courses`.`difficulty` ASC;


#Comparação entre modo de jogo.
SELECT `courses`.`gameStyle` AS `gameStyle`, count(*) AS `count`
FROM `courses`
GROUP BY `courses`.`gameStyle`
ORDER BY `courses`.`gameStyle` ASC;

#Os 10 jogadores que criaram mais estágios.
SELECT   `maker`,
COUNT(`maker`) AS Qtd
FROM  `courses`
GROUP BY `maker`
HAVING   COUNT(`maker`) > 1
ORDER BY COUNT(`maker`) DESC
limit 10;

#Nacionalidade dos Jogadores TOP 15 maiores pontuações.
select distinct timeRecord, flag, Player 
from(
select * from records
left join player
on player.player_id = records.player
where player_id is not null
) as Nacionalidade_Recodistas
order by timeRecord desc
limit 15;

#Quantidade de jogadores do brasil.
SELECT COUNT(flag) AS `Brasileiros`
FROM player 
WHERE flag = 'br';

#Relaciona os primeiros zerar uma fase e a quantidade de tentativas necessárias.
SELECT (firstClear), attempts 
FROM courses_meta 
WHERE attempts >= 1000 
LIMIT 5;

#Ranking de jogadores com mais fases zeradas.
select 
distinct player, 
count(*) as Fases
from clears 
group by player 
order by 2 desc 
limit 10;

#Exibe a porcentagem conquistada pelos jogadores que completaram uma fase.
SELECT firstClear, clearRate 
FROM courses_meta 
WHERE clearRate >= 50;
