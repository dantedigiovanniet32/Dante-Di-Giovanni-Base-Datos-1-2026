create database CONCESIONARIO;
use CONCESIONARIO;

create table marcas (
id_marca int auto_increment primary key,
nombre varchar(100),
origen varchar(50)
);
insert into marcas (nombre, origen) values
('Volkswagen', 'Alemania'),
('Ferrari', 'Italia'),
('Chevrolet', 'Estados Unidos'),
('Honda', 'Japon'),
('Fiat', 'Italia');

create table modelos (
id_modelo int auto_increment primary key,
nombre varchar(50),
id_marca int,
foreign key (id_marca) references marcas(id_marca)
);
insert into modelos (nombre, id_marca) values
('Suran', 1),
('Cronos', 5),
('SF 90', 2),
('Civic', 4),
('Tracker', 3);

create table clientes (
id_cliente int auto_increment primary key,
dni int(8),
nombre varchar(50),
apellido varchar(50),
direccion varchar(50),
telefono int(10)
);
insert into clientes (dni, nombre, apellido, direccion, telefono) values
(38982122, 'Casilda', 'Cupinni', 'Juan B. Justo 9231', 1183937820),
(45812905, 'Alejandro', 'Garnacho', 'Acevedo 126', 1172850922),
(21812316, 'Nicolas', 'Dominguez', 'Julian Alvarez 7628', 1180806327),
(52870621, 'Simon', 'Patricios', 'Avellaneda 1195', 1110987877),
(33095583, 'Manuel', 'Garrida', 'Gorriti 485', 1120234563);

create table coches (
id_coche int auto_increment primary key,
matricula varchar(7),
id_modelo int,
color int(30),
id_marca int,
id_cliente int,
foreign key (id_modelo) references modelos(id_modelo),
foreign key (id_marca) references marcas(id_marca),
foreign key (id_cliente) references clientes(id_cliente)
);
insert into coches (matricula, id_modelo, color, id_marca, id_cliente) values
('AA981LK', 1, 'Azul', 1, 5),
('AH966KJ', 4, 'Negro', 4, 2), 
('MLU724', 3, 'Rojo', 2, 1),
('AD561OP', 5, 'Blanco', 3, 3),
('M128250', 2, 'Gris', 5, 4);

create table coches_nuevos (
id_coche_nuevo int auto_increment primary key,
unidades int(5),
id_coche int,
foreign key (id_coche) references coches(id_coche)
);
insert into coches_nuevos (unidades, id_coche) values
(12, 1),
(76, 2),
(2, 4);

create table coches_usados (
id_coche_nuevo int auto_increment primary key,
kilometros int(8),
id_coche int,
foreign key (id_coche) references coches(id_coche)
);
insert into coches_usados (kilometros, id_coche) values
(467523, 3),
(1365, 5);

create table mecanicos (
id_mecanico int auto_increment primary key,
dni int(8),
nombre varchar(50),
apellido varchar(50),
fecha_contratacion date,
salario int(15)
);
insert into mecanicos (dni, nombre, apellido, fecha_contratacion, salario) values
(48769234, 'Xiomara', 'Alvarez', '2019-07-01', 654000),
(51628903, 'Gonzalo', 'Venezuela', '2023-06-09', 1270000),
(42982756, 'Ramon', 'Velez', '2026-12-01', 368000),
(39283098, 'Roberto', 'Varchar', '2025-14-23', 783000),
(27176152, 'Julian', 'Castilla', '2012-12-12', 989000);

create table reparaciones (
id_reparacion int auto_increment primary key,
fecha_reparacion date,
horas int,
id_mecanico int,
id_coche int,
foreign key (id_coche) references coches(id_coche),
foreign key (id_mecanico) references mecanicos(id_mecanico)
);
insert into reparaciones (fecha_reparacion, horas, id_mecanico, id_coche) values
('2021-12-07', 2, 5, 1),
('2014-10-11', 17, 1, 2),
('2025-03-28', 45, 3, 4),
('2026-18-05', 11, 4, 3),
('2022-26-01', 5, 2, 5);