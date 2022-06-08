drop  database employee;
create database employee;
use employee;

create table `position` (
id int AUTO_INCREMENT PRIMARY key,
`name` varchar(45)
);


create table education_degree (
id int AUTO_INCREMENT PRIMARY key,
`name` varchar (50)
);

CREATE table division (
id int AUTO_INCREMENT PRIMARY key,
`name` varchar (45)
);

create table `user`(
`name` varchar (255) PRIMARY key,
`password` varchar(255) 
);


create table `role` (
id int PRIMARY key AUTO_INCREMENT,
`name` varchar(255)
);

create table user_role (
id int ,
username varchar (255),
PRIMARY KEY (id, username),

foreign key (id) REFERENCES `role`(id),
foreign key (username) REFERENCES `user` (`name`)
);


create table employee (
id int AUTO_INCREMENT PRIMARY key,
`name` varchar(45) not null,
birthday DATE not null,
id_card varchar(45) not null,
salary double not null,
phone varchar(45) not null,
email varchar(45),
address varchar(45),

position_id int not null,
education_degree_id int not null,
division_id int not null,
username varchar (255),

`status` bit DEFAULT 0,

foreign key (position_id) REFERENCES `position` (id),
foreign key (education_degree_id) REFERENCES education_degree (id),
foreign key (division_id) REFERENCES division (id),
foreign key (username) REFERENCES `user` (`name`)
);



insert into position
(`name`)
values ('Quản lý'),
       ('Nhân viên');
       
       
insert into education_degree
(`name`)
values ('Trung Cấp'),
       ('Cao Đẳng'),
       ('Đại Học'),
       ('Sau Đại Học');
       
       
insert into division
(`name`)
values ('Sale-Marketing'),
       ('Hành chính'),
       ('Phục vụ'),
       ('Quản lý');

INSERT into `role` (`name`) 
values("admin"),
       ("user");
        
        INSERT into `user` 
values
 ("annguyen@furama.com","annguyen123"),
 ("binhlv@furama.com","binhlv123"),
 ("thiyen@furama.com","thiyen123"),
 ("toan0404@furama.com","toan0404"),
 ("phatphat@furama.com","phatphat123"),
 ("annghi20@furama.com","annghi20"),
 ("nhh0101@furama.com","nhh0101"),
 ("donghanguyen@furama.com","donghanguyen123"),
 ("hoangtong@furama.com","hoangtong123"),
 ("nguyencongdao12@furama.com","nguyencongdao123");
       
       
       
 insert into user_role 
 values (1,"annguyen@furama.com"),
 (2,"binhlv@furama.com"),
  (1,"thiyen@furama.com"),
 (1,"toan0404@furama.com"),
 (2,"phatphat@furama.com"),
  (2,"annghi20@furama.com"),
 (2,"nhh0101@furama.com"),
 (1,"donghanguyen@furama.com"),
 (1,"hoangtong@furama.com"),
 (2,"nguyencongdao12@furama.com");
 
 
insert into employee
(`name`, birthday, id_card, salary,phone, email,address, position_id, education_degree_id, division_id,username)
values ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com',
        '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1,"annguyen@furama.com"),
       ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1,
        2, 2,"binhlv@furama.com"),
       ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com',
        'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2,"thiyen@furama.com"),
       ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com',
        '77 Hoàng Diệu, Quảng Trị', 1, 4, 4,"toan0404@furama.com"),
       ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com',
        '43 Yên Bái, Đà Nẵng', 2, 1, 1,"phatphat@furama.com"),
       ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com',
        '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3,"annghi20@furama.com"),
       ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com',
        '4 Nguyễn Chí Thanh, Huế', 2, 3, 2,"nhh0101@furama.com"),
       ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',
        '111 Hùng Vương, Hà Nội', 2, 4, 4,"donghanguyen@furama.com"),
       ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng',
        2, 4, 4,"hoangtong@furama.com"),
       ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com',
        '6 Hoà Khánh, Đồng Nai', 2, 3, 2,"nguyencongdao12@furama.com");

insert  into employee (`name`, birthday, id_card, salary, phone, email, address, position_id, education_degree_id, division_id, username)
values (?,?,?,?,?,?,?,?,?,?,?);