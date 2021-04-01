SELECT id, title
FROM movie
WHERE yr=1962

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id
FROM actor
WHERE name = 'Glenn Close';

SELECT id
FROM movie
WHERE title = 'Casablanca';

SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON casting.movieid = movie.id
WHERE title = 'Casablanca';

SELECT name
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE title = 'Alien';

SELECT title
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE name = 'Harrison Ford';

SELECT title
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE name = 'Harrison Ford' AND ord <> 1;

SELECT title, name
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE yr = 1962 AND ord = 1;

SELECT yr,COUNT(title) 
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE ord = 1 AND movie.id IN (SELECT movie.id
                            FROM movie
                            JOIN casting ON movie.id = casting.movieid
                            JOIN actor ON actor.id = casting.actorid 
                            WHERE name = 'Julie Andrews');

SELECT name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(*) >= 15;

SELECT title, COUNT(actorid)
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;

SELECT name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN (SELECT movie.id
                   FROM movie
                   JOIN casting ON movie.id = casting.movieid
                   JOIN actor ON actor.id = casting.actorid
                   WHERE name = 'Art Garfunkel')
     AND actor.name <> 'Art Garfunkel';
     