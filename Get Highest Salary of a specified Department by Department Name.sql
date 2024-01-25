-- Get Highest Salary of a specified Department by Department Name
DECLARE
v_dept_name_get VARCHAR2(100) := '&dept_name';
v_dept_name VARCHAR2(100);
v_max_sal NUMBER;
BEGIN
SELECT MAX(e.salary), d.department_name INTO v_max_sal, v_dept_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = v_dept_name_get
GROUP BY e.department_id, d.department_name;
DBMS_OUTPUT.PUT_LINE(v_dept_name||q'! Department's Highest Salary is: !'||v_max_sal);
END;
/