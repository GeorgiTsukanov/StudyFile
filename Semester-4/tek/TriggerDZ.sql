--1
CREATE OR REPLACE TRIGGER validate_salary
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
DECLARE
    v_min_salary jobs.min_salary%TYPE;
    v_max_salary jobs.max_salary%TYPE;
BEGIN
    SELECT min_salary, max_salary INTO v_min_salary, v_max_salary
    FROM jobs
    WHERE job_id = :NEW.job_id;
    
    IF :NEW.salary < v_min_salary OR :NEW.salary > v_max_salary THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Зарплата ' || :NEW.salary || ' выходит за допустимые пределы для должности ' || :NEW.job_id || '.  Для должности определены такие зп. МИН: ' || v_min_salary || '. МАКС: ' || v_max_salary);
    END IF;
END;

UPDATE EMPLOYEES E
SET E.SALARY = 100000
WHERE E.EMPLOYEE_ID = 100;

--3
CREATE TABLE ARCHIVE_EMPLOYEE (
    EMPLOYEE_ID	NUMBER(6,0),
    FIRST_NAME	VARCHAR2(20 BYTE),
    LAST_NAME	VARCHAR2(25 BYTE),
    EMAIL	VARCHAR2(25 BYTE),
    PHONE_NUMBER	VARCHAR2(20 BYTE),
    HIRE_DATE	DATE,
    JOB_ID	VARCHAR2(10 BYTE),
    SALARY	NUMBER(8,2),
    COMMISSION_PCT	NUMBER(2,2),
    MANAGER_ID	NUMBER(6,0),
    DEPARTMENT_ID	NUMBER(4,0)
);

CREATE OR REPLACE TRIGGER  ARCHIVE_EMPLOYEE
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO  ARCHIVE_EMPLOYEE (
        employee_id, 
        first_name, 
        last_name, 
        email, 
        phone_number, 
        hire_date, 
        job_id, 
        salary, 
        commission_pct, 
        manager_id, 
        department_id
    ) VALUES (
        :OLD.employee_id, 
        :OLD.first_name, 
        :OLD.last_name, 
        :OLD.email, 
        :OLD.phone_number, 
        :OLD.hire_date, 
        :OLD.job_id, 
        :OLD.salary, 
        :OLD.commission_pct, 
        :OLD.manager_id, 
        :OLD.department_id
    );
END;

INSERT INTO EMPLOYEES VALUES
(
    999, 
    'G', 
    'G', 
    'G@G.G',
    '515.123.4567',
    '17.06.03',
    'AD_PRES',
    100000,
    NULL,
    NULL,
    90
);

DELETE FROM EMPLOYEES E
WHERE E.employee_id = 999;

--4, 8
CREATE OR REPLACE TRIGGER validate_email
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
BEGIN
    IF :NEW.email IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Email не может быть NULL');
    ELSIF NOT REGEXP_LIKE(:NEW.email, '^[A-Za-z0-9._-]+@[A-Za-z0-9-]+\.[A-Za-z]{2,}$') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Неверный формат email: ' || :NEW.email);
    END IF;
END;

UPDATE EMPLOYEES E
SET E.email = 'Dmitriy@saygexi'
WHERE E.employee_id = 100;

--5, 9
CREATE OR REPLACE TRIGGER set_unique_employee_id
BEFORE INSERT ON employees
FOR EACH ROW
DECLARE
    v_next_id NUMBER;
BEGIN
    IF :NEW.employee_id IS NULL THEN
        SELECT COALESCE(MAX(employee_id), 0) + 1 INTO v_next_id
        FROM employees;
        :NEW.employee_id := v_next_id;
    END IF;
END;

INSERT INTO EMPLOYEES VALUES
(
    NULL, 
    'G', 
    'G', 
    'G@G.G',
    '515.123.4567',
    '17.06.03',
    'AD_PRES',
    20080,
    NULL,
    NULL,
    90
);

--6
CREATE OR REPLACE TRIGGER dont_delete_manager
BEFORE DELETE ON employees
FOR EACH ROW
DECLARE
    v_manager_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_manager_count
    FROM departments
    WHERE manager_id = :OLD.employee_id;
    
    IF v_manager_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 
            'Нельзя удалить сотрудника, так как он является менеджером отдела');
    END IF;
END;

DELETE FROM EMPLOYEES E
WHERE E.EMPLOYEE_ID = 200;

--7
CREATE OR REPLACE TRIGGER update_department_manager
AFTER UPDATE OF manager_id ON departments
FOR EACH ROW
BEGIN
    UPDATE employees
    SET manager_id = :NEW.manager_id
    WHERE department_id = :NEW.department_id
    AND employee_id != :NEW.manager_id;
END;

UPDATE DEPARTMENTS D
SET D.MANAGER_ID = 100
WHERE D.DEPARTMENT_ID = 10;

UPDATE DEPARTMENTS D
SET D.MANAGER_ID = 200
WHERE D.DEPARTMENT_ID = 10;

--10
CREATE OR REPLACE TRIGGER limit_salary_increase
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    IF :NEW.salary > :OLD.salary * 1.2 THEN
        RAISE_APPLICATION_ERROR(-20006, 
            'Зарплата не может быть увеличена более чем на 20%. ' || 'Текущая зп: ' || :OLD.salary   || '. Введенная вами зп: ' || :NEW.salary);
    END IF;
END;

UPDATE EMPLOYEES E
SET SALARY = '100000'
WHERE E.EMPLOYEE_ID = 100;

--11
CREATE OR REPLACE TRIGGER validate_department_name
BEFORE INSERT OR UPDATE OF department_name ON departments
FOR EACH ROW
BEGIN
    IF :NEW.department_name IS NULL THEN
        RAISE_APPLICATION_ERROR(-20007, 'Название отдела не может быть NULL');
    ELSIF NOT REGEXP_LIKE(:NEW.department_name, '^[A-Za-z ]+$') THEN
        RAISE_APPLICATION_ERROR(-20008, 'Название отдела может содержать только буквы и пробелы');
    ELSIF LENGTH(:NEW.department_name) > 30 THEN
        RAISE_APPLICATION_ERROR(-20009, 'Название отдела не может превышать 30 символов');
    END IF;
END;

INSERT INTO DEPARTMENTS VALUES (221, '3', 232, 233);