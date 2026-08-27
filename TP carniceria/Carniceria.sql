create database carniceria;
use carniceria;



create table Carniceros(
id_carnicero int primary key auto_increment,
Nombre varchar(50),
Apellido varchar(50),
DNI varchar(20)
);
insert into Carniceros(Nombre, Apellido, DNI)values
('Martin', 'Gimenez', '35123456'),
('Petroleo', 'Ferguson', '38765432'),
('Franco', 'Languido', '40112233');



create table Clientes(
id_cliente int primary key auto_increment,
Nombre varchar(50),
Telefono varchar(20),
Medio_pago varchar(50)
);
insert into Clientes(Nombre, Telefono, Medio_pago) values
('Bergoglio', '1123456789', 'Efectivo'),
('Gaetano', '1198765432', 'Tarjeta de credito'),
('Pipa', '1155667788', 'Transferencia');



create table Pedidos(
id_pedido int primary key auto_increment,
id_cliente int,
id_carnicero int,
Fecha date,
Precio_total decimal(10,2),
foreign key(id_cliente) references Clientes(id_cliente),
foreign key(id_carnicero) references Carniceros(id_carnicero)
);

insert into Pedidos (id_cliente, id_carnicero, Fecha, Precio_total) values
(1, 1, '2026-08-25', 4500),
(2, 1, '2026-08-25', 3260),
(3, 2, '2026-08-25', 31000);



create table Detalles_pedidos(
id_detalle int primary key auto_increment,
id_pedido int,
Corte_carne varchar(50),
Cantidad int,
Precio_unitario decimal(10,2),
foreign key(id_pedido)references Pedidos(id_pedido)
);

insert into Detalles_pedidos(id_pedido, Corte_carne, Cantidad, Precio_unitario) values

(1, 'Asado', 2, 2250),
(2, 'Higado', 2, 1630),
(3, 'Tapa de nalga', 1, 31000);




#a

select corte_carne
from detalles_pedidos
group by corte_carne
having sum(cantidad) = (
select max(total)
from (
select sum(cantidad) as total
from detalles_pedidos
group by corte_carne ) as ventas
);


#b

select nombre
from clientes
where id_cliente = (
select id_cliente
from pedidos
group by id_cliente
having count(*) = (
select max(total)
from (select count(*) as total from pedidos
group by id_cliente ) as compras )
);

   #c
   
select nombre
from carniceros
where id_carnicero = (
select id_carnicero
from pedidos
group by id_carnicero
having count(distinct id_cliente) = (
select max(total)
from ( select count(distinct id_cliente) as total
from pedidos
group by id_carnicero ) as clientes ) );



#d

select 

(select nombre from clientes where id_cliente = p.id_cliente) as cliente,
(select corte_carne from detalles_pedidos where id_pedido = p.id_pedido) as contenido,
(select nombre from carniceros where id_carnicero = p.id_carnicero) as carnicero

from pedidos p

where precio_total = (
select max(precio_total)
from pedidos );



#e


select corte_carne, sum(cantidad) as ventas from detalles_pedidos

where corte_carne in 
(
select corte_carne
from detalles_pedidos)

group by corte_carne;



