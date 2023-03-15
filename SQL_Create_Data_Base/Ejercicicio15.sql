Create database if not exists Ejercicio15;

use Ejercicio15;

create table if not exists Personas(
DNI varchar(9),
Nombre varchar(25),
Direccion varchar(25),
Telefono varchar(25),
primary key(DNI)
);

create table if not exists PersonasHijos(
DNI_Persona varchar(9),
DNI_Hijo varchar(9),
primary key (DNI_Persona,DNI_Hijo),
constraint fk_DniPer foreign key (DNI_Persona) references Personas(DNI),
constraint fk_DniHij foreign key (DNI_Hijo) references Personas(DNI)
);