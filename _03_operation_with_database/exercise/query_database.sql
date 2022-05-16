use quan_ly_sinh_vien;

SELECT  student_name from student WHERE student_name like "H%"; 
select * from class where month(start_date) = 12;
SELECT * from `subject` WHERE credit > 3 and credit < 5;

update student set id_class = "2" where student_name = "Hung";

SELECT * from student;  

select s.student_name, sub.sub_name, m.mark from mark m
inner join student s on m.id = s.id                                                              
inner join `subject` sub on s.id = sub.id
ORDER BY m.mark asc, s.student_name desc;