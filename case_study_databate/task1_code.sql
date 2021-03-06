drop database IF EXISTS case_study;
create DATABASE case_study;
use case_study;

create TABLE vi_tri(
ma_vi_tri int PRIMARY KEY AUTO_INCREMENT,
ten_vi_tri varchar(50)
);

-- insert into vi_tri (ten_vi_tri) values ("Lễ tân");
-- insert into vi_tri (ten_vi_tri) values ("Phục vụ");
-- insert into vi_tri (ten_vi_tri) values ("Chuyên viên");
-- insert into vi_tri (ten_vi_tri) values ("Giám sát");
-- insert into vi_tri (ten_vi_tri) values ("Quản lý");
-- insert into vi_tri (ten_vi_tri) values ("Giám đốc");

-- SELECT * from vi_tri;

create TABLE trinh_do(
ma_trinh_do int primary key AUTO_INCREMENT,
ten_trinh_do VARCHAR(50)
);

-- INSERT Into trinh_do (ten_trinh_do) values ("Trung cấp");
-- INSERT Into trinh_do (ten_trinh_do) values ("Cao đẳng");
-- INSERT Into trinh_do (ten_trinh_do) values ("Đại học");
-- INSERT Into trinh_do (ten_trinh_do) values ("Sau đại học");

-- SELECT * from trinh_do;

create TABLE bo_phan(
ma_bo_phan int primary key AUTO_INCREMENT,
ten_bo_phan varchar(50)
);
-- insert into bo_phan (ten_bo_phan) values ("Sale-Marketing");
-- insert into bo_phan (ten_bo_phan) values ("Hành chính");
-- insert into bo_phan (ten_bo_phan) values ("Phục vụ");
-- insert into bo_phan (ten_bo_phan) values ("Quản lý");

-- SELECT * from bo_phan;

create TABLE nhan_vien(

ma_nhan_vien int PRIMARY key AUTO_INCREMENT,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),

ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,

FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri (ma_vi_tri),
FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do (ma_trinh_do),
FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan (ma_bo_phan)
);

-- insert into nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) 
-- values ("Trần Xuân Trường","1998-12-22","123123123",60000000.0,"0934777777","truongtran221298","123 Trần Phú",3,1,2);

-- insert into nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) 
-- values ("Hồ Thị Yến","2000-10-15","11111111",560000000.0,"09341111111","yen","123 Thái Phiên",1,1,1);

-- insert into nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
--  values ("Tòng Hoang","1995-01-04","222222",780000000.0,"044448885","hoang","05 Nguyễn Tất Thành",2,2,2);
--  
-- insert into nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
--  values ("Nha Khoa","1999-05-20","33333",777777777,"01234566","khoa","117 Thanh Long",3,3,3);


-- SELECT * from nhan_vien;



create TABLE loai_khach(
ma_loai_khach int PRIMARY KEY AUTO_INCREMENT,
ten_loai_khach varchar(45)
);

-- INSERT into loai_khach (ten_loai_khach) values ("Diamond");
-- INSERT into loai_khach (ten_loai_khach) values ("Platinum");
-- INSERT into loai_khach (ten_loai_khach) values ("Gold");
-- INSERT into loai_khach (ten_loai_khach) values ("Silver");
-- INSERT into loai_khach (ten_loai_khach) values ("Member");

-- select * from loai_khach;

