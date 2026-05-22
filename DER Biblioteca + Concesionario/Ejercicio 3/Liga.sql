create database LIGAs;
use LIGAs;

create table posiciones (
id_posicion int auto_increment primary key,
nombre varchar(50)
);
insert into posiciones(nombre) values
('Lateral'),
('Central'),
('Arquero'),
('Extremo'),
('Mediocampista');

create table ciudades ( 
id_ciudad int auto_increment primary key,
nombre varchar(50),
poblacion int(10)
);
insert into ciudades (nombre, poblacion) values
('Buenos Aires', 3121707),
('Salta', 640000),
('Puerto Madryn', 103175),
('Mar del Plata', 644234),
('Zapala', 40472);

create table estadios (
id_estadio int auto_increment primary key,
nombre varchar(100),
ubicacion varchar(50)
);
insert into estadios (nombre, ubicacion) values
('Guillermo Laza', 'Ana María Janer 2651'),
('Fray Honorato Pistoia', 'Lerma 649'),
('Raul Conti', 'Mariano Moreno 802'),
('Leon Kolbowski', 'Humboldt 390'),
('José María Minella', 'Av. de las Olimpiadas 760');

create table equipos (
id_equipo int auto_increment primary key,
nombre varchar(50),
anio_fundacion int(4),
aforo int(10),
id_estadio int,
id_ciudad int,
foreign key (id_estadio) references estadios(id_estadio),
foreign key (id_ciudad) references ciudades(id_ciudad)
);
insert into equipos (nombre, anio_fundacion, aforo, id_estadio, id_ciudad) values 
('Deportido Riestra', 1929, 8740, 1, 1),#caba
('Juventud Antoniana', 1916, 8000, 2, 2),#salta
('Guillermo Brown', 1945, 15000, 3, 3),#madryn
('Atlanta', 1904, 18000, 4, 1),#caba
('Aldosivi', 1911, 35180, 5, 4);#mardel

create table jugadores (
id_jugador int auto_increment primary key,
nombre varchar(50),
fecha_nacimiento date,
id_equipo int,
id_posicion int,
foreign key (id_equipo) references equipos(id_equipo),
foreign key (id_posicion) references posiciones(id_posicion)
);
insert into jugadores (nombre, fecha_nacimiento, id_equipo, id_posicion) values
('Mariano Bracamonte', '1999-04-24', 1, 1),
('Valentin Gandarillas', '2004-02-05', 2, 4),
('Agustin Grinovero', '2000-08-10', 3, 3),
('Nicolas Previtali', '1995-07-07', 4, 5),
('Nestor Breitenbruch', '1995-08-13', 5, 2);

create table presidentes (
id_presidente int auto_increment primary key,
nombre varchar(50),
apellido varchar(50),
dni int(8),
fecha_nacimiento date,
fecha_electo date,
id_equipo int,
foreign key (id_equipo) references equipos(id_equipo)
);
insert into presidentes (nombre, apellido, dni, fecha_nacimiento, fecha_electo, id_equipo) values
('Fernando', 'Salorio', 27294893, '1981-01-09', '2008-10-30', 1),
('Juan Carlos', 'Segura', 29791028, '1976-11-28', '2016-09-13', 2),
('Mariano', 'Eliceche', 31937483, '1987-05-09', '2021-11-01', 3),
('Gabriel', 'Greco', 25954890, '1974-06-28', '2017-07-06', 4),
('Hernan', 'Tillous', 23903672, '1968-02-15', '2023-12-16', 5);

create table partidos (
id_partido int auto_increment primary key,
fecha date,
goles_equipo_local int(2),
goles_equipo_visitante int(2),
id_equipo_local int,
id_equipo_visitante int,
foreign key (id_equipo_local) references equipos(id_equipo),
foreign key (id_equipo_visitante) references equipos(id_equipo)
);
insert into partidos (fecha, goles_equipo_local, goles_equipo_visitante, id_equipo_local, id_equipo_visitante) values
('2020-08-14', 1, 0, 1, 5),
('2024-03-27', 3, 1, 2, 1),
('2019-11-05', 0, 2, 4, 3),
('2021-06-19', 4, 0, 5, 4),
('2026-01-11', 0, 0, 3, 2);


create table goles (
id_gol int auto_increment primary key,
minuto int(3),
descripcion varchar(10000),
id_equipo int,
foreign key (id_equipo) references equipos(id_equipo)
);
insert into goles (minuto, descripcion, id_equipo) values
(23, 'Tiro de esquina pasado al segundo palo para que el 4 cabezee solo a palo cambiado sin nada que hacer para el arquero', 1),
(68, 'Penal cruzado abajo', 2),
(4, 'Contra manejada por el 7 que deja solo al 9 para que defina abajo del arco', 3),
(93, 'Agonico gol de tiro libre del 11 al segundo palo abriendo el pie con un desvio en la barrera', 4),
(44, 'Tiro desde afuera del area del 3 y al arquero se le escapa de las manos', 5);

create table goles_jugadores (
id_gol_jugador int auto_increment primary key,
id_gol int,
id_jugador int,
foreign key (id_gol) references goles(id_gol),
foreign key (id_jugador) references jugadores(id_jugador)
);
insert into goles_jugadores (id_gol, id_jugador) values
(1, 1),
(2, 2),
(3, 1),
(4, 5),
(5, 4);