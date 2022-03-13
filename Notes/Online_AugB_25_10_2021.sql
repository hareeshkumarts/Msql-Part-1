use hr;
-- DQL
-- select,order by,limit
-- alias,distinct,concat
################################################################
-- alias - temporary name column
select Salary sal_1,
salary 'sal2',
salary as sal3,
salary as "sal4" from employees;
################################################################
select salary sal from employees;
-- easy to read / understand
-- security
-- speed
-- alias in where
select e.salary ,salary*5/100 '%age',salary+salary*5/100 Net
from employees e
where Net>15000;-- error

select e.salary ,salary*5/100 '%age',salary+salary*5/100 Net
from employees e
order by Net desc;-- works
#########################################################
-- syntax order of Query
-- select 
-- from 
-- where 
-- order by
-- limit;
-- execution order of Query
-- From
-- where 
-- select 'net'
-- order by 
-- limit 
########################################################
create table dup(sid int,sal int);
insert into dup values(1,2000),(1,3000),(2,4000);
insert into dup values(1,2000);
select * from dup;
-- distinct remove duplicate (frequently)
-- joins duplicate/redun
select distinct * from dup;
select  * from dup;
select  distinct sid from dup;
select  distinct sal from dup;
select  distinct sid,sal from dup;
#####################################################
select  distinct (sid) from dup;
select  distinct (sal) from dup;
select  distinct (sid,sal) from dup;-- error
#####################################################
-- concat
select concat(first_name,' ',last_name,' ',salary) full_info
from employees;

select concat(first_name,' you works in department number ',
department_id) from employees;
select concat(first_name,' ',salary) from employees;
#############################################################
select first_name||salary from employees;-- oracle + other db
#############################################################
-- Operators -> where(filter the rows)
-- Dual
-- print(90+89) 
select 90+89 ss from dual;-- official
-- pseudocolumn  
select 'namrata';
select 5/2,5 div 2 from dual;
select 5%2 from dual;
select (1=1) or (1=90) from dual;
select (1=1) and (1=90) from dual;
select null=null from dual;
select 1=90 ;
select (null=null) or (1=1) from dual;
select (null=null) and (1=1) from dual;-- Null
select '1'+1 from dual;-- char(10)-123,'123'
select 1+1 from dual;
select '1'+'1' from dual;
select '1'+'namrata1' from dual;
select '1'+'namrata1' from dual;
select '1x'+'1x' from dual;
select '1'+'9namrata1' from dual;-- exceptional
############################################################
select department_id,salary 
from employees where department_id=50;-- 45

select department_id, salary
from employees where department_id=50 
or department_id=80;-- 79

select department_id,salary 
from employees where department_id=50 or 80;

-- >8000
/*
21
47
65
35
106
45
*/
select * from employees where (department_id=50 and
salary = 8000)or (department_id=80 and salary = 8000);-- 3

select department_id, salary
from employees where (department_id=50 
or department_id=80) and salary>8000;-- 65

select department_id, salary
from employees where department_id=80 
or department_id=50 and salary>8000;

select department_id, salary
from employees where salary>8000 and department_id in(80,50)  ;

-- BODMAS
-- salary b/w 8000amd 15000
select salary from employees 
where salary>=8000 and salary<=15000;

select salary from employees 
where salary between 8000 and 15000;
###########################################################
-- not getting commission (employees)
select * from employees 
where commission_pct is null;

select * from employees
where commission_pct is not null;
###########################################################
create table name(sname varchar(20));
insert into name values('Namrata'),
('NAMRATA'),
('namrata'),
('nam%rata'),
('namra_ta'),
('n'),
('sjdj');

insert into name values('Namrnatan');
select * from name
where sname like 'n%';
-- like pattern matching + wild card characters(_,%)
-- % -- 0 or more 
-- _ single 
select  first_name from employees
where first_name like 'n%';-- 4

select  first_name from employees
where first_name like '%n';-- 20

select  first_name from employees
where first_name like '%n%';

select  sname from name
where sname like 'n%n';

select  first_name from employees
where first_name like '%e_';

select  first_name from employees
where first_name like '%c_';

select sname from name;
-- %
select sname from name
where sname like '%\%%';
-- '\%'
select sname from name
where sname like '%\_%';

select sname from name
where sname like '%\___';

select sname from name
where binary(sname)='Namrata';

select sname from name
where binary(sname) like 'NAM%';

select ascii('N'),ascii('n');
##############################################################
-- built in functions string+number+date +

-- last --  joins(set operator)
############################################################## 




 





















































