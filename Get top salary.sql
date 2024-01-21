/* Q3. Write a PL/SQL function to get the top salary of a specific departmnet. */

-- Create Function
CREATE OR REPLACE FUNCTION max_sal (p_dept_id IN NUMBER)
    RETURN NUMBER
IS
    v_sal   NUMBER;
BEGIN
    SELECT MAX (salary) INTO v_sal
      FROM employees
     WHERE department_id = p_dept_id;
    RETURN v_sal;
END max_sal;

-- Get data using PL/SQL
DECLARE
    v_get_max_sal   NUMBER;
BEGIN
    v_get_max_sal := max_sal (80);
    DBMS_OUTPUT.PUT_LINE (v_get_max_sal);
END;

-- Get data using SQL
SELECT max_sal(80) FROM dual;
