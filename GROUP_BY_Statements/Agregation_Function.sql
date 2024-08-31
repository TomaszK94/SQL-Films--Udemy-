/*
    Aggregate Functions:
- AVG()  --> ROUND(AVG(), ilość po przecinku)
- COUNT()
- MAX()
- MIN()
- SUM()

Reszta jest w dokumentacji POSTGRESQL
*/

SELECT MIN(replacement_cost)
FROM 
    film;


SELECT MAX(replacement_cost)
FROM
    film;


SELECT 
    MAX(replacement_cost),
    MIN(replacement_cost)
FROM
    film;



SELECT COUNT(*)
FROM 
    film;



SELECT ROUND(AVG(replacement_cost), 2)
FROM 
    film;



SELECT
    SUM(replacement_cost)
FROM
    film;