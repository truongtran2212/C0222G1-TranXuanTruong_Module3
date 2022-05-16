create DATABASE quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer (
id int PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
age INT
);

INSERT into customer (`name`, age) values ("Minh Quan",10);
INSERT into customer (`name`, age) values ("Ngoc Oanh",20);
INSERT into customer (`name`, age) values ("Hong Ha",50);

select * from customer;

CREATE table `order` (
id int PRIMARY KEY AUTO_INCREMENT,
id_customer int,
date_order date,
order_total_price double,

foreign key (id_customer) REFERENCES customer (id)
);
insert into `order` (id_customer, date_order) values (1,"2006-03-21");
insert into `order` (id_customer, date_order) values (2,"2006-03-23");
insert into `order` (id_customer, date_order) values (1,"2006-03-16");

SELECT * from `order`;

create table product (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
product_price double
);

INSERT into product (`name`, product_price) values ("May Giat",3);
INSERT into product (`name`, product_price) values ("Tu Lanh",5);
INSERT into product (`name`, product_price) values ("Dieu Hoa",7);
INSERT into product (`name`, product_price) values ("Quat",1);
INSERT into product (`name`, product_price) values ("Bep Dien",2);

select * from product;

create table order_detail (
id_order int,
id_product int,
order_quantity int,
PRIMARY KEY (id_order, id_product),

foreign key (id_order) REFERENCES `order` (id),
foreign key (id_product) REFERENCES product (id)
);

insert into order_detail (id_order,id_product,order_quantity) values (1,1,3);
insert into order_detail (id_order,id_product,order_quantity) values (1,3,7);
insert into order_detail (id_order,id_product,order_quantity) values (1,4,2);
insert into order_detail (id_order,id_product,order_quantity) values (2,1,1);
insert into order_detail (id_order,id_product,order_quantity) values (3,1,8);
insert into order_detail (id_order,id_product,order_quantity) values (2,5,4);
insert into order_detail (id_order,id_product,order_quantity) values (2,3,3);

select * from order_detail;


