SELECT  LENGTH('NEHA');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics;

SELECT first_name, LENGTH(first_name) AS len
FROM employee_demographics
ORDER BY len ASC;

SELECT UPPER('Neha');
SELECT LOWER('Neha');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;           -- Useful in standardisation

SELECT TRIM('        NEHA            ');   -- Gets rid of leading and trailing spaces
SELECT LTRIM('       NEHA            ');   -- Gets rid of left side spaces
SELECT RTRIM('       NEHA            ');   -- Gets rid of right side spaces

SELECT first_name, 
LEFT(first_name,4),
RIGHT(first_name,4),                       -- n is the number of characters to be considered
SUBSTRING(first_name,3,2)                  -- 3 is the start position and 2 is the characters to be considered
FROM employee_demographics;

SELECT first_name,birth_date,
SUBSTRING(birth_date,6,2) AS birth_month   -- can be used to also find the birth month of all the employees
FROM employee_demographics;

SELECT first_name, REPLACE(first_name,'l','n') FROM employee_demographics;

SELECT first_name, 
LOCATE('A',first_name) 
FROM employee_demographics;

SELECT first_name,last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;

