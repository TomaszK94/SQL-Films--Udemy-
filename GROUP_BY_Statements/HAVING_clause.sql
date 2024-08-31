/*
    HAVING
*/


SELECT 
    customer_id,
    SUM(amount)
FROM 
    payment
GROUP BY
    customer_id
HAVING 
    sum(amount) > 100;



SELECT 
    store_id,
    COUNT(customer_id)
FROM
    customer
GROUP BY
    store_id
HAVING
    COUNT(customer_id) > 300;