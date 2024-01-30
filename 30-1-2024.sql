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

/* Write a PL/SQL Procedure to show which employees get commission. */

-- Create Procedure
CREATE OR REPLACE PROCEDURE emp_comm
IS
CURSOR c_emp IS
SELECT employee_id emp, last_name lname, commission_pct comm
FROM employees
WHERE commission_pct IS NOT NULL;
BEGIN
FOR i IN c_emp LOOP
DBMS_OUTPUT.PUT_LINE('Employee ' || i.emp || ', ' || i.lname || ' gets ' || i.comm);
END LOOP;
END emp_comm;

-- Call Procedure
BEGIN
emp_comm;
END;

/* Write a PL/SQL Function to get the top salary of
   a specific department. */

-- Create Function
CREATE OR REPLACE FUNCTION top_sal
(p_dept NUMBER) RETURN NUMBER
IS
v_max NUMBER;
BEGIN
SELECT MAX(salary) INTO v_max FROM employees
WHERE department_id = p_dept
GROUP BY department_id;
RETURN v_max;
END top_sal;

-- Call Function
DECLARE
v_dept NUMBER := 90;
v_max NUMBER;
BEGIN
v_max := top_sal(v_dept);
DBMS_OUTPUT.PUT_LINE(v_max);
END;

