SQL Zoo Tutorial - SELECT_within_SELECT

/* 1. List each country name where the population is larger than that of 'Russia'. */

SELECT NAME FROM WORLD
  WHERE POPULATION >
     (SELECT POPULATION FROM WORLD
      WHERE NAME='Russia');

/* 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. */

 SELECT NAME FROM WORLD 
 	WHERE CONTINENT='Europe' 
 	AND GDP/POPULATION>
 		(SELECT GDP/POPULATION AS GDP FROM WORLD 
 			WHERE NAME='United Kingdom');

/* 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. */

 SELECT NAME, CONTINENT FROM WORLD 
 	WHERE CONTINENT IN 
 		(SELECT CONTINENT FROM WORLD 
 			WHERE NAME IN ('Argentina', 'Australia')) 
 	ORDER BY NAME;

/* 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population. */

 SELECT NAME, POPULATION FROM WORLD 
 	WHERE POPULATION> 
 		(SELECT POPULATION FROM WORLD 
 			WHERE NAME='Canada') 
 	AND POPULATION<
 		(SELECT POPULATION FROM WORLD 
 			WHERE NAME='Poland');

 /* 5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany. */

 SELECT NAME, CONCAT(ROUND(POPULATION*100/(SELECT POPULATION FROM WORLD WHERE NAME='Germany'), 0),'%') AS PERCENT_OF_GERMANY FROM WORLD 
 	WHERE CONTINENT='Europe';

 /* 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) */

 SELECT NAME FROM WORLD 
 	WHERE GDP>
 		(SELECT MAX(GDP) FROM WORLD 
 			WHERE CONTINENT='Europe' 
 					GROUP BY CONTINENT);

 /* 7. Find the largest country (by area) in each continent, show the continent, the name and the area: */

 SELECT CONTINENT, NAME, AREA FROM WORLD X
  WHERE AREA >= ALL (SELECT AREA FROM WORLD Y
       					WHERE Y.CONTINENT=X.CONTINENT)

 /* 8. List each continent and the name of the country that comes first alphabetically. */

 SELECT CONTINENT, MIN(NAME) FROM WORLD 
 	GROUP BY CONTINENT;

/* 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population. */ 	

 SELECT NAME, CONTINENT, POPULATION FROM WORLD 
 	WHERE CONTINENT NOT IN 
 		(SELECT CONTINENT FROM WORLD 
 			WHERE POPULATION> 25000000);

/* 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents. */

SELECT NAME, CONTINENT FROM WORLD X
	 WHERE X.POPULATION/3>ALL (SELECT Y.POPULATION FROM WORLD Y 
	 								WHERE Y.CONTINENT=X.CONTINENT AND Y.NAME!=X.NAME);	