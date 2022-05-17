use case_study;
--  Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT *  from nhan_vien 
WHERE (ho_ten LIKE "T%" or ho_ten LIKE "K%" or ho_ten LIKE "H%") and length(15);


-- Điều kiện hiển thị theo tên
SELECT *  from nhan_vien
where ((SELECT substring_index(ho_ten, " ",-1)) like "T%" or (SELECT substring_index(ho_ten, " ",-1)) like "K%" or
(SELECT substring_index(ho_ten, " ",-1) like "H%")) and length(15);

-- Task 3:
SELECT * from khach_hang
 WHERE (dia_chi = "Đà Nẵng" or dia_chi = "Quảng Trị") AND (18 <= (year(now()) - (year(ngay_sinh))) and (year(curdate()) - (year(ngay_sinh))) <= 50);
-- Task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt
--  phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần 
--  đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.


SELECT  kh.ho_ten ,  COUNT(kh.id)  as so_lan_dat_phong , lk.ten_loai_khach from hop_dong as hd
inner join khach_hang as kh on hd.id_khach_hang = kh.id
inner join loai_khach as lk on kh.id_loai_khach = lk.id
where lk.ten_loai_khach = "Diamond"
GROUP BY id_khach_hang
ORDER BY so_lan_dat_phong;

-- Task 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là 
-- từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.id, kh.ho_ten, lk.ten_loai_khach, hd.id, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia)
from hop_dong_chi_tiet hdct
inner join hop_dong as hd on hdct.id_hop_dong =  hd.id
inner join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id
inner join dich_vu as dv on hd.id_dich_vu = dv.id
right join khach_hang as kh on hd.id_khach_hang = kh.id
inner join loai_khach as lk on kh.id_loai_khach = lk.id
GROUP BY kh.ho_ten;
 
-- Task 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.id, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id
WHERE dv.id not in (select hd.id_dich_vu FROM hop_dong hd where quarter(hd.ngay_lam_hop_dong) = 1 and (year(hd.ngay_lam_hop_dong) = 2021));

-- Task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.id, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue,dv.so_nguoi_toi_da, ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong from dich_vu dv
inner join hop_dong hd on dv.id = hd.id_dich_vu
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id
WHERE dv.id not in (select hd.id_dich_vu FROM hop_dong hd where (year(hd.ngay_lam_hop_dong) = 2021) and (year(hd.ngay_lam_hop_dong) <> 2020 ))
 group by dv.ten_dich_vu;
-- Task  8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- Cách 1
SELECT DISTINCT ho_ten from khach_hang;

-- Cách 2
SELECT ho_ten from khach_hang
GROUP BY ho_ten;

-- Cách 3
SELECT ho_ten from khach_hang union SELECT ho_ten from khach_hang;

-- Task 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT month(ngay_lam_hop_dong) as thang_co_hop_dong, COUNT(month(ngay_lam_hop_dong)) as so_lan_dat_trong_thang from hop_dong where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong);

-- Task 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hdct.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc, sum(hdct.so_luong) from hop_dong_chi_tiet hdct
inner join hop_dong as hd on hdct.id_hop_dong = hd.id
inner join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id
group by hdct.id_hop_dong;

-- Task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dvdk.id, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct on dvdk.id = hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id
join khach_hang kh on hd.id_khach_hang = kh.id
join loai_khach lk on kh.id_loai_khach = lk.id
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Vinh" or kh.dia_chi = "Quảng Ngãi")
group by dvdk.id;

-- Task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.id, nv.ho_ten as ten_nhan_vien, kh.ho_ten as ten_khach_hang, kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu, sum(hdct.so_luong) , hd.tien_dat_coc, hd.ngay_lam_hop_dong from hop_dong_chi_tiet hdct
right join hop_dong hd on hdct.id_hop_dong = hd.id
join dich_vu dv on hd.id_dich_vu = dv.id
join khach_hang kh on hd.id_khach_hang = kh.id
join nhan_vien nv on hd.id_nhan_vien = nv.id
where (dv.id in (SELECT id_dich_vu from hop_dong WHERE year(ngay_lam_hop_dong) = 2020 and quarter(ngay_lam_hop_dong) = 4))
and dv.id not in (SELECT id_dich_vu from hop_dong WHERE year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) in (1,2,3,4,5,6))
group by hd.id

