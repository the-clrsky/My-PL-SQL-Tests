/* Q1. Write a PL/SQL block to insert data from employees to new emp_new_table
    using cursor. */

-- Create TABLE
CREATE TABLE emp_new_table
AS
SELECT * FROM employees;

-- TRUNCATE Table
TRUNCATE TABLE emp_new_table;

-- PL/SQL Block
DECLARE
    CURSOR c_employees IS SELECT * FROM employees;
BEGIN
    FOR i IN c_employees
    LOOP
        INSERT INTO emp_new_table
             VALUES (i.employee_id,
                     i.first_name,
                     i.last_name,
                     i.email,
                     i.phone_number,
                     i.hire_date,
                     i.job_id,
                     i.salary,
                     i.commission_pct,
                     i.manager_id,
                     i.department_id,
                     i.stars);   -- Please check your employees TABLE
    END LOOP;
END;