# Crear base de datos
create database if not exists Ejercicio13;

# Activar base de datos
use Ejercicio13;

# Crear tablas
create table if not exists Pacientes(
Codigo int auto_increment,
Nombre varchar(25),
Apellidos varchar(25),
Direccion varchar(25),
CP int(5),
Poblacion varchar(25),
Provincia varchar(25),
Telefono varchar(8),
Fecha_Nacimiento Date,
primary key(Codigo)
);

create table if not exists Medicos(
Codigo int auto_increment,
Nombre varchar(25),
Apellidos varchar(25),
Telefono varchar(8),
Especilaidad varchar(25),
primary key(Codigo)
);

Create table if not exists Ingresos(
Codigo_Ingreso int auto_increment,
Habitacion int,
Cama varchar(1),
Fecha_Ingreso date,
Codigo_Paciente int,
Codigo_Medico int,
primary key(Codigo_Ingreso),
constraint fk_CodPac foreign key (Codigo_Paciente) references Pacientes(Codigo),
constraint fk_CodMed foreign key (Codigo_Medico) references Medicos(Codigo)
);