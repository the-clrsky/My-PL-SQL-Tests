Question 1.

-- CA
DECLARE
    v_countryid        VARCHAR2 (20) := 'CA';
    v_country_record   countries%ROWTYPE;
BEGIN
    SELECT *
      INTO v_country_record
      FROM countries
     WHERE country_id = UPPER (v_countryid);
    DBMS_OUTPUT.PUT_LINE (
           'Country ID: '
        || v_country_record.COUNTRY_ID
        || ', Country Name: '
        || v_country_record.COUNTRY_NAME
        || ', Region: '
        || v_country_record.REGION_ID);
END;

-- DE
DECLARE
    v_countryid        VARCHAR2 (20) := 'DE';
    v_country_record   countries%ROWTYPE;
BEGIN
    SELECT *
      INTO v_country_record
      FROM countries
     WHERE country_id = UPPER (v_countryid);
    DBMS_OUTPUT.PUT_LINE (
           'Country ID: '
        || v_country_record.COUNTRY_ID
        || ', Country Name: '
        || v_country_record.COUNTRY_NAME
        || ', Region: '
        || v_country_record.REGION_ID);
END;

-- UK
DECLARE
    v_countryid        VARCHAR2 (20) := 'UK';
    v_country_record   countries%ROWTYPE;
BEGIN
    SELECT *
      INTO v_country_record
      FROM countries
     WHERE country_id = UPPER (v_countryid);
    DBMS_OUTPUT.PUT_LINE (
           'Country ID: '
        || v_country_record.COUNTRY_ID
        || ', Country Name: '
        || v_country_record.COUNTRY_NAME
        || ', Region: '
        || v_country_record.REGION_ID);
END;

-- US
DECLARE
    v_countryid        VARCHAR2 (20) := 'US';
    v_country_record   countries%ROWTYPE;
BEGIN
    SELECT *
      INTO v_country_record
      FROM countries
     WHERE country_id = UPPER (v_countryid);
    DBMS_OUTPUT.PUT_LINE (
           'Country ID: '
        || v_country_record.COUNTRY_ID
        || ', Country Name: '
        || v_country_record.COUNTRY_NAME
        || ', Region: '
        || v_country_record.REGION_ID);
END;

Question 3.

DECLARE
TYPE dept_table_type IS TABLE OF departments%ROWTYPE
INDEX BY PLS_INTEGER;
my_dept_table dept_table_type;
f_loop_count NUMBER := 10;
v_deptno NUMBER := 0;
BEGIN
    FOR i IN 1 .. f_loop_count
    LOOP 
        v_deptno := v_deptno + 10;
        SELECT * INTO my_dept_table(i)
        FROM DEPARTMENTS
        WHERE department_id = v_deptno;
        DBMS_OUTPUT.PUT_LINE('Department Number: ' || my_dept_table(i).department_id || ' Department Name: '|| my_dept_table(i).department_name);
        END LOOP;
        END;