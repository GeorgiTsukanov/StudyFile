select emp.first_name "Имя", emp.last_name
from HR.employees emp

select *
from HR.employees emp
where emp.manager_id is null

select emp.department_id,count(emp.employee_id)
from HR.employees emp
group by emp.department_id
having count(emp.employee_id) > 5

select *
from HR.employees emp
order by emp.department_id desc

//1
SELECT LAST_NAME, FIRST_NAME
FROM hr.EMPLOYEES
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENTS wheRE DEPARTMENT_NAME = 'Sales');

//2
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM hr.JOBS;

//3
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM hr.EMPLOYEES
WHERE SALARY >10000;

//4
SELECT DEPARTMENT_NAME,
COUNT (*) AS EMPLOYEE_COUNT
FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY EMPLOYEE_COUNT;

//5
SELECT E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E
WHERE EXTRACT (YEAR FROM E.HIRE_DATE)=2005;
