#CTE stands for Common Table Expressions
-- WITH is the keyword to define a CTE
-- CTEs are unique because we can only use them immediately after creating it
-- CTEs are used for complex queries and to improve readability

WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,count(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * FROM CTE_Example;
#SELECT AVG(avg_sal) FROM CTE_Example;

WITH CTE_Example AS
(
SELECT employee_id,gender,birth_date
FROM employee_demographics
WHERE birth_date>'1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id,salary
FROM employee_salary
WHERE salary>50000
)
SELECT * 
FROM CTE_Example
JOIN CTE_Example2 
	ON CTE_Example.employee_id = CTE_Example2.employee_id;