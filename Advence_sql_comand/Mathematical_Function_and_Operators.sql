/*
    Mathemical Operators -- wszystkie operatory i funkcję są opisane w dokumentacji --> + - / * ale również pi() trygonometria i wiele innych...
*/


SELECT
    replacement_cost,
    rental_rate,
    ROUND(rental_rate / replacement_cost, 4) * 100 AS percent_cost
FROM
    film;



SELECT
    replacement_cost,
    0.1 * replacement_cost AS deposit
FROM
    FILM;
-----------------------------
