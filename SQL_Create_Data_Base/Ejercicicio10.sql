# Crear base de datos
create database if not exists Ejercicio10;

# Activar base de datos
use Ejercicio10;

create table if not exists Categoria(
Codigo int auto_increment,
Tipo_iva enum("4", "10", "16", "21"),
Descripcion text,
primary key (Codigo)
);

create table if not exists Hoteles(
Codigo int auto_increment,
Nombre varchar(25),
Direccion varchar(50),
Codigo_Categoria int,
telefono varchar(25),
año_construccion date,
primary key (Codigo),
constraint fk_codCat foreign key (Codigo_Categoria) references Categoria (Codigo)
);

create table if not exists Habitaciones(
Codigo int auto_increment,
tipo_habitacion varchar(25),
codigo_hotel int,
primary key (codigo),
constraint fk_codHot foreign key(codigo_hotel) references Hoteles (Codigo)
);

create table if not exists Clientes(
DNI varchar(10),
Nombre_Completo varchar(50),
Direccion varchar(50),
tipo enum("Particular", "Empresa"),
Nombre_Cliente varchar(50),
Apellidos_Cliente varchar(50),
primary key (DNI)
);

create table if not exists Reservas(
Codigo_Habitacion int,
DNI_Cliente varchar (10),
precio Decimal(5,2),
Fecha_de_Inicio date,
Fecha_finalizacion date,
primary key (Codigo_Habitacion, DNI_Cliente),
constraint fk_CodHab foreign key (Codigo_Habitacion) references Habitaciones (Codigo),
constraint fk_DNI_Cli foreign key (DNI_Cliente) references Clientes (DNI)
);
/*
restricciones foraneas 
on delete cascade --> si borra se borra en todas las referencias
on delete no action --> si se intenta borrar no permite borrarla
on delete set null --> si se borra en las demas referencias se establece a null.alter

Con on update lo mismo
*/
alter table Reservas drop fk_CodHab;
alter table Reservas add constraint fk_CodHab foreign key (Codigo_Habitacion) references Habitaciones (Codigo) on delete cascade on update cascade;