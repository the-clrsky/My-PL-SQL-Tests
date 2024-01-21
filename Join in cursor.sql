/* Q9. Create a PL/SQL block that selects the all the
       Employee Name, Department Name, Salary, Job ID. */

-- PL/SQL Block
DECLARE
    CURSOR c_emp_data IS
        SELECT e.first_name,
               e.last_name,
               d.department_name,
               e.salary,
               e.job_id
          FROM employees  e                     -- Left outer join, naile 106 ta employee ase
               LEFT OUTER JOIN departments d    -- karon, ekjoner department id nai
                   ON e.department_id = d.department_id;
BEGIN
    FOR i IN c_emp_data
    LOOP
        DBMS_OUTPUT.PUT_LINE (
               i.first_name
            || ' '
            || i.last_name
            || ', '
            || i.department_name
            || ', '
            || i.salary
            || ', '
            || i.job_id);
    END LOOP;
END;