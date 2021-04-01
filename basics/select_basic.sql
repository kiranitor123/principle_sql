-- first --
SELECT population FROM world
  WHERE name = 'Germany'
-- second --
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- third --
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000