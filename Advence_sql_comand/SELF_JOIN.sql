/*
    SELF-Join
*/

SELECT
    tableA.col,
    tableB.col
FROM
    table AS tableA
JOIN table AS tableB ON tableA.some_col = tableB.other_col;


SELECT 
    f1.title,
    f2.title,
    f1.length
FROM
    film AS f1
INNER JOIN film AS f2 ON f1.length = f2.length 
AND f1.film_id != f2.film_id;
----------------------------