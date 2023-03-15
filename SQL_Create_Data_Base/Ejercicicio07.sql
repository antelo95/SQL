# Crear base de datos
create database if not exists Ejercicio07;

# Activar base de datos
use Ejercicio07;

# Crear tablas
create table if not exists Asignaturas(
id int primary key auto_increment,
nombre_asignatura varchar(25) not null
);

create table if not exists Carreras(
id int primary key auto_increment,
nombre_carrera varchar(25) not null,
id_asignautra int references Asignaturas(id)
);

create table if not exists Alumnos(
DNI varchar(9) primary key,
Nombre varchar(25) not null
);

create table if not exists Alumnos_Asignatura(
id_asignatura int,
DNI_Alumno varchar(9),
primary key (id_asignatura, DNI_Alumno),
foreign key (id_asignatura) references Asignaturas (id),
constraint fk_DNI foreign key (DNI_Alumno) references Alumnos (DNI)
);

# Modificaciones sobre la tabla
# Añadir campo Apellidos a la tabla Alumnos
alter table Alumnos add Apellidos varchar(40) null after Nombre;
# Borrar atributo primary key en la tabla alumno
# para probar esto hay que quitar como clave foranea el DNI en la otra tabla
alter table Alumnos_Asignatura drop foreign key fk_DNI;
alter table Alumnos drop primary key;
# Crear campo en alumnos y que sea primary key
alter table Alumnos add Alumnos integer(4) primary key auto_increment first;
# Modificar campo 
alter table Asignaturas modify nombre_asignatura enum("Matemáticas", "Física", "Tecnología") not null;