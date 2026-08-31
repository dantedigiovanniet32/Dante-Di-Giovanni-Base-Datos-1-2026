#Dante Di GIovanni y Enzo Barrios

create database evaluacion;
use evaluacion;

create table tecnicos (
id_tecnico int primary key auto_increment,
nombre varchar(50),
apellido varchar(50)
);

insert into tecnicos (nombre, apellido) values
('Enzo', 'Gimenez'),
('Antonio', 'Gutierrez'),
('Santino', 'Arzamendia');

create table empresas (
id_empresa int primary key auto_increment,
nombre varchar(50),
ubicacion varchar(100)
);

insert into empresas (nombre, ubicacion) values
('EcoItems', 'Nueva York'),
('ScienceQumic', 'Hong Kong'),
('AcmeSuelos', 'Rosario');

create table muestras (
id_muestra int primary key auto_increment,
Nombre varchar(50),
Tipo enum('aire', 'suelo', 'agua', 'alimentos', 'minerales')
);

insert into muestras (nombre, tipo) values
('Dirt  ajh76', 'suelo'),
('Atlantic 7hn9', 'agua'),
('js8k food', 'alimentos');

create table analisis (
id_analisis int primary key auto_increment,
resultado varchar(50),
compuesto_quimico varchar(50),
fecha date,
id_tecnico int,
id_muestra int,
foreign key tecnicos(id_tecnico) references id_tecnico,
foreign key muestras(id_muestra) references id_muestra
);


insert into analisis (resultado, compuesto_quimico, fecha, id_tecnico, id_muestra) values
('Radiacion', 'lt2', 12-12-2025, 1, 1),
('Positivo', 'H2O', 09-11-2021, 1, 2),
('Intoxicacion', 'Fha220', 25-01-2019, 3, 3);



create table reportes (
id_reporte int primary key auto_increment,
fecha date,
contaminantes varchar(100),
comportamiento varchar(50),
cumplimiento_normas varchar(100),
id_muestra int,
foreign key muestras(id_muestra) references id_muestra
);

insert into reportes (fecha, contminantes, comportamiento, cumplimient_normas, id_muestra) values
(10-05-2009, 'Litio', 'Leve', 'Incumplidas', 1),
(10-05-2011, 'Ninguno', 'Normal', 'Cumplidas', 1),
(10-05-2024, 'Potasio', 'Extremo', 'Ninguna', 2);



#1

select muestras.nombre, muestra.tipo, empresa.nombre, tecnicos.nombre, tecnicos.apellido from muestras

inner join analisis on analisis.id.muestra = muestras.id_muestra
inner join tecnicos on tecnicos.id_tecnico = analisis.id_tecnico
inner join empresas on empresas.id_empresa = muestras.id_empresa;


#2


select resultado from analisis
where resultado > (select avg(resultado) from analisis);

#3




#4



select tecnico.nombre, count(muestras.id_muestra) from tecnicos

inner join analisis on analisis.id.muestra = muestras.id_muestra
inner join tecnicos on tecnicos.id_tecnico = analisis.id_tecnico

where tecnicos.id_tecnico = analisis.id_tecnico and analisis.id.muestra = muestras.id_muestra;


#5


select compuesto_quimico from analisis
where (select max(select count(compuesto_quimico) from analisis));






