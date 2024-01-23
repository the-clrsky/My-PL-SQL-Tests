-- Create a PL/SQL block that asks for the employee number and
   shows the specified employees annaual salary with commission_pct.

-- PL/SQL Block
DECLARE
v_emp NUMBER := &emp_id;
v_ann_sal NUMBER;
BEGIN
SELECT (salary+(NVL(commission_pct, 0)*salary))*12 INTO v_ann_sal
FROM employees
WHERE employee_id = v_emp;
DBMS_OUTPUT.PUT_LINE(v_ann_sal);
END;
/
