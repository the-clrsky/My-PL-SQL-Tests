-- Create a function to annual salary with commission.

-- Create Function
CREATE OR REPLACE FUNCTION ann_sal_comm 
(p_emp           IN     NUMBER,
p_ann_sal_com    OUT NUMBER) RETURN NUMBER
IS
v_ann_sal_comm   NUMBER;
BEGIN
    SELECT ((NVL(salary, 0) * NVL(commission_pct, 0)) + NVL(salary, 0)) * 12 INTO v_ann_sal_comm
      FROM employees
     WHERE employee_id = p_emp;
    p_ann_sal_com := v_ann_sal_comm;
    RETURN v_ann_sal_comm;
END ann_sal_comm;
/

-- Call Function
DECLARE
v_return_data NUMBER;
BEGIN
v_return_data := ann_sal_comm(174, v_return_data);  -- 174 is the employee_id
DBMS_OUTPUT.PUT_LINE(v_return_data);
END;
/