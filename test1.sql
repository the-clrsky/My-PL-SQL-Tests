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