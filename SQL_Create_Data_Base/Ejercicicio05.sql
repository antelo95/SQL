#Crear base de datos
create database if not exists Ejercicio05;

#Activar base de datos
use almacen;

#Crear tablas
create table if not exists Almacenes(
n_almacen int primary key,
direccion varchar(75)
);

create table if not exists estanteria(
n_almacen int references Almacenes(n_almacen),
letra varchar(2) not null
);

create table if not exists categoria(
Tipo varchar(25) primary key,
descripcion text
);

create table if not exists piezas(
tipo varchar(25) references categoria(tipo),
modelo varchar(25),
descripcion text,
precio decimal(4,2) not null,
n_almacen int,
letra varchar(2),
primary key (tipo, modelo),
foreign key (n_almacen, letra) references estanteria(n_almacen, letra)
);

create table if not exists Composicion(
ID int primary key auto_increment,
tipo_compone varchar(25) references piezas(tipo),
modelo_compone varchar(25) references piezas(modelo)
);