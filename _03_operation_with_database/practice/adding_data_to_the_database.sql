CREATE DATABASE if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class (
id int PRIMARY KEY AUTO_INCREMENT,
class_name varchar(50) not null,
start_date date,
`status` BOOLEAN
);

INSERT into class  (class_name,start_date, `status`) values ("A1", "2008-12-20",1);
INSERT into class  (class_name,start_date , `status`) values ("A2", "2008-12-22",1);
INSERT into class  (class_name,start_date , `status`) values ("B3", current_date(),0);

SELECT * from class;

create table student (
id int PRIMARY key	AUTO_INCREMENT,
student_name varchar(45),
address varchar(45),
phone varchar(20),
`status` BOOLEAN,
id_class int,

FOREIGN KEY (id_class) REFERENCES class (id)
);

INSERT into student (student_name, address, phone, `status`, id_class) values ("Hung","Ha Noi","0912113113",true,1);
INSERT into student (student_name, address, phone, `status`, id_class) values ("Hoa","Hai Phong",null,true,1);
INSERT into student (student_name, address, phone, `status`, id_class) values ("Manh","HCM","0123123123",false,2);

select * from student WHERE `status` = true;

create table `subject` (
id int PRIMARY key	AUTO_INCREMENT,
sub_name varchar(45),
credit int,
`status` BOOLEAN
);

INSERT into `subject`  (sub_name,credit, `status`) values ("CF", 5,1);
INSERT into `subject`  (sub_name,credit, `status`) values ("C", 6,1);
INSERT into `subject`  (sub_name,credit, `status`) values ("HDJ", 5,1);
INSERT into `subject`  (sub_name,credit, `status`) values ("RDBMS",10,1);

select * from `subject` WHERE credit < 10;

create table mark (
id int PRIMARY key	AUTO_INCREMENT,
id_sub int,
id_student int,
mark int,
exam_times int,
FOREIGN KEY (id_sub) REFERENCES `subject` (id),
FOREIGN KEY (id_student) REFERENCES student (id)
);

INSERT into mark (id_sub, id_student, mark, exam_times) values (1,1,8,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (1,2,10,2);
INSERT into mark (id_sub, id_student, mark, exam_times) values (1,3,1s2,1);

INSERT into mark (id_sub, id_student, mark, exam_times) values (3,1,15,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (2,2,20,2);
INSERT into mark (id_sub, id_student, mark, exam_times) values (2,3,5,1);

INSERT into mark (id_sub, id_student, mark, exam_times) values (2,1,9,1);
INSERT into mark (id_sub, id_student, mark, exam_times) values (3,2,8,2);
INSERT into mark (id_sub, id_student, mark, exam_times) values (3,3,7,1);
select * from mark;


SELECT s.id, s.student_name, cl.class_name
FROM student as s join class as cl on s.id = cl.id
WHERE cl.class_name ="A2";
