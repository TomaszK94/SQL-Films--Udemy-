/*
    SELECT
*/

SELECT *
FROM actor;


SELECT 
    first_name,
    last_name
FROM actor;


SELECT *
FROM city;


-- We want to send out a promotional email to our exisiting customers!
SELECT 
    first_name,
    last_name,
    email
FROM 
    customer;


/*
    SELECT DISTINC 
*/

SELECT DISTINCT
    (release_year)
FROM 
    film;


SELECT DISTINCT 
    (rental_rate)
FROM 
    film;


-- We want to know the types of ratings we have in our database. What ratings do we have available?
SELECT DISTINCT
    (rating)
FROM 
    film;


/*
    SELECT COUNT
*/

SELECT COUNT(*)
FROM
    payment;


SELECT COUNT (amount)
FROM
    payment;


SELECT 
    amount
FROM
    payment;


SELECT DISTINCT 
    amount
FROM
    payment;


SELECT COUNT (DISTINCT (amount))
FROM
    payment;



/*
SELECT WHERE
*/