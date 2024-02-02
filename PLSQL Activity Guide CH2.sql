Chapter 2.

Task 1.

-- Create a new table
CREATE TABLE jobs_copy
AS SELECT * FROM jobs;

-- Create Procedure
CREATE OR REPLACE PROCEDURE ADD_JOB 
(p_id IN VARCHAR2,
p_title IN VARCHAR2) IS
BEGIN
INSERT INTO jobs_copy
VALUES(p_id, p_title, null, null);
END ADD_JOB;
/

-- Execute the procedure
EXECUTE ADD_JOB ('IT_DBA', 'Database Administration');

-- Check
SELECT * FROM jobs_copy;

Task 2.

-- Create Procedure
CREATE OR REPLACE PROCEDURE UPD_JOB
(p_id IN VARCHAR2,
p_title IN VARCHAR2) IS
BEGIN
UPDATE jobs_copy
SET job_title = p_title
WHERE job_id = p_id;
END UPD_JOB;
/

-- Execute the Procedure
EXECUTE UPD_JOB ('IT_DBA', 'Data Administrator'); 

-- Check Data
SELECT * FROM jobs_copy;

Task 3.

-- Create Procedure
CREATE OR REPLACE PROCEDURE DEL_JOB
(p_id IN VARCHAR2) IS
BEGIN
DELETE FROM jobs_copy
WHERE job_id = p_id;
END DEL_JOB;

-- Execute Procedure
EXECUTE DEL_JOB ('IT_DBA'); 

Check
SELECT * FROM jobs_copy;

Task 4.

-- Create Procedure
CREATE OR REPLACE PROCEDURE get_employee
(p_id IN NUMBER,
p_sal OUT NUMBER,
p_job OUT VARCHAR2) IS
BEGIN
SELECT salary, job_id INTO p_sal, p_job
FROM employees
WHERE employee_id = p_id;
END get_employee;
/

-- Print Results
VARIABLE v_sal NUMBER;
VARIABLE v_job VARCHAR2(15);
EXEC get_employee(105, :v_sal, :v_job);
PRINT v_sal v_job