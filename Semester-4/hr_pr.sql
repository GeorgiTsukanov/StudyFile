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


SELECT LAST_NAME, FIRST_NAME
FROM hr.EMPLOYEES
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENTS wheRE DEPARTMENT_NAME = 'Sales');
