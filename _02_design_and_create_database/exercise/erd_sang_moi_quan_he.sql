drop DATABASE chuyen_erd_sang_mo_hinh_quan_he;
create DATABASE if not exists chuyen_erd_sang_mo_hinh_quan_he;
use chuyen_erd_sang_mo_hinh_quan_he;



create table phieu_xuat (
id_phieu_xuat int PRIMARY KEY AUTO_INCREMENT not null,
ngay_xuat date not null
);


create table vat_tu (
id_vat_tu int PRIMARY KEY AUTO_INCREMENT not null,
ten_vat_tu varchar(50) not null
);

create table phieu_xuat_vat_tu (

id_vat_tu int,
id_phieu_xuat int,

PRIMARY KEY (id_vat_tu, id_phieu_xuat),

don_gia_xuat double,
so_luong_xuat int,

foreign key	(id_phieu_xuat) REFERENCES phieu_xuat (id_phieu_xuat),
foreign key	(id_vat_tu) REFERENCES vat_tu (id_vat_tu)

);



create table phieu_nhap (
id_phieu_nhap int PRIMARY KEY AUTO_INCREMENT not null,
ngay_nhap date

);


create table phieu_nhap_vat_tu (
id_phieu_nhap int,
id_vat_tu int,

PRIMARY KEY (id_phieu_nhap, id_vat_tu),

so_luong_nhap int,
don_gia_nhap double,

foreign key	(id_phieu_nhap) REFERENCES phieu_nhap (id_phieu_nhap),
foreign key	(id_vat_tu) REFERENCES vat_tu (id_vat_tu)
);


create table nha_cc (
id int PRIMARY KEY AUTO_INCREMENT not null,
ten_nha_cung_cap varchar(50),
dia_chi varchar(50)
);

INSERT into nha_cc values (1,"coca", "avc"); 


create table don_dh (
id_don_hang int PRIMARY KEY AUTO_INCREMENT not null,
ngay_dat_hang DATE,
id_nha_cc int,

FOREIGN KEY (id_nha_cc) REFERENCES nha_cc(id)
);

CREATE table don_dat_hang_cua_vat_tu (
id_vat_tu int,
id_don_hang int,

PRIMARY KEY (id_vat_tu, id_don_hang),

FOREIGN KEY (id_vat_tu) REFERENCES vat_tu (id_vat_tu),
FOREIGN KEY (id_don_hang) REFERENCES don_dh (id_don_hang)

);



create TABLE so_dien_thoai (
id_so_dien_thoai int PRIMARY KEY AUTO_INCREMENT NOT NULL,
so_dien_thoai VARCHAR(20),
id_nha_cung_cap int,

FOREIGN KEY  (id_nha_cung_cap) REFERENCES nha_cc (id)
);

