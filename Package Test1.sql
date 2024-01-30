-- Package Specification
CREATE OR REPLACE PACKAGE job_pkg IS
    PROCEDURE add_job (p_jobid jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE);
    PROCEDURE del_job (p_jobid JOBS.JOB_ID%TYPE);
    FUNCTION get_job (p_jobid JOBS.JOB_ID%TYPE) RETURN JOBS.JOB_TITLE%TYPE;
    PROCEDURE upd_job (p_jobid IN JOBS.JOB_ID%TYPE, p_jobtitle IN jobs.job_title%TYPE);
END job_pkg;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY job_pkg IS
    PROCEDURE add_job (
        p_jobid jobs.job_id%TYPE,
        p_jobtitle jobs.job_title%TYPE) IS
    BEGIN
        INSERT INTO jobs (job_id, job_title)
        VALUES (p_jobid, p_jobtitle);
    END add_job;

    PROCEDURE del_job (p_jobid jobs.job_id%TYPE) IS
    BEGIN
        DELETE FROM jobs
        WHERE job_id = p_jobid;
        IF SQL%NOTFOUND THEN
            RAISE_APPLICATION_ERROR(-20203, 'No jobs deleted.');
        END IF;
    END del_job;

    FUNCTION get_job (p_jobid IN jobs.job_id%type)
    RETURN jobs.job_title%type IS
        v_title jobs.job_title%type;
    BEGIN
        SELECT job_title
        INTO v_title
        FROM jobs
        WHERE job_id = p_jobid;
        RETURN v_title;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL; -- Return NULL if no data found for the job ID
    END get_job;

    PROCEDURE upd_job(
        p_jobid IN jobs.job_id%TYPE,
        p_jobtitle IN jobs.job_title%TYPE) IS
    BEGIN
        UPDATE jobs
        SET job_title = p_jobtitle
        WHERE job_id = p_jobid;
        IF SQL%NOTFOUND THEN
            RAISE_APPLICATION_ERROR(-20202, 'No job updated.');
        END IF;
    END upd_job;
END job_pkg;
/

-- Invoke Package
EXECUTE job_pkg.add_job('IT_SYSAN', 'Systems Analyst')