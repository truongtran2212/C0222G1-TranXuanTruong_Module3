use quan_ly_ban_hang;

SELECT id, date_order, order_total_price from `order`;

select c.`name` as cutomer_name ,od.id_order,p.`name` as product_name from order_detail od 
inner join `order` o on od.id_order = o.id
inner join customer c on o.id_customer = c.id
inner join product p on od.id_product = p.id;

SELECT c.`name`, c.id from customer c
where c.id NOT in (SELECT o.id_customer from `order` o);

SELECT o.id, o.date_order,sum( od.order_quantity * p.product_price) from order_detail od
inner join `order` as o on od.id_order = o.id
inner join product as p on od.id_product = p.id
GROUP BY od.id_order