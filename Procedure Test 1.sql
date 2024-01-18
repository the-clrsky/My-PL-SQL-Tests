-- Create Procedure
CREATE OR REPLACE PROCEDURE test1 IS
v_lname VARCHAR2(100);
v_salary NUMBER;
BEGIN
SELECT last_name, salary INTO v_lname, v_salary FROM employees
WHERE employee_id = 100;
DBMS_OUTPUT.PUT_LINE(v_lname|| ' ' ||v_salary);
END;

-- Invoke the procedure
BEGIN
test1;
END;