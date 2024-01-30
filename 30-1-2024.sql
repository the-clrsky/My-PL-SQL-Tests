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

/* Create a procedure called ADD_DEPT to insert a new department into
   the departments table. Provide the DEPARTMENT NAME and LOCATION ID of the 
   department using two paremeners. */

-- Create Procedure
CREATE OR REPLACE PROCEDURE ADD_DEPT (
p_dept_name IN VARCHAR2,
p_loc IN NUMBER) IS
BEGIN
INSERT INTO departments
VALUES (DEPARTMENTS_SEQ.NEXTVAL, p_dept_name, null, p_loc);
END ADD_DEPT;

-- Call the procedure
EXECUTE ADD_DEPT('Test 1', 3000);

-- Check data
SELECT * FROM departments;

/* Write a function that returns the total number of Employees
   in the employee table. */

-- Create Function
CREATE OR REPLACE FUNCTION emp_count (
p_emp OUT NUMBER)RETURN NUMBER IS
BEGIN
SELECT COUNT(*) INTO p_emp FROM employees;
RETURN p_emp;
END emp_count;

-- Call Function
DECLARE
v_emp NUMBER;
BEGIN
v_emp := emp_count(v_emp);
DBMS_OUTPUT.PUT_LINE(v_emp);
END;


/* Craete a Procedure called GET_EMPLOYEE to query the Employees table,
  retrieving the salary and job id for an employee when provided with the employee ID. */

-- Create Procedure
CREATE OR REPLACE PROCEDURE get_employee
(p_emp IN NUMBER,
p_salary OUT NUMBER,
p_job_id OUT VARCHAR2) IS
BEGIN
SELECT salary, job_id INTO p_salary, p_job_id
FROM employees
WHERE employee_id = p_emp;
END get_employee;

-- Call Procedure
DECLARE
v_emp NUMBER := &emp;
v_sal NUMBER;
v_job_id VARCHAR2(50);
BEGIN
get_employee(v_emp, v_sal, v_job_id);
DBMS_OUTPUT.PUT_LINE(v_sal || ' ' || v_job_id);
END;