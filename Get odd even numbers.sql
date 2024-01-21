/* Q7. Write a PL/SQL program to print odd numbers between 1 to 10. */

-- PL/SQL Block
DECLARE
    v_num_start   NUMBER := 1;
    v_num_end     NUMBER := 10;
BEGIN
    FOR i IN v_num_start .. v_num_end
    LOOP
        IF MOD (i, 2) != 0  -- Vagsesh 0 na hole, bijor
        THEN
            DBMS_OUTPUT.PUT_LINE (i);
        END IF;
    END LOOP;
END;


/* Q8. Write a PL/SQL program to print even numbers between 1 to 10. */

-- PL/SQL Block
DECLARE
    v_num_start   NUMBER := 1;
    v_num_end     NUMBER := 10;
BEGIN
    FOR i IN v_num_start .. v_num_end
    LOOP
        IF MOD (i, 2) = 0  -- Vagsesh 0, tai jor
        THEN
            DBMS_OUTPUT.PUT_LINE (i);
        END IF;
    END LOOP;
END;