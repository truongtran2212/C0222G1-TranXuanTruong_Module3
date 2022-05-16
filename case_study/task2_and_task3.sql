use case_study;
-- Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT *  from nhan_vien 
WHERE (ho_ten LIKE "T%" or ho_ten LIKE "K%" or ho_ten LIKE "H%") and length(15);


-- Điều kiện hiển thị theo tên
SELECT *  from nhan_vien
where ((SELECT substring_index(ho_ten, " ",-1)) like "T%" or (SELECT substring_index(ho_ten, " ",-1)) like "K%" or
(SELECT substring_index(ho_ten, " ",-1) like "H%")) and length(15);

-- Task 3:
SELECT * from khach_hang
 WHERE (dia_chi = "Đà Nẵng" or dia_chi = "Quảng Trị") AND (18 <= (year(curdate()) - (year(ngay_sinh))) and (year(curdate()) - (year(ngay_sinh))) <= 50);

-- Task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt
--  phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần 
--  đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT * from khach_hang ;
SELECT * from hop_dong;
SELECT * from loai_khach;

SELECT  kh.ho_ten ,  COUNT(kh.id)  as so_lan_dat_phong , lk.ten_loai_khach from hop_dong as hd
inner join khach_hang as kh on hd.id_khach_hang = kh.id
inner join loai_khach as lk on kh.id_loai_khach = lk.id
where lk.ten_loai_khach = "Diamond"
GROUP BY id_khach_hang ORDER BY so_lan_dat_phong;

-- Task 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là 
-- từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.id, kh.ho_ten, lk.ten_loai_khach, hd.id, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia)
from hop_dong_chi_tiet hdct
inner join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id
inner join hop_dong as hd on hdct.id_hop_dong =  hd.id
inner join dich_vu as dv on hd.id_dich_vu = dv.id
right join khach_hang as kh on hd.id_khach_hang = kh.id
inner join loai_khach as lk on kh.id_loai_khach = lk.id

GROUP BY kh.ho_ten;
 
-- Task 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.id, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id
WHERE dv.id not in (select hd.id_dich_vu FROM hop_dong hd where quarter(hd.ngay_lam_hop_dong) = 1);


select * from hop_dong


