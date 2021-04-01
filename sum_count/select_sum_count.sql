SELECT SUM(population)
FROM world

SELECT DISTINCT continent
FROM world

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

SELECT COUNT(*)
FROM world
WHERE area > 1000000

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT DISTINCT continent, COUNT(*)
FROM world
GROUP BY continent

SELECT continent, COUNT(*)
FROM world
WHERE population > 10000000
GROUP BY continent

SELECT DISTINCT continent
FROM world x
WHERE 100000000 < (SELECT SUM(population)
                  FROM world y
                  WHERE y.continent = x.continent)
