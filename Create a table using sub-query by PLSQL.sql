-- Create a table using sub-query by PL/SQL
CREATE OR REPLACE PROCEDURE create_table (p_table_name   VARCHAR2,
                                          p_table_sub    VARCHAR2)
IS
BEGIN
    EXECUTE IMMEDIATE   'DROP TABLE '   || p_table_name;
    EXECUTE IMMEDIATE   'CREATE TABLE ' || p_table_name || ' AS (' || p_table_sub || ')';
END create_table;
/

BEGIN
    create_table (
        'Test_SUB',
        'SELECT last_name, salary FROM employees
                             WHERE employee_id = (SELECT employee_id FROM employees
                                                  WHERE salary > 20000)');
END;
/