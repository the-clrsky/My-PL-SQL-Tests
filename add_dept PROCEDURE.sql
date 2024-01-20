-- Create a procedure called ADD_DEPT to insert a new department into the departments table. 
-- Provide the DEPARTMENT NAME and LOCATION ID of the department using two parameters.


-- Create Procedure
CREATE OR REPLACE PROCEDURE add_dept (p_dept_name   IN VARCHAR2,
                                      p_loc_id      IN NUMBER)
IS
BEGIN
    INSERT INTO departments
         VALUES (DEPARTMENTS_SEQ.NEXTVAL, p_dept_name, NULL, p_loc_id);
END add_dept;
/

-- Invoke Procedure
BEGIN
add_dept('Test 1', 3000);
END;