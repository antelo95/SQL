drop database Ejercicio3_3;

# Crear base de datos
create database if not exists Ejercicio3_3;

# Activar base de datos
use Ejercicio3_3;

# Crear tablas
create table Empleados(
DNI varchar(9),
Nombre varchar(25) not null,
Apellido1 varchar(25) not null,
Apellido2 varchar(25),
Direcc1 varchar(25),
Direcc2 varchar(25),
Ciudad varchar(15),
Provincia varchar(15),
Cod_Postal int(5) zerofill,
sexo enum ('M', 'H'),
Fecha_Nac date,
constraint pk_Emple primary key (DNI)
);

create table Trabajos(
Trabajo_Cod int(4) auto_increment,
Nombre_Trab varchar(25) not null unique,
Salario_min decimal(6,2) not null,
Salaraio_max decimal(6,2) not null,
primary key (Trabajo_Cod)
);

create table Departamentos(
Dpto_cod int(4),
Nombre_Dpto varchar(15) unique,
Dpto_Padre int(4),
Presupuesto decimal(10,2) not null,
Pres_Actual decimal(10,2) not null,
primary key(Dpto_cod),
constraint fk_DptPad foreign key (Dpto_Padre) references Departamentos (Dpto_cod) on update cascade on delete cascade
);

create table Estudios(
Empleado_Dni varchar(9),
Universidad varchar(20),
año int(4),
grado varchar(25),
especialidad varchar(25),
primary key (Empleado_Dni),
constraint fk_EmplDniEst foreign key(Empleado_Dni) references Empleados(DNI) on update cascade on delete cascade
);

create table Historial_Laboral(
Empleado_Dni varchar(9),
Trabajo_Cod int(4),
Fecha_Inicio date,
Fecha_Fin date,
Dpto_Cod int(4),
Supervisor_Dni varchar(9),
primary key (Empleado_Dni, Trabajo_Cod, Fecha_Inicio),
constraint fk_EmpDniHis foreign key (Empleado_Dni) references Empleados (DNI) on update cascade on delete cascade,
constraint fk_EmpSupe foreign key (Empleado_Dni) references Empleados (DNI) on update cascade on delete cascade
);

create table Historial_Salarial(
Empleado_Dni varchar(9),
Salario decimal(6,2),
Fecha_Comienzo date,
Fecha_Fin date,
primary key (Empleado_Dni, Salario, Fecha_Comienzo),
constraint fk_EmpDniHisSal foreign key (Empleado_Dni) references Empleados (DNI) on update cascade on delete cascade
);

create table Universidades(
univ_cod int(6),
Nombre_univ varchar(25),
ciudad varchar(20),
municipio varchar(20),
cod_postal int(5) zerofill,
primary key (univ_cod)
);

# 1.-Insertar dos filas en cada tabla
INSERT INTO `ejercicio3_3`.`departamentos` (`Dpto_cod`, `Nombre_Dpto`, `Dpto_Padre`, `Presupuesto`, `Pres_Actual`) VALUES ('1000', 'Finanzas', '1300', '1000000', '900000');
INSERT INTO `ejercicio3_3`.`departamentos` (`Dpto_cod`, `Nombre_Dpto`, `Dpto_Padre`, `Presupuesto`, `Pres_Actual`) VALUES ('1001', 'RRHH', '1300', '10000', '9000');
INSERT INTO `ejercicio3_3`.`departamentos` (`Dpto_cod`, `Nombre_Dpto`, `Dpto_Padre`, `Presupuesto`, `Pres_Actual`) VALUES ('1300', 'Gerencia', '1300', '10000', '9000');

INSERT INTO `ejercicio3_3`.`empleados` (`DNI`, `Nombre`, `Apellido1`, `Direcc1`, `Ciudad`, `Provincia`, `Cod_Postal`, `sexo`, `Fecha_Nac`) VALUES ('12345678K', 'Ernesto', 'Savater', 'Calle El paso 8', 'Zaragoza', 'Zaragoza', '50001', 'H', '2000-01-01');
INSERT INTO `ejercicio3_3`.`empleados` (`DNI`, `Nombre`, `Apellido1`, `Direcc1`, `Ciudad`, `Provincia`, `Cod_Postal`, `sexo`, `Fecha_Nac`) VALUES ('17345678K', 'Mickey', 'Mouse', 'Calle la polca', 'Badajoz', 'Badajoz', '06009', 'H', '1934-01-01');

INSERT INTO `ejercicio3_3`.`estudios` (`Empleado_Dni`, `Universidad`, `año`, `grado`, `especialidad`) VALUES ('12345678K', 'Complutense', '2018', 'Informática', 'Informacion');
INSERT INTO `ejercicio3_3`.`estudios` (`Empleado_Dni`, `Universidad`, `año`, `grado`, `especialidad`) VALUES ('17345678K', 'Complutense', '2018', 'Informática', 'Informacion');

