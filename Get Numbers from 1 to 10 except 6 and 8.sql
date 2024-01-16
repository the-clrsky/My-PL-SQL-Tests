DECLARE
    v_insert   NUMBER;
BEGIN
    FOR i IN 1 .. 10 LOOP
        IF i NOT IN (6, 8)
        THEN
            v_insert := i;
   DBMS_OUTPUT.PUT_LINE(v_insert);
        END IF;
    END LOOP;
END;
/