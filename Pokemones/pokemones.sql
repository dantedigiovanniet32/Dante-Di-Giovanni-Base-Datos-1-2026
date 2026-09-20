create database pokemones;
use pokemones;



create table ciudades (
id_ciudad int primary key auto_increment,
nombre varchar(100)
);

insert into ciudades (nombre) values 
('Celadon'),
('Manila'),
('Uribelarrea');

create table gimnasios (
id_gimnasio int primary key auto_increment,
nombre varchar(100),
lider varchar(100),
id_ciudad int,
foreign key (id_ciudad) references ciudades(id_ciudad)
);

insert into gimnasios (nombre, lider, id_ciudad) values 
('Nueva vida', 'Patricio', 2),
('MrMusculo', 'Jose', 3);

create table entrenadores (
id_entrenador int primary key auto_increment,
nombre varchar(100),
id_ciudad int,
id_gimnasio int,
foreign key (id_ciudad) references ciudades(id_ciudad),
foreign key (id_gimnasio) references gimnasios(id_gimnasio)
);

insert into entrenadores (nombre, id_ciudad, id_gimnasio) values 
('Ash Ketchup', 1, 1),
('Lucas', 1, 2),
('Lurdes', 2, 1);

create table tipos (
id_tipo int primary key auto_increment,
nombre varchar(50)
);

insert into tipos (nombre) values 
('Electricidad'),
('Fuego'),
('Planta');	


create table pokemones (
id_pokemon int primary key auto_increment,
nombre varchar(100),
nivel_poder int,
id_entrenador int,
id_tipo int,
foreign key (id_entrenador) references entrenadores(id_entrenador),
foreign key (id_tipo) references tipos(id_tipo)
);

insert into pokemones (nombre, nivel_poder, id_entrenador, id_tipo) values 
('Pikachu', 45, 1, 1),
('Charmander', 78, 2, 2),
('Bolvazor', 72, 3, 3);



create table batallas (
id_batalla int primary key auto_increment,
fecha date,
id_pokemon_ganador int,
id_pokemon_perdedor int,
foreign key (id_pokemon_ganador) references pokemones(id_pokemon),
foreign key (id_pokemon_perdedor) references pokemones(id_pokemon)
);

insert into batallas (fecha, id_pokemon_ganador, id_pokemon_perdedor) values 
('2023-09-1', 1, 2),
('2026-03-12', 2, 3),
('2021-11-24', 1, 3);



#1

select e.nombre, c.nombre, g.nombre from entrenadores e
inner join ciudades c on e.id_ciudad = c.id_ciudad
inner join gimnasios g on e.id_gimnasio = g.id_gimnasio
;

#2


select pokemones.nombre, tipos.nombre from pokemones
inner join tipos on pokemones.id_tipo = tipos.id_tipo;

#3

select nombre, nivel_poder from pokemones
where nivel_poder > 50;


#4


select pokemones.nombre, pokemones.nivel_poder, entrenadores.nombre from pokemones

inner join tipos on pokemones.id_tipo = tipos.id_tipo
inner join entrenadores on pokemones.id_entrenador = entrenadores.id_entrenador

where tipos.nombre = 'Fuego'
order by pokemones.nivel_poder asc;




#5

select pokemones.nombre, entrenadores.nombre from pokemones
inner join entrenadores on pokemones.id_entrenador = entrenadores.id_entrenador

where entrenadores.id_ciudad = ( select id_ciudad from ciudades where nombre = 'Celadon' );

#6

select nombre, nivel_poder from pokemones
where nivel_poder > (select avg( nivel_poder ) from pokemones);


#7

select pokemones.nombre, count(batallas.id_pokemon_ganador) as batallas_ganadas from pokemones
inner join batallas on batallas.id_pokemon_ganador = pokemones.id_pokemon

where (select count(*) from batallas where batallas.id_pokemon_ganador = pokemones.id_pokemon) > 0
group by pokemones.nombre;




