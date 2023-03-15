# Crear base de datos
create database if not exists Ejercicio09;

# Activar base de datos
use Ejercicio09;

# Crear tablas
create table if not exists Equipos(
Codigo varchar(9),
Nombre varchar(35),
Estadio varchar(35),
Aforo int,
Ciudad varchar(35),
año_fundacion Date,
primary key (Codigo)
);

create table if not exists Jugadores(
Codigo varchar(9),
Nombre varchar(35),
Apellido1 varchar(35),
Apellido2 varchar(35),
Fecha_nacimiento date,
Posicion enum("Portero", "Defensa", "Delantero"),
Codigo_Equipo varchar(9),
primary key (Codigo),
constraint fk_CodEqui foreign key (Codigo_Equipo) references Equipos (Codigo)
);

create table if not exists Presidentes(
DNI varchar(9),
Nombre varchar(35),
Apellido1 varchar(35),
Apellido2 varchar(35),
Codigo_Equipo varchar(9),
primary key (DNI),
constraint fk_CodEquiPre foreign key (Codigo_Equipo) references Equipos (Codigo)
);

create table if not exists Goles(
Codigo varchar(9),
Descripcion text,
minuto int,
Codigo_Jugador varchar(9),
primary key (Codigo),
constraint fk_CodJugador foreign key (Codigo_Jugador) references Jugadores (Codigo)
);

create table if not exists Partidos(
Codigo varchar(9),
fecha date,
Goles_Casa varchar(9),
Goles_visitante varchar(9),
Codigo_Equipo_Local varchar(9),
Codigo_Equipo_Visitante varchar(9),
primary key (Codigo),
constraint fk_GolesFavor foreign key (Codigo_Equipo_Local) references Goles(Codigo),
constraint fk_GolesContra foreign key (Codigo_Equipo_Visitante) references Goles(Codigo)
);

# modificar tabla goles para crear la relación con Partidos
alter table Goles add Codigo_Partido varchar(9) references Partido(Codigo);

# modificaciones extras

# Queremos que el campo psicion de la talbla equipo solamente pueda ser uno de los valores
# siguientes: Portero, Defensa, Medio y Delantero
alter table Jugadores modify Posicion enum ("Portero", "Defensa", "Medio", "Delantero");

/* Borrar en la tabla jugadores el campo apellido2 y renombrar apellido1 por apellidos */
alter table Jugadores drop Apellido2;
alter table Jugadores rename column Apellido1 to Apellidos;
/* alter table Jugadores Change Apellido1 Apellidos varchar(50); */