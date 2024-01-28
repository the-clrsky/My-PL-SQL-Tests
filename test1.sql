-- Question 1 : Create a procedure called ADD_DEPT to insert a new department into
-- the departments table. Provide the DEPARTMENT NAME and LOCATION ID of the 
-- department using two paremeners.

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

-- Question 2 : Write a function that returns the total number of Employees
-- in the employee table.

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


-- Question 3 : Craete a Procedure called GET_EMPLOYEE to query the Employees table,
-- retrieving the salary and job id for an employee when provided with the employee ID.

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