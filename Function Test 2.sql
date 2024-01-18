-- Create FUNCTION
CREATE OR REPLACE FUNCTION test2 (p_emp_id EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN NUMBER
IS
    v_sal   EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT salary
      INTO v_sal
      FROM employees
     WHERE employee_id = p_emp_id;

    RETURN v_sal;
END test2;
/

-- Invoke FUNCTION with SQL
SELECT test2(102) FROM dual;

-- Invoke FUNCTION with PL/SQL
DECLARE
    v_result_salary   EMPLOYEES.SALARY%TYPE;
BEGIN
    v_result_salary := test2 (105);
    DBMS_OUTPUT.PUT_LINE ('Result Salary: ' || v_result_salary);
END;
/