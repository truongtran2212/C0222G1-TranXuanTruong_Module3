use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

SELECT * from `subject` having credit >= (SELECT max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT * from `subject` s
INNER join mark m on s.id = m.id_sub
having m.mark >= (SELECT max(m.mark) from mark m);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần;

SELECT * , avg(mark) from student st
inner join mark m on st.id = m.id_student
GROUP BY st.id 
ORDER BY avg(mark) desc;



