create DATABASE case_study;
use case_study;

create TABLE vi_tri(
id int PRIMARY KEY,
ten_vi_tri varchar(50)
);

create TABLE trinh_do(
id int primary key,
ten_trinh_do VARCHAR(50)
);

create TABLE bo_phan(

id int primary key,
ten_bo_phan varchar(50)
);

create TABLE nhan_vien(

id int PRIMARY key,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),

id_vi_tri int,
id_trinh_do int,
id_bo_phan int,

FOREIGN KEY (id_vi_tri) REFERENCES vi_tri (id),
FOREIGN KEY (id_trinh_do) REFERENCES trinh_do (id),
FOREIGN KEY (id_bo_phan) REFERENCES bo_phan (id)
);

create TABLE loai_khach(
id int PRIMARY KEY,
ten_khach_hang varchar(45)
);

create TABLE khach_hang(

id int PRIMARY key,

id_khach_hang int,
FOREIGN KEY (id_khach_hang) REFERENCES loai_khach (id),

ho_ten VARCHAR(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not NULL,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create TABLE dich_vu_di_kem(
id int PRIMARY KEY,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

create TABLE kieu_thue(
id int primary key,
ten_kieu_thue varchar(45)
);

create TABLE loai_dich_vu(
id int primary key,
ten_loai_dich_vu varchar(45)
);

create TABLE dich_vu(
id int PRIMARY key,
id_kieu_thue int,
id_loai_dich_vu int,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,

FOREIGN KEY (id_kieu_thue) REFERENCES kieu_thue (id),
FOREIGN KEY (id_loai_dich_vu) REFERENCES loai_dich_vu (id)
);

create TABLE hop_dong(
id int primary key,
ngay_lam_hop_dong DATETIME not null,
ngay_ket_thuc DATETIME not null,
tien_dat_coc double not null,

id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,

FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien (id),
FOREIGN KEY (id_khach_hang) REFERENCES khach_hang (id),
FOREIGN KEY (id_dich_vu) REFERENCES dich_vu (id)
);

create TABLE hop_dong_chi_tiet(
id int PRIMARY key,
so_luong int not null,

id_hop_dong int,
id_dich_vu_di_kem int,

FOREIGN KEY (id_hop_dong) REFERENCES hop_dong (id),
FOREIGN KEY (id_dich_vu_di_kem) REFERENCES dich_vu_di_kem (id)

);

