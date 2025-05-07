

-- 1
SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 2
SELECT e.*, l.city, l.state_province, l.street_address, l.postal_code
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.department_id = 60;

-- 3
SELECT e.last_name AS employee, m.last_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 4
SELECT 
    d.department_name,
    (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) AS employee_count
FROM departments d
ORDER BY employee_count DESC;

-- 5
SELECT d.department_name
FROM departments d
WHERE (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) > 5;

-- 6
SELECT 
    d.department_name,
    (SELECT AVG(salary) FROM employees e WHERE e.department_id = d.department_id) AS avg_salary
FROM departments d
WHERE (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) > 0
ORDER BY avg_salary DESC;

-- 7
SELECT last_name, first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- 8
SELECT e.last_name, e.job_id
FROM employees e
WHERE e.manager_id IS NULL;

-- 9
SELECT DISTINCT
    m.last_name AS manager,
    (SELECT COUNT(*) FROM employees e WHERE e.manager_id = m.employee_id) AS subordinates_count
FROM employees m
WHERE (SELECT COUNT(*) FROM employees e WHERE e.manager_id = m.employee_id) > 0
ORDER BY subordinates_count DESC;

-- 10
SELECT DISTINCT job_title
FROM jobs;

-- 11 ??
SELECT 
    d.department_name,
    (SELECT MAX(salary) FROM employees e WHERE e.department_id = d.department_id) AS max_salary
FROM departments d
WHERE (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) > 0
ORDER BY max_salary DESC;

-- 12
SELECT e.last_name, e.first_name, j.job_title, l.city, l.country_id
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 13
SELECT e.last_name, e.first_name, e.salary, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary < (SELECT AVG(salary) FROM employees WHERE job_id = e.job_id)
ORDER BY e.job_id, e.salary;

-- 14
SELECT e.last_name AS employee, e.hire_date AS employee_hire_date,
       m.last_name AS manager, m.hire_date AS manager_hire_date
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 15
SELECT e.last_name AS employee, s.last_name AS subordinate
FROM employees e
LEFT JOIN employees s ON e.employee_id = s.manager_id
ORDER BY e.last_name, s.last_name;

-- УСЛОЖНЕННЫЕ ЗАДАЧИ
-- 1
SELECT d.department_name
FROM departments d
WHERE (SELECT AVG(salary) FROM employees e WHERE e.department_id = d.department_id) > 500;

-- 2
SELECT e.last_name, e.first_name, e.salary, d.department_name, j.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id)
  AND e.salary > (SELECT AVG(salary) FROM employees WHERE job_id = e.job_id)
ORDER BY e.salary DESC;

-- 3
SELECT e.last_name, e.first_name, j.job_title, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.last_name = 'King';

-- 4
SELECT e.last_name, e.first_name, e.hire_date, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.hire_date >= ADD_MONTHS(SYSDATE, -6)
ORDER BY e.hire_date DESC;

-- 5
SELECT 
    d.department_name,
    (SELECT MAX(salary) FROM employees e WHERE e.department_id = d.department_id) AS max_salary,
    (SELECT MIN(salary) FROM employees e WHERE e.department_id = d.department_id) AS min_salary,
    (SELECT MAX(salary)-MIN(salary) FROM employees e WHERE e.department_id = d.department_id) AS salary_diff
FROM departments d
WHERE (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) > 0
ORDER BY salary_diff DESC;

-- 6
SELECT 
    d.department_name,
    (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) AS department_count,
    (SELECT COUNT(*) FROM employees) AS total_count
FROM departments d
ORDER BY department_count DESC;

-- 7
SELECT e1.last_name, e1.first_name, e1.salary, j.job_title
FROM employees e1
JOIN jobs j ON e1.job_id = j.job_id
WHERE EXISTS (
    SELECT 1 FROM employees e2 
    WHERE e1.job_id = e2.job_id 
    AND e1.salary = e2.salary 
    AND e1.employee_id != e2.employee_id
)
ORDER BY e1.job_id, e1.salary;

-- 8
SELECT e.last_name AS employee, e.salary AS emp_salary,
       m.last_name AS manager, m.salary AS mgr_salary,
       ABS(e.salary - m.salary) AS salary_diff
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE ABS(e.salary - m.salary) > 1000
ORDER BY salary_diff DESC;

-- 9
SELECT m.last_name, d.department_name
FROM employees m
JOIN departments d ON m.department_id = d.department_id
WHERE (SELECT COUNT(*) FROM employees e WHERE e.manager_id = m.employee_id) > 1
ORDER BY (SELECT COUNT(*) FROM employees e WHERE e.manager_id = m.employee_id) DESC;

-- 10
SELECT d.department_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (SELECT MAX(salary) FROM employees);
