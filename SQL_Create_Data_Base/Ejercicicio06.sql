# Crear base de datos
create database if not exists Ejercicio6;

# Activar base de datos
use Ejercicio6;

# Crear tablas
create table if not exists Socios(
Codigo int primary key auto_increment,
DNI varchar(9) not null,
Nombre varchar(35) not null,
Apellidos varchar(35),
Direccion varchar(50),
Telefono varchar(35)
);

create table if not exists Autores(
ID_Autor int primary key auto_increment,
Nombre varchar(35) not null,
Pais varchar(35)
);

create table if not exists Articulos(
ID_Articulo int primary key auto_increment,
Año Date,
Resumen text,
deteriorado boolean,
ID_Autor int references Autores(ID_Autor),
Tipo enum("Libro", "CD", "DVD"),
n_paginas int,
n_canciones int,
Duracion int
);

create Table if not exists Prestamos(
ID_Prestamos int primary key auto_increment,
Fecha_Prestamo Date not null,
Fecha_Tope Date,
Fecha_Devolucion Date not null,
Codigo_Socio int references Socios(Codigo),
ID_Articulo int references Articulos(ID_Articulo)
);