/* Q4. Write a procedure to show the AVG salary of every department. */

-- Create Procedure
CREATE OR REPLACE PROCEDURE avg_sal
IS
    CURSOR c_avg_sal IS
          SELECT d.department_name dept_name, ROUND(AVG (e.salary), 2) avg_sal
            FROM employees e JOIN departments d 
            ON e.department_id = d.department_id
        GROUP BY e.department_id, d.department_name;
BEGIN
    FOR i IN c_avg_sal
    LOOP
        DBMS_OUTPUT.PUT_LINE (i.dept_name || q'!'s average salary is: !' || i.avg_sal);
    END LOOP;
END;

-- Invoke Procedure
BEGIN
    avg_sal;
END;
