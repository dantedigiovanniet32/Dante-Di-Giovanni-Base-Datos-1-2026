create database CARTOONS;
use CARTOONS;


create table series (
id_serie int auto_increment primary key, 
nombre varchar(50), 
anio_estreno int(4), 
creador varchar(50)
);
insert into series (nombre, anio_estreno, creador) values
('Hora de Aventura', 2011, 'Pendleton ward'),
('Ben 10', 2005, 'Duncan Rouleau'),
('Billy y Mandy', 2001, 'Maxwell atoms'),
('Un Show Mas', 2010, 'J.G. Quintel'),
('Coraje el Perro Cobarde', 1999, 'John dilworth'),
('El Laboratorio de Dexter', 1996, 'Genndy Tartakovsky');




create table personajes (
id_personaje int auto_increment primary key, 
nombre varchar(50), 
id_serie int, 
rol enum('Antagonista', 'Protagonista', 'Secundario'), 
nivel_energia int,
foreign key (id_serie) references series(id_serie)
);
insert into personajes (nombre, id_serie, rol, nivel_energia) values
('Finn el Humano', 1, 'Protagonista', 85),
('Jake el Perro', 1, 'Protagonista', 90),
('Rey helado', 1, 'Antagonista', 75),
('Ben Tennyson', 2, 'Protagonista', 95),
('Vilgax', 2, 'Antagonista', 98),
('Puro Hueso', 3, 'Secundario', 80),
('Mordecai', 4, 'Protagonista', 60),
('Rigby', 4, 'Protagonista', 55),
('Coraje', 5, 'Protagonista', 40),
('Dexter', 6, 'Protagonista', 70);



create table episodios (
id_episodio int auto_increment primary key, 
titulo varchar(50),  
duracion_minutos int(5),
rating_audiencia decimal(5, 2),
id_serie int, 
foreign key (id_serie) references series(id_serie)
);
insert into episodios (titulo, duracion_minutos, rating_audiencia, id_serie) values

('Otro Planeta', 21, 11.5, 1),
('Fiesta', 7, 9.3, 1),
('Casamiento', 24, 8.9, 2),
('La Guerra', 44, 7.3, 3),
('Paralisis', 9, 8.6, 4),
('Aguas Sucias', 17, 2.9, 4),
('Petroleo Crudo', 10, 8.7, 5),
('Piloto', 46, 3.5, 6),
('Lucia', 21, 10.8, 6),
('Multiverso', 19, 1.5, 6);




create table habilidades_especiales (
id_habilidad int auto_increment primary key, 
id_personaje int,
nombre_habilidad varchar(100), 
tipo_habilidad varchar(50)
);
insert into habilidades_especiales ( id_personaje, nombre_habilidad, tipo_habilidad ) values
(1, "Puños", "Fisica"),
(2, "SuperSalto", "Natural"),
(3, "Hielo", "Magica"),
(4, "Omnitrix", "Tecnologica"),
(5, "Fuerza", "Fisica"),
(6, "Hechizos", "Magica"),
(7, "Volar", "Natural"),
(8, "Velocidad", "Natural"),
(9, "Anteojos Inteligentes", "Tecnologica"),
(10, "Fuego", "Magica");




create table enemigos_historicos (
id_rivalidad int auto_increment primary key,
encuentros_totales int(2),
id_heroe int, 
id_villano int, 
foreign key (id_heroe) references personajes(id_personaje),
foreign key (id_villano) references personajes(id_personaje)
);

insert into enemigos_historicos (encuentros_totales, id_heroe, id_villano) values
(17, 1, 3),
(49, 4, 5);




create table objetos_misticos (
id_objeto int auto_increment primary key,
nombre varchar(50), 
valor_subasta int(5),
id_personaje_duenio int, 
foreign key (id_personaje_duenio) references personajes(id_personaje)
);

insert into objetos_misticos (nombre, id_personaje_duenio, valor_subasta) values
("Arco de Fuego", 1, 67650),
("Pechera Indestructible", 1, 13000),
("Botas Magicas", 3, 78999),
("Reloj Omnitrix", 4, 43001),
("Anillo Infinito", 5, 43000),
("Balloneta de Obsidiana", 6, 320),
("Espada Filosa", 7, 980000),
("Capa Voladora", 7, 659999),
("Varita Magica", 9, 540000),
("Volea Inmaculada", 10, 10);



#1
select nombre, creador from series
order by nombre asc;


#2
select nombre, rol from personajes 
where nombre like "B%" or nombre like "F%";

#3
select titulo from episodios
where duracion_minutos > 11 and rating_audiencia > 8.5;


#4
select nombre from objetos_misticos
where nombre like "%Espada%" or nombre like "%Anillo%";


#5



select min(nivel_energia) as nivel_minimo, max(nivel_energia) as nivel_maximo from personajes
where rol = 'Antagonista';


#6

select tipo_habilidad, count(*) as cantidad from habilidades_especiales
group by tipo_habilidad;




#7
select nombre, nivel_energia from personajes 
order by nivel_energia desc, nombre asc;




#8



select id_personaje_duenio, sum(valor_subasta) as valor_total from objetos_misticos
where valor_subasta > 5000
group by id_personaje_duenio
order by valor_total desc;


#9

select id_serie, count(*) as cantidad_personajes from personajes
where nivel_energia > 50
group by id_serie;


#10


select id_serie, count(*) as cantidad_personajes from personajes
where nivel_energia > 50
group by id_serie;








#11
select series.nombre, avg(episodios.duracion_minutos) as promedio_duracion from episodios
inner join series on series.id_serie = episodios.id_serie
where series.anio_estreno > 2010
group by series.nombre;



#12
select id_personaje, count(id_habilidad) as cantidad_habilidades from habilidades_especiales
group by id_personaje
having count(id_habilidad) > 3;


#13


select id_rivalidad, encuentros_totales, id_heroe, id_villano from enemigos_historicos
where encuentros_totales > 15
order by encuentros_totales desc;



#14
select id_personaje_duenio, max(valor_subasta) as mas_costoso from objetos_misticos
group by id_personaje_duenio
having max(valor_subasta) > 100000;





#15

select episodios.id_serie, count(*) as cantidad_episodios from episodios
group by episodios.id_serie
order by cantidad_episodios desc;
