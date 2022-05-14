use case_study;
-- Task 2:

SELECT *  from nhan_vien 
WHERE (ho_ten LIKE "T%" or ho_ten LIKE "K%" or ho_ten LIKE "H%") and length(15);

-- Task 3:
SELECT * from khach_hang
 WHERE (dia_chi = "Đà Nẵng" or dia_chi = "Quảng Trị") AND (18 <= (year(curdate()) - (year(ngay_sinh))) and (year(curdate()) - (year(ngay_sinh))) <= 50);
