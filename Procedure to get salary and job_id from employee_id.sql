-- Create a procedure called GET_EMPLOYEE to query the EMPLOYEES table, 
-- retrieving the salary and job ID for an employee when provided with the employee ID.

-- Create Procedure
CREATE OR REPLACE PROCEDURE get_employee (p_emp_id IN NUMBER)
IS
    v_salary   NUMBER;
    v_job_id   VARCHAR2 (100);
BEGIN
    SELECT salary, job_id
      INTO v_salary, v_job_id
      FROM employees
     WHERE employee_id = p_emp_id;
    DBMS_OUTPUT.PUT_LINE (
        'Salary is: ' || v_salary || ' Job is: ' || v_job_id);
END get_employee;
/

-- Invoke Procedure
BEGIN
get_employee(107);
END;