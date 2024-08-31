-- How many payment transactions were greater than $5.00?
SELECT COUNT(*)
FROM
    payment
WHERE
    amount > 5.00;


-- How many actors have a first name that starts with letter P?
SELECT COUNT(first_name)
FROM actor
WHERE first_name LIKE 'P%';


-- How many unique districts are our customers from?
SELECT COUNT(DISTINCT(district))
FROM
    address;


-- Retrieve the list of names for those distinct districts from the previous question.
SELECT DISTINCT
    district
FROM
    address
ORDER BY
    district;


-- How many films have a rating of R and a replacement cost between $5 and $15?
SELECT 
    title,
    rating,
    replacement_cost
FROM
    film
WHERE
    rating = 'R' AND
    replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*)
FROM
    film
WHERE
    rating = 'R' AND
    replacement_cost BETWEEN 5 AND 15;


-- How many films have the word Truman somewhere in the title?
SELECT 
    title
FROM
    film
WHERE
    title ILIKE '%Truman%';

SELECT COUNT(*)
FROM
    film
WHERE
    title ILIKE '%Truman%';
----------------------------------------