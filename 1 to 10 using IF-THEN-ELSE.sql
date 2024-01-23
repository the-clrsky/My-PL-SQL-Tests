-- Print OUTPUT from 1 to 10 using IF-THEN-ELSE statement.

-- PL/SQL Block
BEGIN
    FOR i IN 1 .. 100
    LOOP
        IF i < 11
        THEN
            DBMS_OUTPUT.PUT_LINE (i);
        ELSE
            NULL;
        END IF;
    END LOOP;
END;