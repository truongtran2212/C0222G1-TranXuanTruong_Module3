drop database furama;
create database if not exists furama ;
use furama;

create table `position` (
position_id int AUTO_INCREMENT PRIMARY key,
position_name varchar(45)
);


create table education_degree (
education_degree_id int AUTO_INCREMENT PRIMARY key,
education_degree_name varchar (50)
);

CREATE table division (
division_id int AUTO_INCREMENT PRIMARY key,
division_name varchar (45)
);


create table `user`(
username varchar (255) PRIMARY key,
`password` varchar(255) 
);


create table `role` (
role_id int PRIMARY key AUTO_INCREMENT,
role_name varchar(255)
);

create table user_role (
role_id int ,
username varchar (255),

foreign key (role_id) REFERENCES `role`(role_id),
foreign key (username) REFERENCES `user` (username)
);



create table employee (
employee_id int AUTO_INCREMENT PRIMARY key,
employee_name varchar(45) not null,
employee_birthday DATE not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45) not null,
employee_email varchar(45),
employee_address varchar(45),

position_id int not null,
education_degree_id int not null,
division_id int not null,
username varchar (255),


`status` bit DEFAULT 0,

foreign key (position_id) REFERENCES `position` (position_id),
foreign key (education_degree_id) REFERENCES education_degree (education_degree_id),
foreign key (division_id) REFERENCES division (division_id),
foreign key (username) REFERENCES `user` (username)
);

CREATE table customer_type (
customer_type_id int AUTO_INCREMENT PRIMARY key,
customer_type_name varchar(45)
);

create table customer (
customer_id varchar(45) PRIMARY key,
customer_name varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar(45) not null,
customer_phone varchar(45) not null,
customer_email varchar(45),
customer_address varchar(45),
customer_type_id int not null ,
`status` bit DEFAULT 0,

foreign key (customer_type_id) REFERENCES customer_type (customer_type_id)


);

create table service_type(
service_type_id int AUTO_INCREMENT PRIMARY key,
service_type_name varchar(45)
);

create table rent_type(
rent_type_id int AUTO_INCREMENT PRIMARY key,
rent_type_name varchar(45),
rent_type_cost double
);



CREATE table service (
service_id varchar(45)  PRIMARY key,
service_name varchar(45) not null,
service_area int,
service_cost double not null,
service_max_people int,
standard_room varchar(45),
description_other_convenience varchar(255),
pool_area double,
number_of_floors int,
rent_type_id int not null,
service_type_id int not null,
`status` bit DEFAULT 0,
foreign key (rent_type_id) REFERENCES rent_type (rent_type_id),
foreign key (service_type_id) REFERENCES service_type (service_type_id)
);

create table contract (
contract_id int AUTO_INCREMENT PRIMARY key,
contract_start_day datetime not null,
contract_end_day datetime not null,
contract_deposit double not null,
contract_total_money double not null,

employee_id int not null,
customer_id varchar(45) not null,
service_id varchar(45) not null,

foreign key (employee_id) REFERENCES employee (employee_id),
foreign key (customer_id) REFERENCES customer (customer_id),
foreign key (service_id) REFERENCES service (service_id)
);


create table attach_service (
attach_service_id int AUTO_INCREMENT PRIMARY key,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit varchar(45) not null,
attach_service_status varchar(45)
);


create table contract_detail (
contract_detail_id int AUTO_INCREMENT PRIMARY key,
contract_id int,
attach_service_id int,
quantity int,

foreign key (contract_id) REFERENCES contract (contract_id),
foreign key (attach_service_id) REFERENCES attach_service (attach_service_id)
);
