create database if not exists quan_li_diem_thi;
use quan_li_diem_thi;
create table student(
id_student int primary key auto_increment,
`name` varchar(50),
dateOfBirth date,
gender varchar(50)
);

create table teacher(
id_teacher int primary key auto_increment,
name_teacher varchar(50),
phone_number int
);

create table  `subject` (
id_subject int primary key auto_increment,
name_subject varchar(50),
id_teacher int,
foreign key (id_teacher) REFERENCES teacher (id_teacher)
);

create table table_point(
id_student int,
id_subject int,
`point` int,
dateExam date,
foreign key (id_student) REFERENCES student (id_student),
foreign key (id_subject) REFERENCES `subject` (id_subject)
);




