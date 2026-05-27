-- Example : changes in the firstname,lastname and employee id in salary table should also reflect in demographics table
#Trigger occurs when events take place
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id,first_name,last_name)
	VALUES(NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id) 
VALUES(13,'Neha','Bhatia','CEO',1000000,NULL);

#Events are occured when they are scheduled
DELIMITER $$
CREATE EVENT delete_retirees_old
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE FROM employee_demographics WHERE age>=60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'events%';