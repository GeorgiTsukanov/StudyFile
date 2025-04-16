select emp.first_name "Имя", emp.last_name "Фамилия"
from HR.employees emp

select *
from HR.employees emp
where emp.salary=2500

select emp.department_id,count(emp.employee_id)
from HR.employees emp
group by emp.department_id
order by emp.department_id desc

select first_name,last_name
from hr.employees
where department_id = (select department_id from departments where department_name = 'Sales');

select min_salary, max_salary
from jobs

select first_name, last_name, salary
from employees
where salary > 10000
order by salary asc;

select d.department_name, count(*) as emp_count
from departments d 
join employees e on d.department_id =
e.department_id
group by d.department_name
order by emp_count asc;

select e.first_name, e.last_name, e.hire_date
from employees e
where extract(year from e.hire_date)= 2005;


--1
select e.last_name, d.department_name, l.city, l.location_id
from employees e
join  departments d on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where e.commission_pct is not NULL

--2 melnikov
select distinct  j.job_title
from jobs j
join employees e on j.job_id = e.job_id
join departments d on d.department_id = e.department_id
where e.department_id = 80;

--2 tsukanov
select  distinct job_title
from employees
join jobs on jobs.job_id = employees.job_id
where employees.department_id = 80;

--3
select e.last_name, d.department_name
from employees e
join departments d on d.department_id = e.department_id
where e.last_name like '%a%'

--4 
select e.last_name, j.job_title, d.department_id, d.department_name
from employees e
join departments d on d.department_id = e.department_id
join locations l on l.location_id = d.location_id
join jobs j on j.job_id = e.job_id
where l.city = 'Toronto';

--5
