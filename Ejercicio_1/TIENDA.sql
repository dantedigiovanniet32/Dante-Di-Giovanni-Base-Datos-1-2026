create database TIENDA;
use TIENDA;

Create table Vendedores (
id_vendedor int auto_increment primary key, 
nombre varchar(50), 
apellido varchar (50)
);
insert into Vendedores (nombre, apellido) values 
('Ana', 'Lopez'), 
('Carlos', 'Ruiz'), 
('Sofia', 'Perez');

create table Productos (
id_producto int auto_increment primary key, 
prenda varchar(50), 
precio decimal(10,2)
);
insert into Productos (prenda, precio) values 
('Camisa', 25000), 
('Jean', 35000), 
('Remera', 12000);

create table Facturas (
id_factura int primary key, 
tipo varchar(1)
);
insert into Facturas values 
(1, 'A'), 
(2, 'B'), 
(3, 'C');

create table Repartidores (
id_repartidor int auto_increment primary key, 
nombre varchar(50));
insert into Repartidores (nombre) values 
('Juan Envios'), 
('Libertad Express'), 
('Logistica Isidro Casanova');

create table Pedidos (
id_pedido int auto_increment primary key,
estado varchar(20),
id_vendedor int,
id_producto int,
id_factura int,
id_repartidor int,
foreign key (id_vendedor) references Vendedores(id_vendedor),
foreign key (id_producto) references Productos(id_producto),
foreign key (id_factura) references Facturas(id_factura),
foreign key (id_repartidor) references Repartidores(id_repartidor)
);
insert into Pedidos (estado, id_vendedor, id_producto, id_factura, id_repartidor) values 
('Entregado', 1, 1, 1, 1),
('En Camino', 2, 3, 2, 2),
('Pendiente', 1, 2, 3, 3);


Select prenda, precio from productos;

SELECT pedidos.id_pedido, vendedores.nombre, vendedores.apellido
FROM Pedidos, Vendedores
WHERE pedidos.id_vendedor = vendedores.id_vendedor;