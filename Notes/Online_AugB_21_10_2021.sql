show databases;
use namrata;
create table Table1(Sid int,Sname varchar(20),DOB date );
desc Table1;-- str (column+datatype+some other stories)
describe Table1;

create table t1 (col1 char(10));
insert into t1 values('Namrata');
select * from t1;
insert into t1 values('Namr4%%((647');
insert into t1 values('123');
insert into t1 values(123);-- exceptional
insert into t1 values(123.89);-- in every application 
-- Implicit conversion+Type casting

desc t1;-- 1 char Default 
create table t2 (col1 varchar(10));
insert into t2 values('Namr4%%((647');
insert into t2 values('123');
insert into t2 values(123);-- exceptional
insert into t2 values(123.89);-- in every application priority 
desc t2;
########################################################
create table Table1(Sid int,Sname varchar(20),DOB date );
desc table1;
insert into table1 values(1,'Namrata','1990-09-09');
select * from table1;
######################################################
-- New column,datatype,rename of name,drop,only size
desc table1;
Alter table table1 add address varchar(20);
Alter table table1 add new_col int after Sname;
Alter table table1 add new_col2 int before Sname;-- Not run
Alter table table1 add new_col2 int first;
############################################################
-- table - M rows + transcation +structure
-- alter DBA + Voter id cards + aadhar card
############################################################
desc table1;
alter table table1 drop new_col;
alter table table1 modify sname varchar(30);
-- 'Namrata' 10  (5)
alter table table1 drop new_col2,drop address;
alter table table1 modify sname char(30);
alter table table1 rename column sid to s_id;
Rename table table1 to StdInfo;
desc t1;
drop table t1;-- str+data = everything
#########################################################
-- namrata-stdinfo ->newdb
Create database newdb2;
Rename table StdInfo to newdb2.StdInfo;-- move 
########################################################
Rename table newdb2.StdInfo to namrata.StdInfo;
use namrata;
select * from StdInfo;
########################################################
insert into stdinfo values(1,'ndndhd','1990-09-09');
insert into stdinfo values(2,'dfhsgshd');-- error
insert into stdinfo values(2,'dfhsgshd',null);-- NAN
insert into stdinfo (s_id,sname)values(3,'querty');-- 150 (50)
insert into stdinfo (sname,s_id)values('dhjsgdjfh',4);
############################################################
-- MySQL 
set sql_safe_updates=1;-- Default
set sql_safe_updates=0;-- Default
select * from StdInfo;
update stdinfo set sname='Aarohi';-- all the name 
update stdinfo set sname='Aarohi' where sname='ndndhd';

delete from stdinfo ;-- all the data (empty table)
delete from stdinfo where s_id=4;
-- TRUNCATE

set autocommit=0;
select * from StdInfo;
delete from stdinfo;-- all the rows
rollback;
delete from stdinfo where s_id=1;-- selected
rollback;

select * from StdInfo;
truncate stdinfo;-- all the rows
rollback;
-- delete where + rollback+slow
-- truncate whole+fast
-- drop (str+data )can't rollback
-- delete filter+rollback /truncate +can't rollback
###########################################################
use hr;
-- 7 tables
select * from employees;
desc employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from job_history;
select * from jobs;
###################################################
-- Varsha Mali 
#######################################################
-- DQL (select)
########################################################
 




























