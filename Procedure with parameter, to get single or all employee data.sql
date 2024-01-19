-- Procedure to get a salary breakdown
CREATE OR REPLACE PROCEDURE salary_breakdown (p_emp IN NUMBER)
IS     
    v_lname    VARCHAR2 (100);
    v_salary   NUMBER;
    v_basic    NUMBER;
    v_pf       NUMBER;
BEGIN
    SELECT last_name, salary
      INTO v_lname, v_salary
      FROM employees
     WHERE employee_id = p_emp;
    v_basic := v_salary * (45 / 100);
    v_pf := v_basic * (12 / 100);
    DBMS_OUTPUT.PUT_LINE (
           v_lname
        || q'!'s salary is: !'
        || v_salary
        || ', Basic salary: '
        || v_basic
        || ', PF contribution: '
        || v_pf);
END salary_breakdown;

-- Invoke Procedure to get a employee data
BEGIN
salary_breakdown(105);  -- 105 is the employee id
END;

-- Loop to get everyones salary breakdown
DECLARE
   v_emps NUMBER;
BEGIN
   FOR emp_id IN (SELECT employee_id FROM employees) LOOP
      v_emps := emp_id.employee_id;
      salary_breakdown(v_emps);
   END LOOP;
END;