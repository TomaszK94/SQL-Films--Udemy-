/*
    Data Types
*/

/*
Boolean --> True or False

Character --> char, varchar, text

Numeric --> integer, floating

Temporal --> date, time, timestamp, interval

-- Po więcej trzeba zajrzeć do dokumentacji
*/


/*
    Primary and Foreign Keys

Primery key --> unique non-null value
Foreign key zawsze powinnien miec stworzoną relację do innej tabeli
*/

/*
    Constraints:
    - Column Constraints
    - Table Constraints

    Najczęściej używane do kolumn:
    - NOT NULL --> kolumna nie może zawierać wartości null
    - UNIQUE --> każda wartość w kolumnie musi być unikatowa
    - PRIMARY KEY
    - FOREIGN KEY
    - CHECK --> określamy warunki jakie mają spełniać wartości w kolumnie
    - EXCLUSION --> c.d.n

    Tabel:
    - CHECK --> sprawdzanie wartości danym warunkiem gdy wrzucane lub updatowane są dane
    - REFERENCES --> wartość musi istnieć w kolumnie w innej tabeli
    - UNIQUE(column_list) --> ustalamy które kolumny mają posiadać unikatowe wartośći
    - PRIMARY KEY(column_list) --> jak wyżej
*/


/*
    CREATE
*/

CREATE TABLE table_name (
    column_name TYPE column_constraint,
    column_name TYPE column_constraint,
    table_constraint table_constraint
) INHERITS existing_table_name;


-- SERIAL --> typ danych, który sam się uzupełnia --> dobry typ danych do tworzenia Primery Key --> tworzy sequence of integers --> 1, 2, 3, 4 itd... co każde dołączenie danych
-- jak skasujemy jakiś wiersz danych SERIAL nie zostanie poprawiony --> 1, 2, 3, 5 , 6, 7 --> 4 został skasowany
-- 3 rodzaje SERIAL --> smallserial, serial, bigserial --> wielkość


-- Przykład
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    age SMALLINT NOT NULL
);
-------------------------------------------

CREATE DATABASE learning; -- tworzymy nową bazę danych


-- Tworzenie tabeli
CREATE TABLE account (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP 
);


CREATE TABLE job (
    job_id SERIAL PRIMARY KEY,
    job_name VARCHAR(200) UNIQUE NOT NULL
);


CREATE TABLE account_job (
    user_id INTEGER REFERENCES account(user_id),
    job_id INTEGER REFERENCES job(job_id),
    hire_date timestamp
);


/*
    INSERT

-- Dodawanie wartości do wierszy
INSERT INTO table(column1, column2, ...)
VALUES
(value1, value2, ...),
(value1, value2, ...),...;

-- Dodawanie wartości pobranych z innej tabeli
INSERT INTO table(column1, column2,...)
SELECT column1, column2,...
FROM another_table
WHERE condition;

*/

-- dodajemy wartości do tabeli 

INSERT INTO account (username, password, email, created_on)  -- user_id uzupełni się sam nie możemy nic wpisywać!! --> last_login może pozostać pusty więc możemy ale nie musimy
VALUES
('Jose', 'password', 'jose@mail.com', CURRENT_TIMESTAMP);

SELECT *
FROM account


INSERT INTO job (job_name)
VALUES
('Astonaut');

INSERT INTO job (job_name)
VALUES
('President');

SELECT *
FROM job


INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1, CURRENT_TIMESTAMP);

SELECT *
FROM account_job


-- nie zadziała bo nie ma takiego user_id i job_id --> bo jest powiązane FOREIGN KEYem
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(10, 10, CURRENT_TIMESTAMP);


/*
    UPDATE

-- UPDATE table

SET column1 = value1,
column2 = value2,...
WHERE
    condition;


-- UPDATE TABLE USING ANOTHER TABLE's

UPDATE tableA
SET original_col = tableB.new_col
FROM tableB
WHERE tableA.id = tableB.id


-- Return affected rows
UPDATE table
SET column1 = value1
RETURNING column2, column3

*/

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

SELECT *
FROM account;

UPDATE account
SET last_login = created_on;

SELECT *
FROM account;



UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

SELECT *
FROM account_job



UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;


/*
    DELETE

-- Delete rows

DELETE FROM table
WHERE row_id = 1


-- Delete rows based on their presence in other tables

DELETE FROM tableA
USING tableB
WHERE tableA.id = tableB.id


-- Delete all rows from a table

DELETE FROM table


Tak samo jak przy UPDATE działa komenda RETURNING
*/

