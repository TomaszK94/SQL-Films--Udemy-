/*
    - SubQuery
*/

-- The EXISTS operator is used to test for existence of rows in a subquery.
-- Typycally a subquery is passed in the EXISTS() funcition to check if any rows are returned with the subquery

SELECT 
    title,
    rental_rate
FROM
    film
WHERE
    rental_rate > (
SELECT AVG(rental_rate)
FROM
    film
);


SELECT 
    film_id,
    title
FROM
    film
WHERE
    film_id IN
(SELECT 
    inventory.film_id
FROM
    rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE
    rental.return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY
    film_id;



SELECT
    first_name,
    last_name
FROM 
    customer AS C
WHERE EXISTS -- EXISTS --> czy istnieje chociaż taka jedna --> False/True
(SELECT *
FROM
    payment AS P 
WHERE 
    P.customer_id = C.customer_id AND
    P.amount > 11);
---------------------------------------------------------------
