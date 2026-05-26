-- Subqueries -> using WHERE, SELECT & FROM clause

-- To know about the employees of Parks and Rec dept(1)
SELECT * 
FROM employee_demographics
WHERE employee_id IN                         -- operand should contain only 1 column
				( SELECT employee_id 
                    FROM employee_salary
                    WHERE dept_id = 1
                    )
;

-- salary comparison with avg salary
SELECT first_name,salary,
(SELECT AVG(salary) FROM employee_salary)
FROM employee_salary;

SELECT gender,AVG(age), MAX(age), MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(`MAX(age)`) FROM
(SELECT gender,AVG(age), MAX(age), MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender) AS agg_table;                                -- backtick using option and key below esc

