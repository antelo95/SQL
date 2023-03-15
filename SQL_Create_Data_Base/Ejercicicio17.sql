create database Ejercicio17;
use Ejercicio17;
create table Autores(
Codigo int auto_increment,
Nombre varchar(50),
primary key (Codigo)
);
create table Libros(
Codigo int auto_increment,
Num_Paginas int,
Titulo varchar(25),
ISBN varchar(20),
Editorial varchar(20),
primary key (Codigo)
);
create table Usuarios(
Codigo int auto_increment,
Nombre varchar(50),
Direccion varchar(50),
Telefono varchar(25),
primary key (Codigo)
);
create table AutoresLibros(
Codigo_Autor int,
Codigo_Libro int,
primary key (Codigo_Autor, Codigo_Libro),
constraint fk_CodAut foreign key (Codigo_Autor) references Autores(Codigo),
constraint fk_CodLibAut foreign key (Codigo_Libro) references Libros(Codigo)
);
create table Ejemplares(
Codigo int auto_increment,
Localizacion varchar(25),
Codigo_Libro int,
primary key (Codigo),
constraint fk_CodLibEj foreign key (Codigo_Libro) references Libros(Codigo)
);
create table UsuariosEjemplares(
Codigo_Usuario int,
Codigo_Ejemplar int,
Fecha_Inicio date,
Fecha_fin date,
primary key (Codigo_Usuario, Codigo_Ejemplar),
constraint fk_CodUsEj foreign key (Codigo_Usuario) references Usuarios(Codigo),
constraint fk_CodEjEj foreign key (Codigo_Ejemplar) references Ejemplares(Codigo)
);