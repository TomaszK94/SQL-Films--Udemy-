/*
    AS statment
*/

SELECT
    COUNT(amount) AS num_transactions
FROM
    payment;



SELECT
    customer_id,
    SUM(amount) AS total_spent
FROM
    payment
GROUP BY
    customer_id;



SELECT
    customer_id,
    SUM(amount) AS total_spent
FROM
    payment
GROUP BY
    customer_id
HAVING SUM(amount) > 100;  -- nie możemy posługiwać się AS total_spent --> AS total_spent wykonuje się na samym końcu więc nie istnieje podczas HAVING statment


SELECT 
    customer_id,
    amount AS new_name
FROM
    payment
WHERE
    amount > 2;  -- tak jak wyżej


/*
    INNER JOIN
*/

SELECT 
    payment_id,
    payment.customer_id,
    first_name,
    last_name,
    email
FROM
    payment
INNER JOIN customer ON payment.customer_id = customer.customer_id;