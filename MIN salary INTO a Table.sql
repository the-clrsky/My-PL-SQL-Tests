/* Q5. Create a PL/SQL block, that selects the minimum department_id in the
       departments table and store it in the v_did variable.
       Display the minimum Department ID. */

-- PL/SQL Block
DECLARE
    v_did   NUMBER;
BEGIN
    SELECT MIN (department_id) INTO v_did FROM departments;
    DBMS_OUTPUT.PUT_LINE ('Minimum Department ID: ' || v_did);
END;