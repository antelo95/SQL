# Crear base de datos
create database if not exists Ejercicio3_2;

# Activar base de datos
use Ejercicio3_2;

# Creacion de tablas
create table if not exists Clientes(
id int auto_increment,
Nif varchar(10) unique,
Apellidos varchar(25),
Nombre varchar(25),
Fecha_Nacimiento date,
Estdo_Civil enum ("Soltero/a", "Casado/a", "Viudo/a", "Arreguntado/a"),
trabaja boolean,
primary key (id)
);

create table Bancos(
Codigo_Banco int(4) not null,
Codigo_Surcusal int(4) not null,
Denominacion varchar(25) not null,
Codigo_Provincia varchar(2) default ('06') not null,
primary key(Codigo_Banco, Codigo_Surcusal),
index nombre_indice (Codigo_Sucursal)
);

create table Cuentas (
Cod_Banco int(4),
Codigo_Sucursal int(4),
DigitoControl int(2),
Codigo_Cuenta int unique,
nif_Cliente varchar(10) not null,
fecha_Alta date default (now()) not null,
fecha_Baja date,
primary key (Cod_Banco, Codigo_Sucursal, DigitoControl, Codigo_Cuenta),
constraint fk_Nif foreign key (nif_Cliente) references Clientes(Nif) on update cascade on delete cascade,
constraint fk_CodBan foreign key (Cod_Banco) references Bancos(Cod_Banco) on update cascade on delete cascade,
constraint fk_CodSuc foreign key (Codigo_Sucursal) references Bancos(Codigo_Sucursal) on update cascade on delete cascade
);

# Modificaciones sobre la estructura inicial

# Establecer una restricción sobre la tabla bancos para que el código de provincia no pueda ser menor que 01 ni mayor que 52
alter table Bancos add Constraint ch_CodPro check (Codigo_Provincia >= 01 and Codigo_Provincia <= 52);

# Añadir un nuevo campo a la tabla cuentas, denominado "Tipo" para que podamos almacenar estos valores: L, C, O. Asignar por defecto el valor C
alter table Cuentas add Tipo enum("L", "C", "O") default ("C") after fecha_Baja;

# Crear un nuevo indice en la tabla Bancos utilizando el campo "Codigo de Provincia"
create index index1 on Bancos (Codigo_Provincia);

# Modificar el campo "Codigo de Provincia" de la tabla Bancos para que tome por defecto el valor 28
alter table Bancos modify Codigo_Provincia varchar(2) not null default(28);
