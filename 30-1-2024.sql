/* Write a PL/SQL procedure to insert data from
   employees table to the new_emp_table using cursor. */

-- Create TABLE
CREATE TABLE emp_new_table
AS
SELECT * FROM employees;

-- Truncate Table
TRUNCATE TABLE emp_new_table;

-- Create Procedure
CREATE OR REPLACE PROCEDURE insert_emp_data
IS
CURSOR c_emp IS
SELECT * FROM employees;
BEGIN
FOR i IN c_emp LOOP
INSERT INTO emp_new_table
VALUES(i.EMPLOYEE_ID, i.FIRST_NAME, i.LAST_NAME, i.EMAIL,
       i.PHONE_NUMBER, i.HIRE_DATE, i.JOB_ID, i.SALARY,
       i.COMMISSION_PCT, i.MANAGER_ID, i.DEPARTMENT_ID);
END LOOP;
END insert_emp_data;

-- Call Procedure
BEGIN
insert_emp_data;
END;

-- Check Data
SELECT * from emp_new_table;

