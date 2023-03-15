# Crear base de datos
create database if not exists Ejercicio14;

# Activar Base de datos
use Ejercicio14;

# Creaar tablas
create table if not exists Clientes(
Codigo int auto_increment,
Nombre varchar(25),
Apellidos varchar(25),
Direccion varchar(25),
Telefono varchar(8),
primary key(Codigo)
);

create table if not exists Productos(
Codigo int auto_increment,
Descripcion varchar(25),
Cantidad int(3),
Precio decimal(3,2),
primary key(Codigo)
);

create table if not exists Proveedores(
Codigo int auto_increment,
Nombre varchar(25),
Apellidos varchar(25),
Direccion varchar(25),
Provincia varchar(25),
Telefono varchar(8),
primary key(Codigo)
);

create table if not exists Compras(
Codigo_Cliente int,
Codigo_Producto int,
Fecha_Compra date,
primary key (Codigo_Cliente,Codigo_Producto),
constraint fk_CodClCom foreign key (Codigo_Cliente) references Clientes(Codigo),
constraint fk_CodPrCom foreign key (Codigo_Producto) references Productos(Codigo)
);

create table if not exists Suministra(
Codigo_Cliente int,
Codigo_Proveedor int,
primary key (Codigo_Cliente,Codigo_Proveedor),
constraint fk_CodClSum foreign key (Codigo_Cliente) references Clientes(Codigo),
constraint fk_CodPrSum foreign key (Codigo_Proveedor) references Proveedores(Codigo)
);
