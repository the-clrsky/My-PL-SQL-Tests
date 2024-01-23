-- Create a table called "EMP" with the data from employees table.
   Add a new column called "stars". Now, append an asterisk (*) to the 
   string for every $1,000 of the salary.

-- Create Table
CREATE TABLE emp
AS
SELECT * FROM employees;

-- Add stars column
ALTER TABLE emp
ADD (stars VARCHAR2(50));

-- PL/SQL Block
DECLARE
    CURSOR c_sal IS
        SELECT employee_id emp, RPAD ('*', ROUND (salary / 1000), '*') stars
          FROM employees;
BEGIN
    FOR i IN c_sal
    LOOP
        UPDATE emp
           SET stars = i.stars
         WHERE employee_id = i.emp;
    END LOOP;
END;