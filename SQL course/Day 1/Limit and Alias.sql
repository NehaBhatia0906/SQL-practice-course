SELECT * FROM employee_demographics LIMIT 3;
SELECT * FROM employee_demographics ORDER BY age DESC LIMIT 3;

-- Aliasing is changing the name of column

SELECT gender, AVG(age) AS avg_age 
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
