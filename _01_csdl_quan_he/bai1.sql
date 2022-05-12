create database student_management_two;
use student_management_two;
create table class(
id int primary key auto_increment,
`name` varchar(50)
);
create table teacher(
id int primary key auto_increment,
`name` varchar(50),
age int,
country varchar(50)
);
insert class (name) values ("truong");
insert teacher (name, age, country) values ("tung",18,"Viet Nam");