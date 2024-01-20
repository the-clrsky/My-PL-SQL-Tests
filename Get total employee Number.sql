-- Write a function that returns the total number of EMPLOYEES in the employee table.

-- Create Function
CREATE OR REPLACE FUNCTION total_count
    RETURN NUMBER
IS
    v_emp   NUMBER;
BEGIN
    SELECT COUNT (*) INTO v_emp FROM employees;
    RETURN v_emp;
END total_count;
/

-- Get results
BEGIN
DBMS_OUTPUT.PUT_LINE('Total employee: '||total_count);
END;