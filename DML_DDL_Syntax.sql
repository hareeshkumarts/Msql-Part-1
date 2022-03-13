use bank;

-- DDL
create table test
(
sid bigint(20) NOT NULL Primary key,
firstName varchar(15) check(firstName in ('Hareesh','Kumar'))
);

select * from Test;

Alter Table test add column Lastname varchar(15);

Alter Table test add column user_id varchar(15);
Alter Table test add column product_id varchar(15);



Alter Table test modify column Lastname varchar(15);

Alter Table test ADD constraint unique(user_id);
Alter Table test ADD constraint unique(product_id);



desc test;

Alter Table test rename column Lastname to Lname;

ALter Table test drop column Lname;

Rename table test to test1;

Truncate table test1;

drop table test;

-- DML

insert into test values(1,'Hareesh','Kumar'),(2,'Hareesh','Kumar');

insert into test values(2,'Ramesh','Ramesh');

select * from test;

update test set sid = 3 where sid =2;

delete from test where sid=3;

select ceil(99.29) from dual; 

select time(current_timestamp) from dual;

select date_format(current_date,'%Y %M %D');