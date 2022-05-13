create DATABASE quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer (
id int PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
age INT
);


CREATE table `order` (
id int PRIMARY KEY AUTO_INCREMENT,
id_customer int,
date_order date,
order_total_price double,

foreign key (id_customer) REFERENCES customer (id)
);

create table product (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
product_price double
);

create table order_detail (
id_order int,
id_product int,
order_quantity int,
PRIMARY KEY (id_order, id_product),

foreign key (id_order) REFERENCES `order` (id),
foreign key (id_product) REFERENCES product (id)
);

