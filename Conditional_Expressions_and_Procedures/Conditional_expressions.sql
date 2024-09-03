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