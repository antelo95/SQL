# Creacion de la base de datos
create database if not exists venta_vehiculo;
# activamos base de datos
use venta_vehiculo;

#Creamos la tablas
create table if not exists Clientes(
ID_Cliente int primary key auto_increment,
Nombre varchar(30) not null,
NIF varchar(9) not null,
Direccion varchar(50),
Ciudad varchar(50),
Telefono varchar(30)
);

create table if not exists Vehiculos(
Matricula varchar(10) primary key,
Marca varchar (15) not null,
Modelo varchar(15) not null,
Color enum('rojo', 'plata', 'amarillo'),
Precio decimal(7,2) not null,
ID_Cliente int references Clientes(ID_Cliente)
on delete set null on update cascade
);

create table if not exists Revisiones(
ID_Revisiones int primary key auto_increment,
Descripcion text
);

# La siguiente tabla se debe realizar despues de las anteriores porque tiene campos relacionados con ellas
# si se crea ante da fallo al crearla
create table if not exists VehiculoRevisiones(
Matricula varchar(10) references Vehiculos(Matricula),
ID_Revisiones int references Revisiones(ID_Revisiones),
primary key (Matricula, ID_Revisiones) # Clave compuesta
);