INSERT INTO `ejercicio3_3`.`historial_laboral` (`Empleado_Dni`, `Trabajo_Cod`, `Fecha_Inicio`, `Dpto_Cod`, `Supervisor_Dni`) VALUES ('12345678K', '1000', '2000/11/23', '1000', '');
INSERT INTO `ejercicio3_3`.`historial_laboral` (`Empleado_Dni`, `Trabajo_Cod`, `Fecha_Inicio`, `Dpto_Cod`, `Supervisor_Dni`) VALUES ('17345678K', '1100', '2000-11-23', '1001', '');

INSERT INTO `ejercicio3_3`.`historial_salarial` (`Empleado_Dni`, `Salario`, `Fecha_Comienzo`) VALUES ('12345678K', '1345.54', '2000-2-23');
INSERT INTO `ejercicio3_3`.`historial_salarial` (`Empleado_Dni`, `Salario`, `Fecha_Comienzo`) VALUES ('17345678K', '900.54', '2000-2-23');

INSERT INTO `ejercicio3_3`.`trabajos` (`Trabajo_Cod`, `Nombre_Trab`, `Salario_min`, `Salaraio_max`) VALUES ('1000', 'Funcionario', '900', '1500');
INSERT INTO `ejercicio3_3`.`trabajos` (`Trabajo_Cod`, `Nombre_Trab`, `Salario_min`, `Salaraio_max`) VALUES ('1100', 'Secretariauniversidades', '900', '1500');

INSERT INTO `ejercicio3_3`.`universidades` (`univ_cod`, `Nombre_univ`, `ciudad`, `municipio`, `cod_postal`) VALUES ('1234', 'Complutense', 'Madrid', 'Madrid', '28080');
INSERT INTO `ejercicio3_3`.`universidades` (`univ_cod`, `Nombre_univ`, `ciudad`, `municipio`, `cod_postal`) VALUES ('2234', 'Uex', 'Badajoz', 'Badajoz', '06007');

# Insertar empleados e Historial Laboral
INSERT INTO `ejercicio3_3`.`empleados` (`DNI`, `Nombre`, `Apellido1`, `sexo`) VALUES ('111222', 'Sergio', 'Palma', 'P');
INSERT INTO `ejercicio3_3`.`empleados` (`DNI`, `Nombre`, `Apellido1`) VALUES ('222333', 'Lucia', 'Ortega');
-- Fallo al introducir el primer registro. El sexo no puede ser P

INSERT INTO `ejercicio3_3`.`historial_laboral` (`Empleado_Dni`, `Fecha_Inicio`, `Dpto_Cod`) VALUES ('111222', '1996/06/16', '222333');
-- Falla al introducirla porque no tiene la referencia del departamento codigo

# 3.-  que ocurre si se modifica esta última fila de historial laboral asignándole al empleado 111222 un supervisor que no existe en la tabla de empleados
INSERT INTO `ejercicio3_3`.`historial_laboral` (`Empleado_Dni`, `Fecha_Inicio`, `Dpto_Cod`, `Supervisor_Dni`) VALUES ('111222', '1996/06/16', '1001', '222222');
-- Falla al introducirlo porque no está creado el dni del supervisor

# 4.- Borre una uviversidad de la tabla UNIVERSIDADES ¿Que le sucede a la restricción de la clave ajena de la tabla estudios?
# Altere la definición de la tabla para que se mantenga la restriccion, aunque se borre una universidad
DELETE FROM `ejercicio3_3`.`universidades` WHERE (`univ_cod` = '1234');

# 5.- el valor del Cod_Postal como mínimo 02000 y como máximo 529999
alter table ejercicio3_3.empleados add check (Cod_Postal > 02000 and Cod_Postal < 52999);
alter table ejercicio3_3.universidades add check (Cod_Postal > 02000 and Cod_Postal < 52999);

# 6.- Añada un nuevo atributo VALORACIÓN en la tabla de EMPLEADOS que indique de 1 a 10 la valoración que obtuvo el empleado en su entrevista de trabajo al iniciar su
# andadura en la empresa. Ponga el valor por defecto 5 para ese campo
alter table ejercicio3_3.empleados add valoracion int(2) default (5);
alter table ejercicio3_3.empleados add check (Valoracion >= 1 and valoracion <=10);

# 7.- Elimine la restricción de que el atributo NOMBRE de la tabla EMPLEADOS no puede ser nulo.
alter table ejercicio3_3.empleados modify nombre varchar (20);

# 8.- Modificar el tipo de datos de DIREC1 de la tabla EMPLEADOS a cadena de caracteres de 40 como máximo.
alter table ejercicio3_3.empleados modify Direcc1 varchar(40);

# 9.- ¿Podría modificar el tipo de datos del atributo FECHA_NAC de la tabla EMPLEADOS Y convertirla a tipo cadena?
alter table ejercicio3_3.empleados modify Fecha_Nac varchar(10);
-- Si se puede realizar. Toma los datos internos y los transforma en textos.

# 10.- Cambiar la clave primaria de EMPLEADOS al NOMBRE y los dos APELLIDOS.
alter table ejercicio3_3.empleados drop primary key;
alter table ejercicio3_3.empleados add primary key (Nombre, Apellido1, Apellido2)
-- para poder modificar la primary key se debe eliminar primero y despues crearla para añadir los campos nuevos
-- pero no es posible realizarlo ya que la primary key son claves foraneas de otras tabla y no se permite eliminarla






