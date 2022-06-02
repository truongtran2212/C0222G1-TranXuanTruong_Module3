drop database `users`;
CREATE DATABASE `users`;
USE `users`;

create table users (
 id int  primary key NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
`status` bit default 0
);
  
insert into users values(1,'Minh','minh@codegym.vn','Quảng Ngãi',0);
insert into users values(2,'Kante','kante@che.uk','Quảng Bình',0);
insert into users values(3,'Trường','truongtran@gmail.com','Đà Nẵng',0);
insert into users values(4,'Tùng','tungnguyen@gmail.com','Quảng Nam',0);
insert into users values(5,'Khoa','khoale@gmail.com','Nga',0);
insert INTO users (`name`,email,country) values ("Thái","thaitran","Thái Lan");

SELECT * from users;
SELECT * from users where country like "%Quảng%";

