/*
    STRING FUNCIONTS AND OPERATORS  -- w dokumentacji są opisane wszystkie funkcję jakie możemy użyć w danych typu string --> string || string , lower(string) itd.....
*/


SELECT 
    LENGTH(first_name)
FROM 
    customer;


SELECT 
    first_name || ' ' || last_name AS full_name
FROM
    customer;


SELECT
    UPPER(first_name) || ' ' || UPPER(last_name) AS full_name
FROM
    customer;


SELECT 
    LOWER(LEFT(first_name, 1)) || '.' || LOWER(last_name) || '@gmail.com'
FROM
    customer;
-------------