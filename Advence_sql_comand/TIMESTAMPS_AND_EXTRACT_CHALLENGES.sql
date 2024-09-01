-- During which months did payments occur?
-- Format your answer to return back the full month name.
SELECT DISTINCT
    TO_CHAR((payment_date), 'MONTH')
FROM
    payment;



-- How many payments occurred on a Monday?
SELECT
    COUNT(*)  
FROM
    payment
WHERE
    TO_CHAR((payment_date), 'D') = '2';  -- -- 'D' wybiera dzień tygodnia w formie od '1' - '7' --> niedziela jest 1 --> pon '2'

-- drugie rozwiązanie
SELECT 
    COUNT(*)
FROM
    payment
WHERE
    EXTRACT(dow FROM payment_date) = 1  -- dow dzień tygodnia
-------------