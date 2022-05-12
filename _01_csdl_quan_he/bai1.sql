drop database student_management;
create database if not exists student_management;
use student_management;
create table if not exists class(
id int,
`name` varchar(50)
);
create table if not exists teacher(
id int,
`name` varchar(50),
age int,
country varchar(50)
);
insert into teacher values (1,"Trường",18,"Việt Nam");
insert into teacher values (2,"Tùng",20,"Việt Nam");
insert into class values (1,"C022G1");
insert into class values (2,"C0422G1");
select * from teacher;
select * from class;

-- update teacher set `name` = "Khoa";
update teacher set `name` = "Khoa" where id = 2;

delete from teacher where id = 2;