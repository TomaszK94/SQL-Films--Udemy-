/*
    Timestamps
*/
-- TIME --> contains only time 
-- DATE --> contains only date
-- TIMESTAMP --> contains date and time
-- TIMESTAMPTZ --> contains date, time and timezone

/*
    - TIMEZONE
    - NOW
    - TIMEOFDAY
    - CURRENT_TIME
    - CURRENT_DATE
*/

SHOW TIMEZONE  -- sprawdza naszą timezone

SELECT NOW()  -- sprawdza date, godzine i nasza timezone

SELECT TIMEOFDAY()  -- sprawdza datęm godzinę i strefę czasową --> zapis za pomocą stringu

SELECT CURRENT_TIME  -- sprawdza godzinę ze strefą czasową,

SELECT CURRENT_DATE  -- sprawdza samą datę


/*
    EXTRACT
*/

/*
    -- EXTRACT()
- YEAR
- MONTH
- DAY
- WEEK 
- QUARTER

EXTRACT(YEAR FROM date_col)
*/


/*
AGE() --> calculate  and returns the current age given a timestamp
AGE(date_col)
13 years 1 mon 5 days 01:34:13.003423

liczy to pomiędzy datą obecną a datą pobraną z bazy danych
*/

/*
TO_CHAR() --> general function to convert data types to text
TO_CHAR(date_col, 'mm-dd-yyyy')
*/

SELECT 
    EXTRACT(MONTH FROM payment_date) AS pay_month
FROM 
    payment


SELECT 
    AGE(payment_date)
FROM
    payment


SELECT 
    TO_CHAR(payment_date, 'dd-MM-YYYY')  -- należy w dokumentacji sprawdzić jak zapisywać dane zapytanie --> YYYY itd. różne formaty 
FROM
    payment


