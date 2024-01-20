-- Create a PL/SQL block that selects the all Employee Name, Department Name, Salary, Job ID. 

-- Create Procedure (106 Employees)
CREATE OR REPLACE PROCEDURE emp_data
IS
    CURSOR c_emp_data IS
        SELECT e.first_name,
               e.last_name,
               d.department_name,
               e.salary,
               e.job_id
          FROM employees  e
               JOIN departments d ON e.department_id = d.department_id;
BEGIN
    FOR i IN c_emp_data
    LOOP
        DBMS_OUTPUT.PUT_LINE (
               i.first_name
            || ' '
            || i.last_name
            || q'!'s Department is: !'
            || i.department_name
            || ', Salary: '
            || i.salary
            || ', Job is: '
            || i.job_id);
    END LOOP;
END emp_data;
/

-- Invoke Procedure
BEGIN
emp_data;
END;

-- Create Procedure (107 Employees)
CREATE OR REPLACE PROCEDURE emp_data_all
IS
    CURSOR c_emp_data IS
        SELECT e.first_name,
               e.last_name,
               d.department_name,
               e.salary,
               e.job_id
          FROM employees e
               LEFT OUTER JOIN departments d ON e.department_id = d.department_id;
BEGIN
    FOR i IN c_emp_data
    LOOP
        DBMS_OUTPUT.PUT_LINE (
               i.first_name
            || ' '
            || i.last_name
            || q'!'s Department is: !'
            || NVL(i.department_name, 'N/A')
            || ', Salary: '
            || i.salary
            || ', Job is: '
            || i.job_id);
    END LOOP;
END emp_data_all;
/

-- Invoke Procedure 
BEGIN
emp_data_all;
END;