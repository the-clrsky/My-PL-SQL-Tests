-- DAY NUMBER of Year Calculator
DECLARE
v_date DATE := TO_DATE('25/12/2024', 'DD/MM/YYYY');
v_date_out NUMBER;
BEGIN
SELECT TO_CHAR(v_date, 'DDD')INTO v_date_out FROM dual;
DBMS_OUTPUT.PUT_LINE (v_date_out);
END;