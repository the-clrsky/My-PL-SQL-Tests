-- A PL/SQL Code to get employee salary, basic salary and PF contribution.
DECLARE
    v_emp      NUMBER := 102; -- Here, employee_id is 102.
    v_lname    VARCHAR2 (100);
    v_salary   NUMBER;
    v_basic    NUMBER;
    v_pf       NUMBER;
BEGIN
    SELECT last_name, salary
      INTO v_lname, v_salary
      FROM employees
     WHERE employee_id = v_emp;

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
END;