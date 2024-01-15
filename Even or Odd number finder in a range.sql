-- Even or Odd number finder in a range.
DECLARE
    v_num_start    NUMBER := 500;
    v_num_end      NUMBER := 800;
    v_num_cur      NUMBER;
    v_even_count   NUMBER := 0;
    v_odd_count    NUMBER := 0;
BEGIN
    FOR v_num_cur IN v_num_start .. v_num_end
    LOOP
        IF MOD (v_num_cur, 2) = 0
        THEN
            v_even_count := v_even_count + 1;
            DBMS_OUTPUT.PUT_LINE (v_num_cur || ' is the ' || v_even_count || 'th even number');
        ELSE
            v_odd_count := v_odd_count + 1;
            DBMS_OUTPUT.PUT_LINE (v_num_cur || ' is the ' || v_odd_count || 'th odd number');
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total even numbers are '||v_even_count);
    DBMS_OUTPUT.PUT_LINE('Total odd numbers are '||v_odd_count);
END;