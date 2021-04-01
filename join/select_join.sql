SELECT matchid, player
FROM goal
WHERE teamid = 'GER';

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM goal
JOIN game
ON game.id = goal.matchid
WHERE goal.teamid = 'GER';

SELECT game.team1, game.team2, goal.player
FROM goal
JOIN game
ON goal.matchid = game.id
WHERE player LIKE 'Mario%'

SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal
JOIN eteam
ON goal.teamid = eteam.id
WHERE gtime<=10;

SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam
ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos' AND game.team1 = eteam.id;

SELECT goal.player
FROM goal
JOIN game
ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw';

SELECT DISTINCT goal.player
FROM goal
JOIN game
ON game.id = goal.matchid
WHERE game.team1= 'GER' AND goal.teamid <> 'GER' OR game.team2 = 'GER' AND goal.teamid <> 'GER';

SELECT eteam.teamname, COUNT(goal.teamid)
FROM eteam
JOIN goal
ON goal.teamid = eteam.id
GROUP BY eteam.teamname;

SELECT game.stadium, COUNT(goal.matchid)
FROM game
JOIN goal
ON game.id = goal.matchid
GROUP BY game.stadium;

SELECT game.id, game.mdate, COUNT(goal.matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY game.id, game.mdate;

SELECT game.id, game.mdate, COUNT(goal.teamid)
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY game.id, game.mdate;

SELECT game.mdate,
       game.team1,
       SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT OUTER JOIN goal
ON game.id = goal.matchid
GROUP BY game.mdate, goal.matchid, game.team1, game.team2;