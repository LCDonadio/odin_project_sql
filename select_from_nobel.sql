SQL Zoo Tutorial - SELECT_from_nobel

/* 1. Change the query shown so that it displays Nobel prizes for 1950.   */

SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950;

/* 2. Show who won the 1962 prize for Literature. */

SELECT winner FROM nobel
  WHERE yr = 1962
    AND subject = 'Literature';

/* 3. Show the year and subject that won 'Albert Einstein' his prize. */

SELECT YR, SUBJECT FROM NOBEL 
  WHERE WINNER='ALBERT EINSTEIN';

/* 4. Give the name of the 'Peace' winners since the year 2000, including 2000. */

SELECT WINNER FROM NOBEL 
  WHERE SUBJECT='PEACE' 
    AND YR>=2000;

/* 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */

SELECT * FROM NOBEL 
  WHERE SUBJECT='LITERATURE' 
    AND YR BETWEEN 1980 AND 1989;

/* 6. Show all details of the presidential winners:
Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama */

SELECT * FROM NOBEL
  WHERE WINNER IN ('Theodore Roosevelt', 'Toodrow Wilson', 'Jimmy Carter', 'Barack Obama');


/* 7. Show the winners with first name John */

SELECT WINNER FROM NOBEL 
  WHERE WINNER LIKE 'JOHN%';

/* 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. */

SELECT YR, SUBJECT, WINNER FROM NOBEL 
  WHERE SUBJECT='PHYSICS' 
AND YR=1980 
  OR SUBJECT='CHEMISTRY' AND YR=1984; 

/* 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */

SELECT YR, SUBJECT, WINNER FROM NOBEL 
  WHERE YR=1980 
    AND SUBJECT NOT IN ('CHEMISTRY', 'MEDICINE');

/* 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */

SELECT * FROM NOBEL 
  WHERE SUBJECT='MEDICINE' 
    AND YR<1910 
  OR SUBJECT='LITERATURE' AND YR>=2004;

/* 11. Find all details of the prize won by PETER GRÜNBERG */

SELECT * FROM NOBEL 
  WHERE WINNER LIKE 'PETER% %G';

/* 12. Find all details of the prize won by EUGENE O'NEILL */

  SELECT * FROM NOBEL 
    WHERE WINNER LIKE 'EUGENE% %NEILL%';

/* 13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order. */

SELECT WINNER, YR, SUBJECT FROM NOBEL 
  WHERE WINNER LIKE 'Sir%'
    ORDER BY YR DESC, WINNER ASC;

/* 14. Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */

SELECT WINNER, SUBJECT FROM NOBEL
 WHERE YR=1984
  ORDER BY SUBJECT IN ('PHYSICS','CHEMISTRY'), SUBJECT ASC, WINNER ASC;