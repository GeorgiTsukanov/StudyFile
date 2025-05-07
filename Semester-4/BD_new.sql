--1
create or replace function getjobtitle (p_job_id in VARCHAR2)
    return varchar2 is v_job_title varchar2(35);
    begin 
        select job_title INTO v_job_title
        from jobs
        where job_id = p_job_id;
        return v_job_title;
    exception
        when NO_data_found then
        return 'должность не найдена';
    end;
    

select getjobtitle('AD') as job_title 
from dual;

--3

create or replace function ismanager(e_id in NUMBER)
    return varchar2 is v number(6, 0);
    begin 
        select manager_id INTO v
        from employees
        where manager_id = e_id and rownum = 1;
        return v;
    exception
        when NO_data_found then
        return 'Не менеджер';
    end;
    
select ismanager(300) as e
from dual;

--2
create or replace procedure add_dep(
    d_id in NUMBER,
    d_name in VARCHAR2,
    m_id in NUMBER,
    l_id in NUMBER
    )
    as 
    begin
        insert into departments(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
        values (d_id, d_name, m_id, l_id);
    exception
        when dup_val_on_index then
        dbms_output.put_line('деп уже сущ');
        when others then 
        dbms_output.put_line('ошибка');
    end;
    
begin; add_dep(10, 'Administration', 200, 1700);
rollback; 
