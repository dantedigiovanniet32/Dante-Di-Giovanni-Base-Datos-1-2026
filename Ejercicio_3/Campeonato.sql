create database CAMPEONATO;
use CAMPEONATO;

create table equipos (
id_equipo int auto_increment primary key, 
nombre varchar(50), 
anio_fundacion int(4), 
ligas_locales int(3)
);

create table jugadores (
id_jugador int auto_increment primary key,
nombre varchar(50),
apellido varchar(50),
posicion varchar(20),
id_equipo int,
foreign key (id_equipo) references equipos(id_equipo)
);


create table estadios (
id_estadio int primary key, 
nombre varchar(50), 
capacidad int(10), 
anio_apertura int(4));

create table partidos (
id_partido int primary key,
fecha date,
id_equipo_local int,
id_equipo_visitante int,
goles_local int,
goles_visitante int,
id_estadio int,
foreign key (id_equipo_local) references equipos(id_equipo),
foreign key (id_equipo_visitante) references equipos(id_equipo),
foreign key (id_estadio) references estadios(id_estadio)
);

insert into equipos(nombre, anio_fundacion, ligas_locales) values 
('Racing', 1903, 18), 
('Independiente', 1904, 16);

insert into jugadores(nombre, apellido, posicion, id_equipo) values 
('Adrian', 'Martinez', 'Arquero', 1), 
('Kevin', 'Lomonaco', 'Defensor', 2);

insert into estadios values 
(1, 'Cilindro de Avellaneda', 50000, 1950), 
(2, 'Libertadores de America', 52360, 2009);

insert into partidos values 
(1, '2023-10-01', 1, 2, 2, 1, 1);


#Porque todavia no explicaste join
select * from partidos;

select nombre, posicion from jugadores;