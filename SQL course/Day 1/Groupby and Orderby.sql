#Group by is used to roll up the rows so that the aggregate functions like average, min, max can be used on them
SELECT * FROM employee_demographics;

-- if aggregate functions are not performed then SELECT needs to match GROUP BY
SELECT gender FROM employee_demographics GROUP BY gender;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM employee_demographics GROUP BY gender;

SELECT occupation,salary FROM employee_salary GROUP BY occupation,salary;

-- ORDER BY(ascending or descending)
SELECT * FROM employee_demographics ORDER BY 5,4;

-- Having clause(comes after groupby)
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender HAVING AVG(age)> 40;

SELECT occupation, AVG(salary) FROM employee_salary WHERE occupation LIKE '%Manager%' GROUP BY occupation HAVING AVG(salary)> 75000;
-- WHERE was used for row filtering and HAVING was used for aggregate function filtering


