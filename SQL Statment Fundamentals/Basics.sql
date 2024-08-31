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

    Comparison Operators
=
>
<
>=
<=
<> or !=

    Logical Operators
AND
OR
NOT
*/

SELECT *
FROM
    customer;



SELECT *
FROM
    customer
WHERE
    first_name = 'Jared';



SELECT *
FROM 
    film;


SELECT *
FROM
    film
WHERE
    rental_rate > 4 AND
    replacement_cost >= 19.99 AND
    rating = 'R';


SELECT COUNT (title)
FROM
    film
WHERE
    rental_rate > 4 AND
    replacement_cost >= 19.99 AND
    rating = 'R';


SELECT *
FROM
    film
WHERE 
    rating = 'R' OR
    rating = 'PG-13';


SELECT *
FROM 
    film
WHERE 
    rating != 'R';



-- What is the email for the customer with the name Nancy Thomas?
SELECT 
    first_name,
    last_name,
    email
FROM
    customer
WHERE
    first_name = 'Nancy' AND
    last_name = 'Thomas';


-- A customer wants to know what the movie "Outlaw Hanky" is about. Could you give them the description for the movie "Outlaw Hanky"?
SELECT
    title,
    description
FROM
    film
WHERE
    title = 'Outlaw Hanky';


-- A customer is late on their movie return, Can you get the phone number for the customer who lives at '259 Ipoh Drive'?
SELECT
    address,
    phone
FROM
    address
WHERE
    address = '259 Ipoh Drive';


/*
    ORDER BY
    ASC
    DESC
*/


SELECT *
FROM
    customer
ORDER BY
    first_name;


SELECT *
FROM
    customer
ORDER BY
    first_name ASC;


SELECT *
FROM
    customer
ORDER BY
    first_name DESC;


SELECT 
    store_id,
    first_name,
    last_name
FROM
    customer
ORDER BY
    store_id,
    first_name;


SELECT 
    store_id,
    first_name,
    last_name
FROM
    customer
ORDER BY
    store_id DESC,
    first_name ASC;


/*
    LIMIT
*/


SELECT *
FROM 
    payment
WHERE 
    amount != 0.00
ORDER BY
    payment_date DESC
LIMIT 5;



-- We want to reward our first 10 paying customers. What are the customer ids of the first 10 customers who created a payment?
SELECT
    customer_id
FROM
    payment
ORDER BY
    payment_date
LIMIT 10;


-- A customer wants to quickly rent a video to watch over their short lunch break.
-- What are the titles of the 5 shortest (in lenght of runtime) moveies?
SELECT
    title,
    length
FROM
    film
ORDER BY
    length
LIMIT 5;


-- If the customer can watch any moveie that is 50 minutes or less in run time, how many options does she have?
SELECT
    title,
    length
FROM
    film
WHERE 
    length <= 50
ORDER BY 
    length


SELECT COUNT (*)
FROM
    film
WHERE 
    length <= 50



/*
    BETWEEN
*/


SELECT *
FROM
    payment
WHERE
    amount BETWEEN 8 AND 9;

SELECT COUNT(*)
FROM
    payment
WHERE
    amount BETWEEN 8 AND 9;


SELECT COUNT(*)
FROM
    payment
WHERE amount NOT BETWEEN 8 AND 9;



SELECT *
FROM
    payment
WHERE
    payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT *
FROM
    payment
WHERE
    payment_date BETWEEN '2007-02-01' AND '2007-02-14';  -- nie wyświetla nic bo liczy to do 2007-02-14 0:00



/*
    IN
*/


SELECT *
FROM
    payment
WHERE
    amount IN (0.99, 1.98, 1.99)
ORDER BY
    amount;

SELECT COUNT (*)
FROM
    payment
WHERE
    amount IN (0.99, 1.98, 1.99);


SELECT COUNT(*)
FROM
    payment
WHERE
    amount NOT IN (0.99, 1.98, 1.99);


SELECT *
FROM
    customer
WHERE first_name IN ('John', 'Jake', 'Julie');



/*
    LINE and ILIKE
    WILDCARDS
    % AND _
ILIKE is case-insensitive!!!
Istnieją też inne --> regex jak w pythonie  --> dokumentacja postgresql
*/


SELECT *
FROM
    customer
WHERE
    first_name LIKE 'J%';

SELECT COUNT(*)
FROM
    customer
WHERE
    first_name LIKE 'J%';



SELECT COUNT (*)
FROM
    customer
WHERE
    first_name LIKE 'J%' AND
    last_name LIKE 'S%';

SELECT *
FROM
    customer
WHERE
    first_name LIKE 'J%' AND
    last_name LIKE 'S%'

SELECT *
FROM
    customer
WHERE
    first_name ILIKE 'j%' AND
    last_name ILIKE 's%'



SELECT *
FROM
    customer
WHERE
    first_name LIKE '_her%';



SELECT *
FROM
    customer
WHERE
    first_name NOT LIKE '_her%';



SELECT *
FROM
    customer
WHERE
    first_name LIKE 'A%' AND
    last_name NOT LIKE 'B%'
ORDER BY
    last_name;
-----------------------------------------------------