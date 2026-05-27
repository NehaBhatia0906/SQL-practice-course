-- Temp tables are visible only in the session they are created in.
#Method 1
CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_driver varchar(75)
);
SELECT * FROM temp_table;

INSERT INTO temp_table VALUES
('Neha','Bhatia','Lando Norris');

DELETE FROM temp_table LIMIT 1;

#Method 2 -- creating from existing table
CREATE TEMPORARY TABLE salary_over_50k
SELECT * FROM employee_salary WHERE salary>=50000;

SELECT * FROM salary_over_50k;