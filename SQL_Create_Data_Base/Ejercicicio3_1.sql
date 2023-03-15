# Crear tabla
create database if not exists Ejercicio3_1;

# Activar base de datos
use Ejercicio3_1;

# Crear tablas
create table if not exists Enfermo(
Inscripcion int(5) auto_increment,
Apellido varchar(15),
Direccion varchar(20),
fecha_nac date,
s varchar(1),
nss int(9),
primary key (Inscripcion)
);

create table if not exists Hospitales(
Hospitales_Cod int auto_increment,
nombre varchar(15) not null,
direccion varchar(20),
telefono char(8),
num_cama varchar(45),
hospitalescol int(3),
primary key (Hospitales_Cod)
);

create table if not exists Sala(
Hospital_Cod int,
Sala_Cod int(2),
Nombre varchar(20),
Num_Cama int(3) default 0,
primary key (Sala_Cod),
constraint fk_HosCod foreign key (Hospital_Cod) references Hospitales(Hospitales_Cod) on update cascade on delete cascade
);

create table if not exists Plantilla(
Hospital_Cod int,
Sala_cod int(2),
Empleado_No int(4),
Apellido varchar(15) not null,
Funcion char(10),
turno enum("T", "M", "N"),
salario int(10),
Plantilla_Empleado_No int,
primary key (Empleado_No, Plantilla_Empleado_No),
constraint fk_HosCodPl foreign key (Hospital_Cod) references Hospitales(Hospitales_Cod) on update cascade on delete cascade,
constraint fk_SalCodPl foreign key (Sala_cod) references Sala(Sala_Cod) on update cascade on delete cascade,
constraint ck_salario check (salario > 0)
);

create table if not exists Ocupacion(
Inscripcion int(5),
Hospital_Cod int,
Sala_cod int(2),
cama int(4) not null,
primary key(Inscripcion, Hospital_Cod, Sala_cod),
constraint fk_HosCodOc foreign key (Hospital_Cod) references Hospitales(Hospitales_Cod) on update cascade on delete cascade,
constraint fk_SalCodOc foreign key (Sala_cod) references Sala(Sala_Cod) on update cascade on delete cascade,
constraint fk_InsOc foreign key (Inscripcion) references Enfermo(Inscripcion) on update cascade on delete cascade
);

# Punto 7. Modificar el campo S de la tabla Enfermo. Cambiar el nombre por Estado y tipo Boolean
alter table Enfermo rename column s to Estado;
alter table Enfermo modify Estado boolean;

# Punto 8. Introduce un nuevo campo llmado Localidad en la tabla enfermo
alter table Enfermo add Localidad varchar(25);

# Punto 9. Borra el anterior campo
alter table Enfermo drop Localidad;
