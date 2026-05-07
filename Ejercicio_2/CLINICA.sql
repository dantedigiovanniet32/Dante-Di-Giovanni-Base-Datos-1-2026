create database CLINICA;
use CLINICA;

create table especialidades (
id_especialidad int primary key,
nombre varchar(50) not null
);
insert into especialidades values 
(1, 'Pediatria'), (2, 'Cardiologia'), (3, 'Otorrinonaringologia');

create table pacientes (
id_paciente int auto_increment primary key,
nombre varchar(50),
apellido varchar(50),
telefono varchar(20)
);
insert into pacientes(nombre, apellido, telefono) values 
('Simon', 'Delparque', '11223344'),
('Ana', 'Ciroletti', '55667788'),
('Pascual', 'Gorriti', '99001122');

create table medicos (
id_medico int auto_increment primary key,
nombre varchar(50),
apellido varchar(50),
matricula varchar(20)
);
insert into medicos(nombre, apellido, matricula) values 
('Carlos', 'Alvear', 'P20229'),
('Laura', 'Sosa', 'M.N. 123.456'),
('Daniel', 'Guzman', 'P20345');

create table medicos_especialidades (
primary key (id_medico, id_especialidad),
id_medico int,
id_especialidad int,
foreign key (id_medico) references medicos(id_medico),
foreign key (id_especialidad) references especialidades(id_especialidad)
);
insert into medicos_especialidades values (1, 1), (2, 2), (3, 3);

create table turnos (
id_turno int auto_increment primary key,
fecha date,
hora time,
estado varchar(20),
id_paciente int,
id_medico int,
foreign key (id_paciente) references pacientes(id_paciente),
foreign key (id_medico) references medicos(id_medico)
);
insert into turnos(fecha, hora, estado, id_paciente, id_medico) values 
('2024-05-20', '10:00', 'Pendiente', 1, 1),
('2024-05-21', '09:30', 'Realizado', 2, 2),
('2024-05-22', '11:00', 'Cancelado', 3, 3);

select medicos.nombre, medicos.apellido, especialidades.nombre
from medicos, medicos_especialidades, especialidades
where medicos.id_medico = medicos_especialidades.id_medico
and medicos_especialidades.id_especialidad = especialidades.id_especialidad;

select * from turnos;




