/* Q2. Write a PL/SQL block to show the data which employees get commission_pct. */

-- PL/SQL Block
DECLARE
    CURSOR c_commission IS
          SELECT * FROM employees
           WHERE commission_pct IS NOT NULL
        ORDER BY commission_pct;
BEGIN
    FOR i IN c_commission
    LOOP
        DBMS_OUTPUT.PUT_LINE (
               i.first_name
            || ' '
            || i.last_name
            || q'!'s commission pct is: !'
            || '0'
            ||i.commission_pct);
    END LOOP;
END;