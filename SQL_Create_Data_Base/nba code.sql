SELECT * from Jugadores where procedencia="Spain" and Nombre_equipo = "Lakers" ;
select * from jugadores where (procedencia="Spain" or Procedencia = "Slovenia") and Nombre_equipo="Lakers";
select * from jugadores;
select * from jugadores where Procedencia in ("Spain", "Slovenia", "Serbia Montenegro") and Nombre_equipo=("Lakers");
select Nombre, peso as peso_Libras, peso * 0.4535 as peso_kg from jugadores where peso between 120/0.4535 and 150/0.4535;

select nombre, Nombre_equipo from jugadores where Procedencia is null;
select * from jugadores where Procedencia like '%Texa%';
select nombre, Division from equipos where Conferencia = 'East' order by Division asc, Nombre desc;

select * from jugadores where Nombre_equipo like 'R_____S';

# Selecciona los jugadores que pertenencen a los equipos de Kings, Hornets y spurs ordenados alfabéticamente;
select * from jugadores where Nombre_equipo in ("Kings", "Hornets", "spurs") order by Nombre asc;

# Seleccina los jugadores que pertenencen a un equipo que tiene una "u" en us nombre.alter
select * from jugadores where Nombre_equipo like '%u%';

# Selecciona los jugadores que se llaman Charlie
select * from jugadores where Nombre like 'Charlie%';

# cuantos jugadores hay en los bulls
select count(*) from jugadores where Nombre_equipo="bulls";

# Cuanto pesa el jugador más pesado de la nba
select max(peso) from jugadores;
select * from jugadores where Peso = (select max(peso) from jugadores);

# la media del peso de los jugadores
select avg(peso) from nba.jugadores;

select nombre, peso from nba.jugadores where peso > all(select peso from nba.jugadores where procedencia ="Spain");
select nombre, peso from nba.jugadores where posicion ='G' and (peso > any(select peso from nba.jugadores where posicion ='C'));

# cuantos jugadores hay en cada equipo
select Nombre_equipo, count(*) from jugadores group by Nombre_equipo;

# cuantos equipos hay en cada conferencia
select conferencia, count(*) from equipos group by Conferencia;

# Cuanto pesa el jugador más pesado de cada equipo
select nombre, max(peso) from jugadores group by Nombre_equipo;

# cuanto pesan de media de españa, francia e italia
select procedencia, avg(peso) from jugadores where Procedencia in ('spain', 'france', 'italy') group by Procedencia;

# seleccionar los equpos de la nba cuyos jugadores pesen de media más de 228 libras
select nombre_equipo, avg(peso) from jugadores group by Nombre_equipo having avg(peso) > 228 order by avg(peso);
select nombre_equipo, avg(peso) as media from jugadores group by Nombre_equipo having media > 228 order by media; # mejor. cambiamos avg(peso) por el nombre del campo media

# seleccionar que equipo tiene más de un jugador español
select nombre_equipo, count(*) as cuantos from jugadores where Procedencia='spain' group by Nombre_equipo having cuantos > 1;

# el jugador con máximo punto de partido por temporada
select temporada, nombre from estadisticas group by temporada having max(Puntos_por_partido);

# maximos puntos por pantidos por temporada
select temporada, max(Puntos_por_partido) from estadisticas group by temporada;

# el jugador con máximo punto de partido por temporada 
select estadisticas.temporada, jugadores.Nombre, estadisticas.Puntos_por_partido from estadisticas inner join jugadores on estadisticas.jugador = jugadores.codigo group by temporada having max(Puntos_por_partido);

# enseñar los puntos de media totales de todas las temporadas de cada jugador
select temporada, nombre, round(avg(puntos_por_partido), 2) as media from estadisticas inner join jugadores on estadisticas.jugador = jugadores.codigo  group by jugador order by media desc;

# en la temporada 2000-2001,2001-2002 y 2002-2003 los jugadores que tengan más de dos asistencia por partido
select temporada, jugador, round(avg(Asistencias_por_partido), 2) as Asistencia from estadisticas where temporada in ('00/01','01/02','02/03') group by jugador having Asistencia > 2;
