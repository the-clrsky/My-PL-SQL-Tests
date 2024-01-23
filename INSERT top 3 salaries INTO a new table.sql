-- Insert top 3 employees from the employee table,
   into the the max_sal table.

-- Create Table
CREATE TABLE max_sal (
salary NUMBER);

-- PL/SQL Block
DECLARE
    CURSOR c_sal IS
          SELECT salary FROM employees
        ORDER BY salary DESC;
    v_counter   NUMBER := 1;
BEGIN
    FOR i IN c_sal
    LOOP
        IF v_counter < 4 THEN
            INSERT INTO max_sal
                 VALUES (i.salary);
            v_counter := v_counter + 1;
        END IF;
    END LOOP;
END;

-- Check data
SELECT * FROM max_sal;