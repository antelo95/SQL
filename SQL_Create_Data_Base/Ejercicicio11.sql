# Crear base de datos
create database if not exists Ejercicio11;

# Activa base de datos
use Ejercicio11;

# Crear tablas

create table if not exists Hijos (
Codigo int auto_increment,
Nombre varchar (50),
Fecha_Nacimiento date,
primary key (Codigo)
);

create table if not exists Habilidades (
Codigo int auto_increment,
Descripcion text,
primary key (Codigo)
);

create table if not exists Empleados (
DNI varchar(10),
Nombre varchar(35),
Telefono varchar(35),
Fecha_Alta date,
Salario decimal(5,2),
Codigo_Departamento int,
primary key (DNI)
);

create table if not exists CentrosTrabajo(
Codigo int auto_increment,
Nombre varchar(35),
Direccion varchar(35),
Poblacion varchar(35),
DNI_Empleado varchar(10),
primary key (Codigo),
constraint fk_DNIEmplCentros foreign key (DNI_Empleado) references Empleados (DNI)
);

create table if not exists Departamentos(
Codigo int auto_increment,
Nombre varchar(50),
presupuestos decimal(6,2),
Codigo_Centro int,
primary key (Codigo),
constraint fk_CodCen foreign key (Codigo_Centro) references CentrosTrabajo (Codigo)
);

create table if not exists EmpleadosHijos(
DNI_Empleado varchar(10),
Codigo_Hijo int,
primary key (DNI_Empleado, Codigo_Hijo),
constraint fk_DNIEmpleHijos foreign key (DNI_Empleado) references Empleados (DNI),
constraint fk_CodHijoEmp foreign key (Codigo_Hijo) references Hijos (Codigo)
);

create table if not exists EmpleadosHabilidades(
DNI_Empleado varchar (10),
Codigo_Habilidad int,
primary key (DNI_Empleado, Codigo_Habilidad),
constraint fk_DNIEmpHab foreign key (DNI_Empleado) references Empleados (DNI),
constraint fk_CodHab foreign key (Codigo_Habilidad) references Habilidades (Codigo)
);

# añadir referencias nuevas en la tabla Empleados
alter table Empleados add constraint fk_CodDep foreign key (Codigo_Departamento) references Departamentos (Codigo);

