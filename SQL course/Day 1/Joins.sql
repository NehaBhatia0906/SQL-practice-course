SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

-- INNER JOIN outputs the data of the same columns
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- OUTER JOIN types are left outer and right outer. Left outer join takes everything from the left table and return matches with the irght table. Right outer join will take everything from the right table and return matches with the left table.alter 
SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- SELF JOIN ties the table to itself
SELECT * 
FROM employee_salary AS sal1
JOIN employee_salary AS sal2
	ON sal1.employee_id + 1 = sal2.employee_id;     #example for secret santa where the first emp gifts the second employee and so on

SELECT sal1.employee_id AS emp_santa,
sal1.first_name AS first_name_santa, 
sal1.last_name AS last_name_santa,
sal2.employee_id AS emp_name,
sal2.first_name AS first_name_emp, 
sal2.last_name AS last_name_emp
FROM employee_salary AS sal1
JOIN employee_salary AS sal2
	ON sal1.employee_id + 1 = sal2.employee_id; 

-- Multiple joins
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT * FROM parks_departments;

SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;

    

