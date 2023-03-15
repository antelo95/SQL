#Crear base de datos
create database if not exists Ejercicio08;

# Activar base de datos
use Ejercicio08;

# Crear tablas
create table if not exists Alumnos(
DNI varchar(09),
Nombre varchar(30),
primary key(DNI)
);

create table if not exists Asignaturas(
ID int auto_increment,
Asignatura varchar(35),
primary key(ID)
);

create table if not exists Grupos(
ID int auto_increment,
Grupo varchar(35),
primary key(ID)
);

create table if not exists Profesores(
DNI varchar(9),
nombre varchar(50),
primary key(DNI)
);

create table if not exists Asignatura_Grupos(
ID_Asignatura int,
ID_Grupo int,
Nota decimal(2,1),
DNI_Profesor varchar(9),
DNI_Alumno varchar(9),
constraint fk_IDAsig foreign key (ID_Asignatura) references Asignaturas (ID),
constraint fk_IDGr foreign key (ID_Grupo) references Grupos (ID),
constraint fk_DNIPr foreign key (DNI_Profesor) references Profesores (DNI),
constraint fk_DNIAl foreign key (DNI_Alumno) references Alumnos (DNI),
primary key (ID_Asignatura, ID_Grupo)
);


#modificar primary key de DNI Alumnos
alter table Asignatura_Grupos drop foreign key fk_DNIAl;
alter table Alumnos drop primary key;

#Añadir campo
alter table Alumnos add id int primary key auto_increment first;

# Modificar campos del Asignatura Grupos
alter table Asignatura_Grupos modify DNI_Alumno int not null;
alter table Asignatura_Grupos add constraint fk_DNIAl foreign key(DNI_Alumno) references Alumnos (ID);
