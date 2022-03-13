use hr;
select * from employees;
-- length
select first_name,hire_date,salary,length(first_name),
length(hire_date),length(salary) from employees; 

select upper(first_name) ,lower('NAMRATA')
from employees;
-- Oracle (Initcap)

select substr('namrata',2,3),substr('namrata',2);
select instr('namrata','a') ;

select ('namrata thukral') from dual;
create table nam(sname varchar(20));
insert into nam values('namrata thukral'),
('abc xyz');
select * from nam;
select sname,substr(sname,1,instr(sname,' '))first_name,
substr(sname,instr(sname,' '))last_name from nam;
/*
'Ms. Namrata '
'Mr.abc'
*/

select sname,substr(sname,1,instr(sname,' '))first_name,
substr(sname,instr(sname,' '))last_name from nam
where trim(substr(sname,1,instr(sname,' ')))='namrata';

select sname,substr(sname,1,instr(sname,' '))first_name,
substr(sname,instr(sname,' ')) from nam;

-- TRIM remove leading & trailing spaces
select '     na   mrata   ',TRIM('     na   mrata   ') ;
select trim('a' from 'aaaaaanamraaaaaaataaaaaaaa');

select replace('anamrata','a','b') ;

select replace('namr   ata',' ','') ;
select * from nam;
insert into nam values('NAMRATA THUKRAL');

select sname,substr(sname,1,instr(sname,' '))first_name,
substr(sname,instr(sname,' '))last_name from nam
where binary(trim(substr(sname,1,instr(sname,' '))))='NAMRATA';

-- TRIM ,LTRIM,RTRIM
select trim(' nam	rata');
select trim(' nam	rata');-- tab it works in between 

SELECT trim('A' from 'namrata');-- remember case sensitive 
############
-- LPAD/RPAD
select lpad('namrata',10,'*'),
rpad('namrata',10,'*') ;

select lpad('namratafdhfjdshfjds',10,'*'),
rpad('namratafjhjhdghdkfghdkfgh',10,'*') ;
###################################################
select substr('namrata#thukral',1,instr('namrata#thukral','#'));
select sname,instr(sname,' ') from nam;
###################################################
-- How round works  in maths
-- its mid of line number
select round(89.67) ,round(89.67,1),
round(89.67,0),round(82.67,-1),round(22.67,-2),round(67,-2);
-- 80-85-90
-- 0-82 -100
-- ones,tens,hundreds,thousands
-- salary,share,petrol,incentive
-- shipment
-- chocolate 1box=12 =30 
select floor(89.56),truncate(89.56,1);
select ceil(89.56),ceil(89.23);
select sqrt(5);
select abs(-90);
################################################
-- date 'yyyy-mm-dd'
select datediff('2020-09-09','2021-01-10');
select hire_date from employees;-- tenure 

select datediff(current_date,hire_date)/365 yrs
from employees;

select datediff(now(),hire_date)/365 yrs
from employees;
-- tenure/age
select adddate(current_date,2),
subdate(current_date,2); 
select date(now()),time(now()),month(current_date),
monthname(current_date),year(current_date);
select datediff(now(),hire_date)/365 yrs,
year(current_date())-year(hire_date) yrs
from employees;
-- date_format()
select hire_date,date_format(hire_date,'%d %m %y'),
date_format(hire_date,'%D %M %Y'),
date_format(hire_date,'%d-%m/%y'),date_format(hire_date,'%Y%m') from employees;
#######################################################
select sum(salary),avg(salary),count(employee_id),
count(commission_pct),max(salary),min(salary) from employees;
#############################################################
select department_id,sum(salary) from employees
where department_id=90;

select department_id,sum(salary) from employees;
-- incorrect error/exception
select*  from employees;
select sum(salary) from employees;

select department_id,sum(salary) from employees
group by department_id;-- unique / no dup
#########################################################
-- multiple column ,rollup,examples
########





select datediff(now(),hire_date)/365*12 month
from employees;

select period_diff('202109','202008');
select period_diff(202109,202008);

select period_diff(date_format(current_date,'%Y%m'),
date_format(hire_date,'%Y%m')) from employees;








