SQL Zoo Tutorial - More_Join

/* 1. List the films where the yr is 1962 [Show id, title] */

SELECT id, title FROM movie
	WHERE yr=1962;

/* 2. Give year of 'Citizen Kane'. */

 SELECT yr FROM movie 
 	WHERE title='Citizen Kane';

 /* 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. */

 SELECT id, title, yr FROM movie 
 	WHERE title LIKE '%Star Trek%' 
 	ORDER BY yr ASC;

 /* 4. What id number does the actor 'Glenn Close' have? */	

 SELECT DISTINCT casting.actorid FROM movie 
 	JOIN casting 
 	ON movieid=movie.id 
 		JOIN actor 
 		ON actorid=actor.id 
 	WHERE name='GLENN CLOSE';

/* 5. What is the id of the film 'Casablanca' */

 SELECT id FROM movie 
 	WHERE title='Casablanca';

/* 6. Obtain the cast list for 'Casablanca'. */

 SELECT name FROM movie 
 	JOIN CASTING 
 	ON movieid=movie.id 
	 	JOIN actor 
	 	ON actorid=actor.id 
	 WHERE movie.title='Casablanca';

/* 7. Obtain the cast list for the film 'Alien' */

 SELECT name FROM movie 
 	JOIN CASTING 
 	ON movieid=movie.id J
 		JOIN actor 
 		ON actorid=actor.id 
 	WHERE movie.title='ALIEN';

/* 8. List the films in which 'Harrison Ford' has appeared */

SELECT title FROM movie 
 	JOIN casting 
 	ON movieid=movie.id 
 		JOIN actor 
 		ON actorid=actor.id 
 	WHERE name='Harrison Ford';

/* 9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */

SELECT title FROM movie 
	JOIN CASTING 
	ON movieid=movie.id 
		JOIN actor 
		ON actorid=actor.id 
	WHERE name='Harrison Ford' AND ord<>1;


/* 10. List the films together with the leading star for all 1962 films. */

SELECT title, name FROM movie 
	JOIN CASTING 
	ON movieid=movie.id 
		JOIN actor 
		ON actorid=actor.id 
	WHERE yr='1962' AND ord=1;

/* 11. Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies. */

 SELECT yr,COUNT(title) FROM movie 
 	JOIN casting ON movie.id=movieid
         JOIN actor ON actorid=actor.id
	WHERE name='John Travolta'
	GROUP BY yr
		HAVING COUNT(title)=(SELECT MAX(C) FROM
								(SELECT yr,COUNT(title) AS C FROM movie 
									JOIN CASTING ON movie.id=movieid
         								JOIN actor ON actorid=actor.id
 								 WHERE name='John Travolta'
 								 GROUP BY yr) AS t
 							);

/* 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in. */

SELECT DISTINCT title, name FROM casting 
	JOIN movie ON movieid=movie.id 
		JOIN actor ON actorid=actor.id
WHERE movieid IN (10016,12354,12497,12766,13846,15145,15476,16870,17117,17445,17765,18270,20136,20136,20180,20181,20509,20627,21023,21154,21171,21483) 
	AND ord=1;

/* 13. Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.*/	

SELECT name FROM casting JOIN movie 
	ON movieid=movie.id 
	JOIN actor ON actorid=actor.id WHERE ord=1 GROUP BY name HAVING COUNT(ord)>=30 ordER BY name ASC;

/* 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */

SELECT title, COUNT(name) FROM casting 
	JOIN movie 
	ON movieid=movie.id 
		JOIN actor 
		ON actor=actor.id 
	WHERE yr='1978'  
	GROUP BY title 
	ORDER BY COUNT(name) DESC, title;

/* 15. List all the people who have worked with 'Art Garfunkel'. */

SELECT DISTINCT name FROM actor 
	WHERE id<>1112 
	AND id IN (SELECT actorid FROM casting 
					WHERE movieid IN 
						(SELECT movieid FROM movie 
							JOIN casting 
							ON movieid=movie.id 
								JOIN actor 
								ON actorid=actor.id
						 WHERE name='Art Garfunkel')
				);

