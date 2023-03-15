create database if not exists Ejercicio16;
use Ejercicio16;
create table if not exists Mecanicos(
DNI varchar(9),
Nombre varchar(25),
Apellidos varchar(25),
Fecha_Contratacion date,
Salario decimal(5,2),
primary key (DNI)
);
create table if not exists Clientes(
DNI varchar(9),
Nombre varchar(25),
Apellidos varchar(25),
Direccion varchar(25),
Telefono varchar(8),
primary key(DNI)
);
create table if not exists Coches(
Matricula varchar(7),
Marca varchar(25),
Modelo varchar(25),
Tipo_Coche enum ("Usado", "Nuevo"),
Numero_Km int(7),
Numero_U int(3),
Dni_Cliente varchar(9),
primary key (Matricula),
constraint fk_DniCli foreign key (Dni_Cliente) references Clientes(DNI)
);
create table if not exists MecanicosCoches(
Dni_Mecanico varchar(9),
Matricula varchar(7),
Horas_Reparacion time,
Fecha_Reparacion date,
primary key (Dni_Mecanico, Matricula),
constraint fk_DniMec foreign key (Dni_Mecanico) references Mecanicos(DNI),
constraint fk_Mat foreign key (Matricula) references Coches(Matricula)
);