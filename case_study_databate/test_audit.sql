use case_study;

SELECT * from nhan_vien  where
(SELECT substring_index(ho_ten, " ",-1)) like "Đ%";



-- Điều kiện hiển thị theo tên
-- SELECT *  from nhan_vien
-- where ((SELECT substring_index(ho_ten, " ",-1)) like "T%" or (SELECT substring_index(ho_ten, " ",-1)) like "K%" or
-- (SELECT substring_index(ho_ten, " ",-1) like "H%")) and char_length(ho_ten) <= 15;