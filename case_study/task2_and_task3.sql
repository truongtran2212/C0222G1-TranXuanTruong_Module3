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


SELECT  kh.ho_ten ,  COUNT(kh.ma_khach_hang)  as so_lan_dat_phong , lk.ten_loai_khach from hop_dong as hd
inner join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
inner join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond"
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- Task 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là 
-- từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) AS tong_tien
from khach_hang kh
left join hop_dong as hd on hd.ma_khach_hang =  kh.ma_khach_hang
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
left join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
left join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
GROUP BY kh.ho_ten;
 
-- Task 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu not in (select hd.ma_dich_vu FROM hop_dong hd where quarter(hd.ngay_lam_hop_dong) = 1 and (year(hd.ngay_lam_hop_dong) = 2021));

-- Task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue,dv.so_nguoi_toi_da, ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong from dich_vu dv
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu not in (select hd.ma_dich_vu FROM hop_dong hd where (year(hd.ngay_lam_hop_dong) = 2021) and (year(hd.ngay_lam_hop_dong) <> 2020 ))
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

SELECT hdct.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc, sum(hdct.so_luong) from hop_dong_chi_tiet hdct
inner join hop_dong as hd on hdct.ma_hop_dong = hd.ma_hop_dong
inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_hop_dong;

-- Task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Vinh" or kh.dia_chi = "Quảng Ngãi")
group by dvdk.ma_dich_vu_di_kem;

-- Task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten as ten_nhan_vien, kh.ho_ten as ten_khach_hang, kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu, sum(hdct.so_luong) , hd.tien_dat_coc, hd.ngay_lam_hop_dong from hop_dong_chi_tiet hdct
right join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
where (dv.ma_dich_vu in (SELECT ma_dich_vu from hop_dong WHERE year(ngay_lam_hop_dong) = 2020 and quarter(ngay_lam_hop_dong) = 4))
and dv.ma_dich_vu not in (SELECT ma_dich_vu from hop_dong WHERE year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) in (1,2,3,4,5,6))
group by hd.ma_hop_dong;

-- Task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, sum(hdct.so_luong) as so_lan_su_dung from hop_dong_chi_tiet hdct
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong)  = (SELECT sum(hdct.so_luong) from hop_dong_chi_tiet hdct group by hdct.ma_dich_vu_di_kem order by sum(hdct.so_luong) desc LIMIT 1);
 
-- Task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem,count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung from dich_vu_di_kem dvdk
right join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by hdct.ma_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) = 1;

-- Task 15.Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan, nv.so_dien_thoai, dia_chi, count(nv.ma_nhan_vien) as so_luong_hop_dong, year(hd.ngay_lam_hop_dong) as nam_lam_hop_dong from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2020 and 2021
group by nv.ma_nhan_vien
having so_luong_hop_dong <= 3;

-- Task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

DELETE from nhan_vien nv
 where nv.ma_nhan_vien not in(SELECT hd.ma_nhan_vien from hop_dong hd where year(hd.ngay_lam_hop_dong) between 2019 and 2021);

SELECT ma_nhan_vien from nhan_vien;

-- Task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

-- có chi_phi_thue ở table dich_vu, có giá ở table dich_vu_di_kem, rồi cộng lại phải join hop_dong, join hop_dong_chi_tiet

-- Cách 1: Xài View

CREATE view update_khach_hang as 
select kh.*, sum(dv.chi_phi_thue + dvdk.gia *hdct.so_luong) as so_tien_da_su_dung,lk.ten_loai_khach from hop_dong_chi_tiet hdct 
join hop_dong as hd on hdct.ma_hop_dong =  hd.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
where year(hd.ngay_lam_hop_dong) = 2021
group by kh.ma_khach_hang having so_tien_da_su_dung > 10000000 and lk.ten_loai_khach = "Platinium";

UPDATE khach_hang kh set kh.ma_loai_khach = 1 
where kh.ma_loai_khach in  (select ma_loai_khach from update_khach_hang );

SELECT * from khach_hang;

-- Cách 2: bảng lồng bảng 

UPDATE khach_hang kh set kh.ma_loai_khach = 1 
where kh.ma_loai_khach in (select ma_loai_khach from (select kh.*, sum(dv.chi_phi_thue + dvdk.gia *hdct.so_luong) as so_tien_da_su_dung,lk.ten_loai_khach from hop_dong_chi_tiet hdct 
join hop_dong as hd on hdct.ma_hop_dong =  hd.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
where year(hd.ngay_lam_hop_dong) = 2021
group by kh.ma_khach_hang having so_tien_da_su_dung > 10000000 and lk.ten_loai_khach = "Platinium") as ma);

-- Task 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- Xóa theo on delete cascade
delete from khach_hang kh
where kh.ma_khach_hang in (select ma_khach_hang from  (select kh.* from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021) as `new`);

CREATE view danh_sach_khach_hang_nam_2021 as 
select hd.ma_khach_hang from hop_dong hd
where year(hd.ngay_lam_hop_dong) < 2021;

-- Task 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- CREATE view change_price as
-- SELECT dvdk.ma, dvdk.ten_dich_vu_di_kem,hdct.so_luong,dvdk.gia from hop_dong_chi_tiet hdct
-- join hop_dong hd on hdct.ma_hop_dong = hd.ma
-- join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma
-- where year(hd.ngay_lam_hop_dong) = 2020 and hdct.so_luong > 10;

UPDATE dich_vu_di_kem  set gia = gia * 2
where gia in (SELECT gia from (SELECT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem,hdct.so_luong,dvdk.gia from hop_dong_chi_tiet hdct
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2020 and hdct.so_luong > 10) as gia);

-- Task 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm ma (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select ma_nhan_vien,ho_ten,ngay_sinh, email,so_dien_thoai,ngay_sinh, dia_chi from nhan_vien
union all
select ma_khach_hang,ho_ten,ngay_sinh, email,so_dien_thoai,ngay_sinh, dia_chi from khach_hang;