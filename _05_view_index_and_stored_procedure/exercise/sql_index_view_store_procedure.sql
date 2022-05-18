drop database demo;
CREATE database demo;
use demo;


CREATE table products (
id int PRIMARY key AUTO_INCREMENT,
product_code varchar(20),
product_name varchar(40),
product_price double,
product_mount int,
product_description varchar(20),
product_status varchar(20)
);

insert into products (product_code,product_name,product_price,product_mount,product_description,product_status) 
values ("123","SamSung", 20000.0,1,"99%","ok"),
("456","Apple", 40000.0,1,"100%","ok"),
("789","Oppo", 60000.0,1,"100%","ok");

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

CREATE unique index index_products on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_name_price on products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_name = "SamSung";

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, 
CREATE view v_product as
select product_code, product_name, product_price, product_status from products; 

-- productStatus từ bảng products.
SELECT * from v_product;
update v_product set product_name = "Nokia"
where product_code = "123";

-- Tiến hành sửa đổi view
SELECT * from products;

-- Tiến hành xoá view
drop view v_product;



-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
CREATE PROCEDURE sp_product()
begin
select * from products;
end //

delimiter ;

call sp_product();

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
CREATE PROCEDURE sp_add_new_product( 
product_code varchar(20),
product_name varchar(40),
product_price double,
product_mount int,
product_description varchar(20),
product_status varchar(20)
)
begin
insert into products (product_code,product_name,product_price,product_mount,product_description,product_status) 
values (product_code,product_name,product_price,product_mount,product_description,product_status);
end //

delimiter ;

call sp_add_new_product("111","Huawei", 22222.0,1,"50%","not yet");
call sp_add_new_product("121","BlackBerry", 44444.0,1,"70%","ok");
SELECT * from products


-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
CREATE PROCEDURE sp_update_product()
begin
UPDATE products set product_name = "Motorola" where id = 5;
end //

delimiter ;

call sp_update_product();
SELECT * from products

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
CREATE PROCEDURE sp_delete_product()
begin
DELETE from products where id = 1;
end //

delimiter ;

call sp_delete_product();
SELECT * from products