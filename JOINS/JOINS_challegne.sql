-- California sales tax laws have changed and we need to alert our customers to this through email.
-- What are the emails of the customers who live in California?
SELECT
    customer_id,
    first_name,
    last_name,
    district,
    email
FROM
    customer
INNER JOIN address ON customer.address_id = address.address_id
WHERE
    address.district = 'California';


-- A customer walks in and is a huge fan of the actor "Nick Wahlberg" and wants to know which movies he is in.
-- Get a list of all the movies "Nick Wahlberg" has been in.
SELECT *
FROM actor
LIMIT 10;

SELECT *
FROM film
LIMIT 10;

SELECT *
FROM film_actor
LIMIT 10;


SELECT 
    film.title,
    actor.actor_id,
    actor.first_name,
    actor.last_name
FROM
    actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE 
    actor.first_name = 'Nick' AND
    actor.last_name = 'Wahlberg';
-----------------------------------------