create database BIBLIOTECA;
use BIBLIOTECA;

create table autores (
id_autor int auto_increment primary key,
nombre varchar(50) not null,
apellido varchar(50) not null
);
insert into autores (nombre, apellido) values
('Luis', 'Borges'),
('Julio', 'Cortazar'),
('Ernesto', 'Sabato'),
('Silvina', 'Ocampo'),
('Ricardo', 'Piglia');

create table editoriales (
id_editorial int auto_increment primary key,
nombre varchar(50)
);
insert into editoriales (nombre) values
('El margen'), ('El aleph'), ('De las tres lagunas'), ('Patria grande'), ('Alfaguara');

create table libros (
id_libro int auto_increment primary key,
titulo varchar(50),
isbn int(13),
id_editorial int,
numero_pagina int(4),
foreign key (id_editorial) references editoriales(id_editorial)
);
insert into libros (titulo, isbn, id_editorial, numero_pagina) values
('Ficciones', 2584673189568, 1, 224), #borges
('Casa tomada', 9845681289543, 1, 7), #cortazar
('Labyrinths', 8392837381921, 2, 288), #borges
('La furia', 92018568591421, 3, 328), #ocampo
('Plata quemada', 92878013752712, 5, 176); #piglia

create table autores_libros (
id_autor_libro int auto_increment primary key,
id_autor int,
id_libro int,
foreign key (id_autor) references autores(id_autor),
foreign key (id_libro) references libros(id_libro)
);
insert into autores_libros (id_autor, id_libro) values
(1, 1), (2,2), (1,3), (4, 4), (5, 5);


create table ejemplares (
id_ejemplar int auto_increment primary key,
localizacion varchar(50),
id_libro int,
foreign key (id_libro) references libros(id_libro)
);
insert into ejemplares (localizacion, id_libro) values
('A1', 1), ('B4', 2), ('N7', 3), ('K9', 4), ('E3', 5);

create table usuarios (
id_usuario int auto_increment primary key,
nombre varchar(50),
direccion varchar(50),
telefono int(10)
);
insert into usuarios (nombre, direccion, telefono) values
('Juan', 'Arenales 981', 1198277382),
('Choel', 'Federico Lacroze 1456', 1190237811),
('Paris', 'Uruguay 2387', 1129782319),
('Raul', 'Carlos Pellegrini 254', 1198982343),
('Francisco', 'Canning 178', 1189088080);

create table prestamos (
id_prestamo int auto_increment primary key,
fecha_prestamo date,
fecha_devolucion date,
id_ejemplar int,
id_usuario int,
foreign key (id_ejemplar) references ejemplares(id_ejemplar),
foreign key (id_usuario) references usuarios(id_usuario)
);
insert into prestamos (fecha_prestamo, fecha_devolucion, id_ejemplar, id_usuario) values
('2019-05-01', '2020-07-10', 1, 1),
('2023-01-03', '2023-06-13', 2, 2),
('2009-07-05', '2011-08-28', 3, 3),
('2025-12-06', '2025-05-12', 4, 4),
('2021-08-10', '2021-10-09', 5, 5);