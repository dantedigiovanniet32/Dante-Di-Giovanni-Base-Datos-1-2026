create database TIENDA;
use TIENDA;



create table productos (
id_producto int auto_increment primary key not null,
nombre varchar(100) not null,
descripcion varchar(1000),
precio decimal(10, 2) not null,
stock_disponible int not null
);

insert into productos (nombre, descripcion, precio, stock_disponible) values
('Teclado', 'RGB con swiches rojos', 120000, 15),
('Mouse', 'Inalambrico con 100ms de respuesta', 79999, 30),
('Monitor', '24 pulgadas Full HD 4K frecuencia de 75hz', 160000, 8),
('Auriculares', 'inalambricos con cancelacion de ruido y microfono', 39, 20),
('Cable HDMI', 'De 1 metro mallado', 33000, 50);

create table clientes (
id_cliente int auto_increment primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
correo_electronico varchar(100) not null,
direccion varchar(30)
);
insert into clientes (nombre, apellido, correo_electronico, direccion) values
('Geronimo', 'Rodriguez', 'geronimo.rodriguez7@gmail.com', 'Callao 742'),
('Marta', 'Pronto', 'marta.pronto@gmail.com', 'Pellegrini 123'),
('Juan', 'Bisanz', 'juanbisanz@hotmail.com', 'Ruta 9 KM 40'),
('Analia', 'Enrique', 'analia.enrique1@gmail.com', 'Arenales 89'),
('Luis', 'Argentino', 'luis.argentino@yahoo.com', 'Boulebard Gesell 55');


create table pedidos (
id_pedido int auto_increment primary key,
id_cliente int,
fecha date not null,
estado enum('Pendiente', 'En proceso', 'Enviado', 'Entregado') not null,
foreign key (id_cliente) references clientes(id_cliente)
);
insert into pedidos (id_cliente, fecha, estado) values
(1, '2023-05-21', 'Entregado'),
(2, '2025-01-13', 'Enviado'),
(1, '2026-06-05', 'En proceso'),
(4, '2024-12-11', 'Entregado'),
(5, '2026-08-10', 'Pendiente');



#1
select nombre, precio from productos
where precio > 50;

#2
select clientes.nombre from clientes
inner join pedidos on pedidos.id_cliente = clientes.id_cliente
group by clientes.nombre;


#3
select clientes.nombre, pedidos.fecha from clientes
inner join pedidos on pedidos.id_cliente = clientes.id_cliente
where pedidos.estado = 'Entregado';

#4
select pedidos.estado, clientes.correo_electronico from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente;

#5

select clientes.nombre, pedidos.fecha as fecha_mayor from clientes
inner join pedidos on pedidos.id_cliente = clientes.id_cliente
order by pedidos.fecha desc limit 1;

#6
select clientes.nombre, pedidos.fecha, pedidos.estado from clientes
inner join pedidos on pedidos.id_cliente = clientes.id_cliente
where pedidos.estado = 'Pendiente';


#7
select nombre, precio from productos
order by precio desc limit 1;