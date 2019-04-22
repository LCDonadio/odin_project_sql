SQL Zoo Tutorial - Sum_and_count


/* 1. Show the total population of the world.*/

SELECT SUM(POPULATION) FROM WORLD;

/* 2. List all the continents - just once each. */

SELECT DISTINCT(CONTINENT) FROM WORLD;

/* 3. Give the total GDP of Africa */ 

SELECT SUM(GDP) FROM WORLD 
	WHERE CONTINENT='Africa';	

/* 4. How many countries have an area of at least 1000000 */

SELECT COUNT(NAME) FROM WORLD 
	WHERE AREA> 1000000;

/* 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania') */

SELECT SUM(POPULATION) FROM WORLD 
	WHERE NAME IN 
		('Estonia', 'Latvia', 'Lithuania');

/* 6. For each continent show the continent and number of countries. */

SELECT CONTINENT, COUNT(NAME) AS COUNTRIES FROM WORLD 
	GROUP BY CONTINENT;

/* 7. For each continent show the continent and number of countries with populations of at least 10 million.*/

SELECT CONTINENT, COUNT(NAME) AS COUNTRIES FROM WORLD 
	WHERE POPULATION>10000000 
	GROUP BY CONTINENT;	

/* 8. List the continents that have a total population of at least 100 million. */

SELECT CONTINENT FROM WORLD 
	GROUP BY CONTINENT
	 HAVING SUM(POPULATION)>100000000;	