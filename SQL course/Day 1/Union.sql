-- Union combines rows of data from same or multiple tables
SELECT first_name, last_name FROM employee_demographics 
UNION      #use UNION ALL if you want to see the duplicates
SELECT first_name, last_name FROM employee_salary;

SELECT first_name, last_name, 'OLD MAN' AS Label
FROM employee_demographics 
WHERE age>40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'OLD WOMAN' AS Label
FROM employee_demographics 
WHERE age>40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'Highly Paid' AS Label
FROM employee_salary 
WHERE salary>70000
ORDER BY first_name , last_name;
