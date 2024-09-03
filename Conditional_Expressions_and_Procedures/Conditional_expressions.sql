/*
    CASE

SIMILAR IF/ELSE

-- General Syntax

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE some_other_result
END


CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE some_other_result
END

*/

SELECT 
    customer_id,
CASE
    WHEN (customer_id <= 100) THEN 'Premium'
    WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
    ELSE 'Normal' 
END AS customer_class
FROM
    customer;


SELECT 
    customer_id,
CASE customer_id
    WHEN 2 THEN 'Winner'
    WHEN 5 THEN 'Second Place'
    ELSE 'Nothing'
END AS raffle_results
FROM
    customer;


SELECT
SUM(CASE rental_rate
    WHEN 0.99 THEN 1
    ELSE 0
END) AS bargains,
SUM(case rental_rate
    WHEN 2.99 THEN 1
    ELSE 0
END) AS regular,
SUM(case rental_rate
    WHEN 4.99 THEN 1
    ELSE 0
END) AS premium
FROM 
    film;

/*
    COALESCE

COALESCE function accpets an unlimited number of arguments. It returns the first argument that is not null. If all arguments are null, will return null.

COALESCE(arg_1, arg_2, ..., arg_n)

SELECT COALESCE (1, 2)
- 1

SELECT COALESCE (NULL, 2, 3)
- 2


-- pozbycie się NULL wartości z kolumny

SELECT 
    item,
    (price - COALESCE(discount, 0)) AS final_price -- COALESCE(discount, 0) --> spowoduje to, że jeśli w kolumnie discount, w którymś wierszu pojawi się NULL zastąpi go 0!!!
FROM 
    table

*/


/*
    CAST

CAST --> convert one data type to another one if it possible. 


-- General Syntax for SQL
SELECT 
CAST('5' AS INTEGER)

-- PostgresSQL CAST operator
SELECT '5'::INTEGER


SELECT
CAST(date AS TIMESTAMP)
FROM
    table

*/

SELECT 
    CAST('5' AS INTEGER) AS new_int;

SELECT 
    '5'::INTEGER AS new_int;


SELECT 
    CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) 
FROM rental;


SELECT 
    return_date::DATE AS date
FROM 
    rental;


/*
    NULLIF

Takes in 2 inputs and returns NULL if both are equal, otherwise it returns the first argument passed.

NULLIF(arg1, arg2)

NULLIF(10, 10)
- NULL

NULLIF(10,12)
- 10

*/




/*
    Views

A view is a database object that is of a stored query.
Vies does not store data physically, it simply stores the query.
You can also update and alter existing views.

*/

CREATE VIEW customer_info AS 
SELECT 
    first_name,
    last_name,
    address
FROM
    customer
INNER JOIN address ON customer.address_id = address.address_id;

SELECT *
FROM customer_info;



CREATE OR REPLACE VIEW customer_info AS
SELECT
    first_name,
    last_name,
    address,
    district
FROM
    customer
INNER JOIN address ON customer.address_id = address.address_id;

SELECT *
FROM customer_info;


DROP VIEW customer_info -- po prostu kasujemy View

DROP VIEW IF EXISTS customer_info, -- sprawdzamy czy jest potem kasujemy View

ALTER VIEW customer_info RENAME TO c_info; -- zmiana nazwy View,

SELECT *
FROM customer_info; -- nie ma takiego view --> zmieniona nazwa

SELECT *
FROM c_info;


/*
    IMPORT AND EXPORT

IMPORT command DOES NOT create a table for you.
It assumes a table is already created.

COPY table_name
FROM 'your file path'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/