create TABLE khach_hang(
ma_khach_hang int PRIMARY key AUTO_INCREMENT,
ma_loai_khach int,
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach (ma_loai_khach),

ho_ten VARCHAR(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not NULL,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

-- INSERT into khach_hang (ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) 
-- values (2,"Trần Văn Tùng","1995-01-01",0,"123123123","000000001","tung","Đà Nẵng");

-- INSERT into khach_hang (ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
--  values (1,"Nguyễn Văn Thái","1999-04-12",0,"2222222","000022222","thai","Quảng Trị");
--  
-- INSERT into khach_hang (ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
--  values (1,"Đặng Văn Thiện","2003-12-01",0,"1111111","5555500001","thien","Huê");
--  
-- INSERT into khach_hang (ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
--  values (2,"Nguyễn Ngọc Nhi","2008-01-12",1,"5555555","456456","nhi","Đà Nẵng");
--  
--  INSERT into khach_hang (ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
--  values (3,"Nguyễn Ngọc Nhi","2000-01-12",1,"5555555","456456","nhi","Sài Gòn");
--  
--  SELECT * from khach_hang;



create TABLE dich_vu_di_kem(
ma_dich_vu_di_kem int PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

-- insert into dich_vu_di_kem (ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("massage",2000000,"X8","ok");
-- insert into dich_vu_di_kem (ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("nước uống",10000,"Coca","ok");
-- insert into dich_vu_di_kem (ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("karaoke",300000,"Hawaii","ok");
-- insert into dich_vu_di_kem (ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("thức ăn",500000,"resort","ok");

-- select * from dich_vu_di_kem;

create TABLE kieu_thue(
ma_kieu_thue int primary key AUTO_INCREMENT,
ten_kieu_thue varchar(45)
);


-- insert into kieu_thue (ten_kieu_thue) values ("Thuê theo năm");
-- insert into kieu_thue (ten_kieu_thue) values ("Thuê theo tháng");
-- insert into kieu_thue (ten_kieu_thue) values ("Thuê theo ngày");
-- insert into kieu_thue (ten_kieu_thue) values ("Thuê theo giờ");

-- SELECT * from kieu_thue;

create TABLE loai_dich_vu(
ma_loai_dich_vu int primary key AUTO_INCREMENT,
ten_loai_dich_vu varchar(45)
);

-- insert into loai_dich_vu (ten_loai_dich_vu) values ("Villa");
-- insert into loai_dich_vu (ten_loai_dich_vu) values ("House");
-- insert into loai_dich_vu (ten_loai_dich_vu) values ("Room");

-- SELECT * from loai_dich_vu;

create TABLE dich_vu(
ma_dich_vu int PRIMARY key AUTO_INCREMENT,
ma_kieu_thue int,
ma_loai_dich_vu int,

ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,

FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue (ma_kieu_thue),
FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

-- insert into dich_vu (ma_kieu_thue,ma_loai_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang) 
-- values (1,1,"Villa",200,400000.0,10,"VIP","view biển",50.0,3);

-- insert into dich_vu (ma_kieu_thue,ma_loai_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang) 
-- values (2,2,"House",100,200000.0,5,"Normal","có sân vườn",null,2);

-- insert into dich_vu (ma_kieu_thue,ma_loai_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang) 
-- values (3,3,"Room",50,1000000.0,2,"Double","có nước free",null,null);

-- SELECT * from dich_vu;

create TABLE hop_dong(
ma_hop_dong int primary key AUTO_INCREMENT,
ngay_lam_hop_dong DATETIME not null,
ngay_ket_thuc DATETIME not null,
tien_dat_coc double not null,

ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,

FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien (ma_nhan_vien),
FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang) on delete set null,
FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu (ma_dich_vu)

);

-- INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) 
-- values ("2021-01-12","2021-05-14",500000.0,1,2,1);

-- INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
--  values ("2021-05-17","2021-05-20",100000.0,2,2,2);
--  
-- INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) 
-- values ("2020-02-03","2021-05-06",50000.0,3,3,3);

-- INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
--  values ("2021-07-20","2021-07-25",6000000.0,2,2,2);
--  
--  INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
--  values ("2020-05-20","2020-05-25",22222.0,2,2,1);
--  
--  INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
--  values ("2020-10-20","2020-12-25",11111.0,2,4,2);

--  INSERT into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
--  values ("2021-01-25","2020-05-25",11111.0,2,4,2);

-- select * from hop_dong;

create TABLE hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int PRIMARY key AUTO_INCREMENT,
so_luong int not null,
ma_hop_dong int,
ma_dich_vu_di_kem int,

FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong (ma_hop_dong) on delete set null,
FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)

);
-- INSERT into hop_dong_chi_tiet (so_luong,ma_hop_dong,ma_dich_vu_di_kem) values (1,1,1);
-- INSERT into hop_dong_chi_tiet (so_luong,ma_hop_dong,ma_dich_vu_di_kem) values (2,2,2);
-- INSERT into hop_dong_chi_tiet (so_luong,ma_hop_dong,ma_dich_vu_di_kem) values (3,3,3);
-- INSERT into hop_dong_chi_tiet (so_luong,ma_hop_dong,ma_dich_vu_di_kem) values (3,2,2);
-- INSERT into hop_dong_chi_tiet (so_luong,ma_hop_dong,ma_dich_vu_di_kem) values (2,6,1);


-- SELECT * from hop_dong_chi_tiet;

