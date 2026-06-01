create database STREAMING;
use STREAMING;

create table artistas (
id_art int auto_increment primary key,
nombre varchar(50)
);

insert into artistas(nombre) values
('Patricio rey y sus redonditos de ricota'),
('Pink Floyd'),
('The doors'),
('Manal'),
('Los beatles');

create table albumes (
id_alb int auto_increment primary key,
titulo varchar(50),
id_art int,
foreign key (id_art) references artistas(id_art)
);

insert into albumes (titulo, id_art) values
('Oktubre', 1),
('The dark side of the moon', 2),
('L.A. woman', 3),
('El leon', 4),
('Abbey road', 5);

create table reproducciones(
id_rep int auto_increment primary key,
id_alb int,
cant_repro int(10),
foreign key (id_alb) references albumes(id_alb)
);

insert into reproducciones (id_alb, cant_repro) values
(1, 250000),
(2, 6800000),
(3, 310000),
(4, 46000),
(5, 13000000);



#consulta 1, no devuelve nada porque no hay ninguno con mas de 3 albums
select artistas.nombre, sum(reproducciones.cant_repro) from artistas

inner join albumes on artistas.id_art = albumes.id_art
inner join reproducciones on albumes.id_alb = reproducciones.id_alb

group by artistas.nombre
having count(albumes.id_alb) > 3 and sum(reproducciones.cant_repro) > 1000000;


# 2
select albumes.titulo, artistas.nombre, avg(reproducciones.cant_repro) from artistas

inner join albumes on artistas.id_art = albumes.id_art
inner join reproducciones on albumes.id_alb = reproducciones.id_alb

group by albumes.titulo, artistas.nombre
having avg(reproducciones.cant_repro) > 50000;


#3

select artistas.nombre, sum(reproducciones.cant_repro) from artistas

inner join albumes on artistas.id_art = albumes.id_art
inner join reproducciones on albumes.id_alb = reproducciones.id_alb

group by artistas.nombre
order by sum(reproducciones.cant_repro) asc limit 1;