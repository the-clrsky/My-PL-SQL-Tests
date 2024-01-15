DECLARE
    v_sal_before   NUMBER;
    v_sal_after    NUMBER;
    v_name     VARCHAR2(100);
    CURSOR cur_emp_sal IS SELECT last_name, salary FROM employees;
BEGIN
    FOR emp IN cur_emp_sal
    LOOP
        v_sal_before := emp.salary;
        v_name := emp.last_name;
        IF v_sal_before BETWEEN 1000 AND 5000
        THEN
            v_sal_after := v_sal_before + 200;
        ELSIF v_sal_before BETWEEN 5001 AND 21000
        THEN
            v_sal_after := v_sal_before + 500;
        ELSE
            v_sal_after := v_sal_before;
        END IF;

        DBMS_OUTPUT.PUT_LINE (v_name || ' - ' || 'Before was: ' || v_sal_before || ' After is: ' || v_sal_after);
    END LOOP;
END;