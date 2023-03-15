drop database prueba2;
create database prueba2;
use prueba2;
create table nueva(
id int(4) auto_increment primary key,
nombre varchar(10),
edad int(3)
);

create table proveedores(
dni varchar(9) primary key,
nombre varchar(10),
edad int(3)
);
insert into prueba2.nueva (`nombre`, `edad`) values ('Goofy', 25);
insert into prueba2.nueva (`nombre`, `edad`) values ('Mickey', 52);
insert into prueba2.nueva (nombre, edad) values ('Donald', 35);
insert into prueba2.nueva values (``,'Mickey', 52); -- asi no funciona porque el campo id es autoincrement y no se puede añadir valores.

insert into prueba2.proveedores (dni, `nombre`, `edad`) values ('0585862', 'Goofy', 25);
insert into prueba2.proveedores values ('12258f', 'Mickey', 52);

alter table prueba2.nueva add check (edad between 0 and 100);
nuevaedad
select * from prueba2.nueva;
select * from prueba2.proveedores;