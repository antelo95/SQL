create database Ejercicio18;
use Ejercicio18;
create table Hoteles(
Codigo int auto_increment,
Nombre varchar(25),
Direccion varchar(50),
primary key (Codigo)
);
create table Salas(
Codigo int auto_increment,
Medios varchar(25),
Capacidad int,
Codigo_Hotel int,
primary key (Codigo),
constraint fk_CodHotSal foreign key (Codigo_Hotel) references Hoteles(Codigo)
);
create table Paises(
Codigo int auto_increment,
Nombre varchar(25),
Numero_Clubes int,
Codigo_Pais_Representa int,
primary key (Codigo),
constraint fk_CodPaisRep foreign key (Codigo_Pais_Representa) references Paises(Codigo)
);
create table Personas(
Numero_Asociado int auto_increment,
Nombre varchar(50),
Direccion varchar(35),
Telefono varchar(25),
Tipo enum ("Jugador", "Arbitro"),
Nivel int,
Codigo_Pais int,
primary key(Numero_Asociado),
constraint fk_CodPaisPer foreign key (Codigo_Pais) references Paises(Codigo)
);
create table HotelesPersonas(
Codigo_Hotel int,
Numero_Asociado int,
primary key(Codigo_Hotel, Numero_Asociado),
constraint fk_CodHotPer foreign key (Codigo_Hotel) references Hoteles(Codigo),
constraint fk_NumAsoPer foreign key (Numero_Asociado) references Personas(Numero_Asociado)
);
create table Partidas(
Codigo int auto_increment,
Jornada varchar(5),
Codigo_Sala int,
Numero_Arbitro int,
Numero_Jugador_Blanca int,
Numero_Jugador_Negras int,
primary key (Codigo),
constraint fk_SalPar foreign key (Codigo_Sala) references Salas(Codigo),
constraint fk_NumAsoParArb foreign key (Numero_Arbitro) references Personas(Numero_Asociado),
constraint fk_NumAsoParBl foreign key (Numero_Jugador_Blanca) references Personas(Numero_Asociado),
constraint fk_NumAsoParNe foreign key (Numero_Jugador_Negras) references Personas(Numero_Asociado)
);
create table Movimientos(
Codigo int auto_increment,
Comentario text,
Codigo_Partida int,
primary key (Codigo),
constraint fk_CodParMov foreign key (Codigo_Partida) references Partidas(Codigo)
);