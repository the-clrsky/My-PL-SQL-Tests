
-- Create Procedure
CREATE OR REPLACE PROCEDURE check_sal
(p_job_id IN VARCHAR2,
p_sal IN NUMBER) IS
v_min_sal NUMBER;
v_max_sal NUMBER;
BEGIN
SELECT MIN(salary), MAX(salary) INTO v_min_sal, v_max_sal
FROM employees
WHERE job_id = UPPER(p_job_id);
IF p_sal NOT BETWEEN v_min_sal AND v_max_sal THEN
RAISE_APPLICATION_ERROR(-20200, 'Invalid Salary. Salary of '||p_job_id||
' must be between '||v_min_sal||' and '||v_max_sal||'.');
END IF;
END;
/

-- Create TRIGGER
CREATE OR REPLACE TRIGGER check_sal_trg
BEFORE INSERT OR UPDATE OF job_id, salary ON emp_copy
FOR EACH ROW
BEGIN
check_sal(:new.job_id, :new.salary);
END;
/

-- INSERT Test
UPDATE emp_copy
SET salary = 1000
WHERE job_id = 'SA_REP'
/