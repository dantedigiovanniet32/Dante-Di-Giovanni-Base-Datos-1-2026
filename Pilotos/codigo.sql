create database carreras;
use carreras;


create table carreras (
id_carrera int auto_increment primary key,
km int,
pais varchar(100),
anio int(4)
);

insert into carreras (km, pais, anio) values
(3400, 'Madagascar', 2026),
(120, 'Mongolia', 2023),
(5800, 'Argentina', 2004);

create table escuderias (
id_escuderias int auto_increment primary key,
nombre varchar(100),
presupuesto decimal(15, 2)
);

insert into escuderias (nombre, presupuesto) values
('Ferrari', '123000'),
('McLaren', '872000'),
('Mercedes', '123900');




create table pilotos (
id_piloto int auto_increment primary key,
nombre varchar(100),
apellido varchar(100),
dni int(20),
edad int (5)
);
insert into pilotos (nombre, apellido, dni, edad) values
('Marian', 'Petrovich', 2948211, 26),
('Javier', 'Ginobili', 3712399, 31),
('Hector', 'Mesi', 4167422, 11);


create table autos (
id_auto int primary key auto_increment,
marca varchar(100),
modelo varchar(100),
precio decimal(15,2),
anio_fabricacion int,
patente varchar(50),
id_escuderias int,
foreign key (id_escuderias) references escuderias(id_escuderias)
);
insert into autos (marca, modelo, precio, anio_fabricacion, patente, id_escuderias) values
('Volwsavagen', 'Suran', 2500000, 2026, 'ai-908-nb', 1),
('Audi', 'Ex 8', 4100000, 2025, 'aa-895-th', 2),
('Ford', 'Escor', 1850000, 2026, 'obs-797', 3);


create table participaciones (
id_participacion int auto_increment primary key,
puesto int(10),

id_carrera int,
id_piloto int,
id_auto int,
foreign key (id_carrera) references carreras(id_carrera),
foreign key (id_piloto) references pilotos(id_piloto),
foreign key (id_auto) references autos(id_auto)
);

insert into participaciones (puesto, id_carrera, id_piloto, id_auto) values
(1, 1, 2, 2),
(1, 2, 3, 3),
(7, 3, 1, 1);



#a 


select pilotos.nombre, pilotos.apellido, escuderias.nombre as escuderia from pilotos

inner join participaciones on pilotos.id_piloto = participaciones.id_piloto
inner join autos on participaciones.id_auto = autos.id_auto
inner join escuderias on autos.id_escuderias = escuderias.id_escuderias

group by pilotos.nombre
;






#b

select nombre from escuderias

where presupuesto > (select avg(presupuesto) from escuderias);


#c

select autos.marca, autos.modelo, autos.precio from autos

where autos.precio = (select max(precio) from autos);



#d


select pais, min(anio) as anio_carrera, sum(km) as total_km from carreras

where km > 20
group by pais
order by anio_carrera asc;





#e

select pilotos.nombre, pilotos.apellido from pilotos

inner join participaciones on pilotos.id_piloto = participaciones.id_piloto
inner join carreras on participaciones.id_carrera = carreras.id_carrera

where participaciones.puesto = 1
and carreras.anio > 2020
and pilotos.edad > 25;


