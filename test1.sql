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