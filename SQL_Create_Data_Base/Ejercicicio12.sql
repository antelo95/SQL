# Crear base de datos
create database if not exists Ejercicio12;

# Activar base de datos
use Ejercicio12;

# Crear tablas
create table if not exists Revisiones (
ID int auto_increment,
descripcion text,
primary key (ID)
);

create table if not exists Clientes (
ID int auto_increment,
Nombre varchar(50),
Nif varchar(10),
Direccion varchar(50),
Ciudad varchar(30),
telefono varchar(20),
primary key (ID)
);

create table if not exists Vehiculos(
matricula Varchar(7),
Marca varchar(15),
modelo varchar(15),
color varchar(10),
precio decimal(5,2),
ID_Cliente int,
primary key (matricula),
Constraint fk_IDCli foreign key (ID_Cliente) references Clientes (ID)
);

create table if not exists VehiculosRevisiones(
Matricula varchar(7),
ID_Revisiones int,
primary Key (Matricula, ID_Revisiones),
Constraint fk_Mat foreign key (Matricula) references Vehiculos (Matricula),
Constraint fk_IDRev foreign key (ID_Revisiones) references Revisiones (ID)
);
