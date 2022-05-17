use quan_ly_sinh_vien;

-- Đếm số lượng sinh viên ở từng nơi

SELECT address , count(s.id) from student s
GROUP BY address;

-- Tính điểm trung bình các môn học của mỗi học viên

SELECT s.id,s.student_name, AVG(mark)
FROM student s
join mark m on s.id= m.id_student
GROUP BY s.id, s.student_name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15

SELECT s.id,s.student_name, AVG(mark)
FROM student s
join mark m on s.id= m.id_student
GROUP BY s.id, s.student_name
having avg(mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

SELECT s.id,s.student_name, AVG(mark)
FROM student s
join mark m on s.id= m.id_student
GROUP BY s.id, s.student_name;