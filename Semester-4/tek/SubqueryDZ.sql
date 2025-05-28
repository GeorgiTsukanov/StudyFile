--1 2015 -> 2003
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.hire_date,
       e.department_id,
       d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.hire_date > '31-12-2003'
AND e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

--2
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       d.department_id,
       d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id = (
    SELECT department_id
    FROM (
        SELECT department_id, AVG(salary) as avg_salary
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id
        ORDER BY avg_salary DESC
    )
    WHERE ROWNUM = 1
)
ORDER BY e.salary DESC;

--3
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.job_id,
       j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary > (
    SELECT max_salary * 0.1
    FROM jobs
    WHERE job_id = e.job_id
)
ORDER BY e.salary DESC;


--4

--5
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       e.job_id,
       d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE job_id = 'HR_REP'
    AND department_id IS NOT NULL
)
AND e.salary > 5000
ORDER BY e.salary DESC;

--6
SELECT 
    d.department_id,
    d.department_name,
    ROUND(AVG(e.salary), 2) AS department_avg_salary,
    ROUND((SELECT AVG(salary) FROM employees), 2) AS company_avg_salary,
    COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > (SELECT AVG(salary) FROM employees)
ORDER BY department_avg_salary DESC;

--7
SELECT 
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    ROUND(
        (SELECT AVG(cnt) 
         FROM (SELECT COUNT(*) AS cnt 
               FROM employees 
               WHERE department_id IS NOT NULL 
               GROUP BY department_id)),
        1
    ) AS avg_employees_per_dept
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 
    (SELECT AVG(cnt) 
     FROM (SELECT COUNT(*) AS cnt 
           FROM employees 
           WHERE department_id IS NOT NULL 
           GROUP BY department_id))
ORDER BY employee_count DESC;

--8
SELECT 
    d.department_id,
    d.department_name,
    MAX(e.salary) AS department_max_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING MAX(e.salary) > (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = 50
)
ORDER BY MAX(e.salary) DESC;


--9
SELECT 
    m.employee_id,
    m.first_name,
    m.last_name,
    m.salary AS manager_salary,
    ROUND((SELECT AVG(salary) FROM employees), 2) AS company_avg_salary,
    COUNT(e.employee_id) AS high_paid_subordinates_count
FROM employees m
JOIN employees e ON m.employee_id = e.manager_id
WHERE e.salary > (SELECT AVG(salary) FROM employees)
GROUP BY m.employee_id, m.first_name, m.last_name, m.salary
HAVING COUNT(e.employee_id) > 0
ORDER BY high_paid_subordinates_count DESC;

--10

--11
SELECT e.*
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING MIN(salary) > 3000
);

--12
SELECT e.*
FROM employees e
WHERE e.job_id = 'SA_REP'
AND e.department_id IN (
    SELECT department_id
    FROM employees
    WHERE job_id = 'IT_PROG'
)
AND e.salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE job_id = 'SA_REP'
);