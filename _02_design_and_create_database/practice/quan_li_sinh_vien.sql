drop database quan_li_sinh_vien;
create database quan_li_sinh_vien;
use quan_li_sinh_vien;

create table class (
id_class int PRIMARY KEY AUTO_INCREMENT NOT NULL,
class_name varchar(60) NOT NULL,
start_date DATETIME not	null,
`status` bit
);


create table student (
id_student int PRIMARY KEY AUTO_INCREMENT NOT NULL,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
id_class int not null,
FOREIGN KEY (id_class) REFERENCES class (id_class)
);

CREATE TABLE `subject`(
id_sub int PRIMARY KEY AUTO_INCREMENT NOT NULL,
sub_name varchar(30) not null,
credit tinyint not null
DEFAULT(1) 
CHECK (credit >= 1),
`status` bit DEFAULT(1)
);

CREATE TABLE mark (
id_mark int PRIMARY KEY AUTO_INCREMENT not null,
id_sub int not null UNIQUE ,
id_student int not null UNIQUE ,
mark float DEFAULT(0)
check (0 <= mark <= 100),
exam TINYINT DEFAULT(1),
FOREIGN KEY (id_sub) REFERENCES `subject` (id_sub),
FOREIGN KEY (id_student) REFERENCES student (id_student)
);