INSERT INTO job (job_name)
VALUES
('Cowboy');

SELECT * 
FROM job;

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name;

SELECT * 
FROM job;


/*
    ALTER clause

Allows to change an existing table structure:
    - adding, droping, renaming columns
    - changing column's data types
    - set DEFAULT values for a column
    - add CHECK Constraints
    - rename table

-- General Syntax

ALTER TABLE table_name action


-- Adding Columns

ALTER TABLE table_name
ADD COLUMN new_col TYPE

-- Removing Columns
ALTER TABLE table_name
DROP COLUMN col_name

-- Alter constraints

ALTER TABLE table_name
ALTER COLUMN col_name
SET DEFAULT value / DROP DEFAULT / SET NOT NULL / DROP NOT NULL / ADD CONSTRAINT constraint_name
*/


CREATE TABLE information (
    info_id SERIAL PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    person VARCHAR(50) NOT NULL UNIQUE
);

SELECT *
FROM information;

ALTER TABLE information
RENAME TO new_info;

SELECT *
FROM information;  -- nie zadziała bo zmieniono nazwę tablicy

SELECT *
FROM new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people;

SELECT* 
FROM new_info;

INSERT INTO new_info(title)
VALUES
('some new title'); -- nie zadziała bo kolumna people (wcześniej person) nie może być pusta

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info(title)
VALUES
('some new title'); -- teraz zadziała bo zmieniśmy, że może być pusta 

SELECT *
FROM new_info;

/*
    DROP TABLE

Complete remove column from table
Not remove columns used in views, triggers or sored procedures without the additional CASCADE clause

-- GENERAL Syntax

ALTER TABLE table_name
DROP COLUMN col_name

-- Remove all dependencies

ALTER TABLE table_name
DROP COLUMN col_name CASCADE

-- Check for existence to avoid error

ALTER TABLE table_name
DROP COLUMN IF EXISTS col_name

-- Drop multiple columns

ALTER TABLE table_name
DROP COLUMN col_one,
DROP COLUMN col_two

*/

SELECT *
FROM new_info;

ALTER TABLE new_info
DROP COLUMN people;

SELECT *
FROM new_info;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;  -- pominięte bez błedu bo kolumna nie istnieje

/*
    CHECK Constraint

Check constraint allows us to create more customized constraints that adhere to a certain condition. 
Such as making sure all inserted integer values fall below a certain threshold.

-- Przykład

CREATE TABLE example (
    ex_id SERIAL PRIAMARY KEY,
    age SMALLINT CHECK(age > 21),
    parent_age SMALLINT CHECK(parent_age > age)
    );
*/


CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE CHECK (birthdate > '1900-01-01'),
    hired_date DATE CHECK (hired_date > birthdate),
    salary INTEGER CHECK (salary > 0)
)

INSERT INTO employees (
    first_name, 
    last_name, 
    birthdate, 
    hired_date, 
    salary)
VALUES (
    'Jose', 
    'Portilla', 
    '1899-11-03', 
    '2010-01-01', 
    100
    ); -- nie zadziała bo birthdate CHECK nie jest spełniony!!

INSERT INTO employees (
    first_name, 
    last_name, 
    birthdate, 
    hired_date, 
    salary)
VALUES (
    'Jose', 
    'Portilla', 
    '1999-11-03', 
    '2010-01-01', 
    100
    ); -- zadziała wszystko ok

SELECT *
FROM employees;


INSERT INTO employees (
    first_name, 
    last_name, 
    birthdate, 
    hired_date, 
    salary)
VALUES (
    'Samy', 
    'Smith', 
    '1999-11-03', 
    '2010-01-01', 
    -100
    ); -- nie zadziała bo salary CHECK nie jest spełniony

INSERT INTO employees (
    first_name, 
    last_name, 
    birthdate, 
    hired_date, 
    salary)
VALUES (
    'Samy', 
    'Smith', 
    '1999-11-03', 
    '2010-01-01', 
    100
    ); -- zadziała wszystko ok


SELECT *
FROM employees;

-- nie udanemu dodaniu SERIAL i tak przypisuje wartość przez co po dodaniu poprawnie danych tworzą się puste emp_id, jakby wiersze zostały usunięte...
