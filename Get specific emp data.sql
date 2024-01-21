/* Q6. Create a PL/SQL block that retrieves the Last Name, Hire Date and Salary 
       for the specified employees from the employees table. */

-- PL/SQL Block
DECLARE
    v_emp_id      NUMBER := 107;
    v_lname       VARCHAR2 (100);
    v_hire_date   DATE;
    v_salary      NUMBER;
BEGIN
    SELECT last_name, hire_date, salary
      INTO v_lname, v_hire_date, v_salary
      FROM employees
     WHERE employee_id = v_emp_id;
    DBMS_OUTPUT.PUT_LINE (
           'Name: '
        || v_lname
        || ', Hired on: '
        || v_hire_date
        || ', Salary: '
        || v_salary);
END;