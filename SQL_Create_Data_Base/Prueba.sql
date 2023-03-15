# Crear base de datos El apaerativo "if not exists" es que si existe no ejecuta la creacion de la tabla
CREATE DATABASE if not exists prueba;
# activar base de datos con la que trabajar
use prueba;
# Crear tablas
create table if not exists clientes(
dni varchar(9) not null,
nombre varchar(50) not null,
direccion varchar(60) default "ya te lo diré",
# Se declara al final de los campos las restricciones como la clave principal o foráneas
# si son dos campos como clave principales se pone "primary key(dni, nombre)"
primary key (dni));

create table if not exists mascotas(
 codigo integer,
 nombre varchar(50),
 raza varchar(50),
 dni_cliente varchar(50),
 # la clave foreanea se escribe como esto
 foreign key (dni_cliente) references clientes (dni)
 # estas claves foraneas tiene opciones tales como:
		on delete cascade on update set null,
        # esto significa que si la clave foraranea se borra se actuarice en cascada, es decir, se borran TODOS LOS REGISTROS
        # si se actualiza, el campo se cambia a null
 # pero también se podía haber crado a la misma vez que se crea el campo tal y como:
 # dni_cliente varchar(50) references clientes (dni)
 # la clave foranea debe ser igual que el tipo de datos al que hace referencia
 primary key (codigo));
