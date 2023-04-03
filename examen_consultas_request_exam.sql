-- 1. Se pide el nombre y ciudad de los proveedores de Francia
select NombreCompañía, ciudad from proveedores where País like 'Francia';
-- 2. Lista alfabética de productos y categoría que no están supendidos
select productos.NombreProducto, categorias.NombreCategoria from productos inner join  categorias 
on productos.IdCategoría = categorias.IdCategoria where Suspendido = 0 order by NombreProducto desc;
-- 3. Se pide el NombreProducto y PrecioUnidad servidos por el proveedor Leka Trading
select productos.NombreProducto, productos.PrecioUnidad from productos inner join proveedores
on productos.IdProveedor = proveedores.IdProveedor where proveedores.NombreCompañía like 'Leka Trading' order by NombreProducto;
-- 4. Listado de clientes a los que ha vendido el empleado King Robert
select clientes.NombreCompania from clientes inner join pedidos
on clientes.IdCliente = pedidos.IdCliente inner join empleados on pedidos.IdEmpleado = empleados.IdEmpleado
where empleados.Apellidos like 'King' and empleados.Nombre like 'Robert' group by NombreCompania order by NombreCompania;
-- 5. El cliente que mayor número de pedidos ha realizado en el año 1996
select clientes.NombreCompania, count(*) as nPedidos from clientes inner join pedidos
on clientes.IdCliente = pedidos.IdCliente where year(FechaPedido)=1996 group by clientes.IdCliente order by nPedidos desc limit 3;
-- Hay tres compañías con el mismo número de pedidos.
-- 6. Número de pedidos vendidos por mes en el año 1997.
select date_format(pedidos.FechaPedido, '%M') as mes, count(*) as nPedidos 
from pedidos where year(FechaPedido) = 1997 group by mes;
-- 7. Facturación(dinero hecho con los pedidos) realizada en el año 1998 desglosada por mes.
select date_format(pedidos.FechaPedido, '%M') as mes, round(sum((PrecioUnidad * Cantidad) * (1 - Descuento)), 2) as Ganancias 
from pedidos inner join detalles_de_pedidos on pedidos.IdPedido = detalles_de_pedidos.IdPedido 
where year(FechaPedido) = 1998 group by mes;
-- 8. Total facturado a cada cliente en el año 1996
select clientes.NombreCompania as Cliente, round(sum((PrecioUnidad * Cantidad) * (1 - Descuento)), 2) as Ganancias 
from pedidos inner join detalles_de_pedidos on pedidos.IdPedido = detalles_de_pedidos.IdPedido 
inner join clientes on pedidos.IdCliente = clientes.IdCliente
where year(FechaPedido) = 1996 group by Cliente order by cliente;
-- 9 Los productos de qué proveedor son los que mas se han vendido.
select proveedores.NombreCompañía, sum(cantidad) as uVendidas 
from productos inner join detalles_de_pedidos
on productos.IdProducto = detalles_de_pedidos.IdProducto inner join proveedores on productos.IdProveedor = proveedores.IdProveedor 
group by proveedores.NombreCompañía order by uVendidas desc limit 1;
-- 10 Mostrar los empleados que han vendido por encima de los 150.000€.
select concat(empleados.Nombre, " ", empleados.apellidos) as empleado, round(sum((PrecioUnidad * Cantidad) * (1 - Descuento)), 2) as Euros 
from empleados inner join pedidos on empleados.IdEmpleado = pedidos.IdEmpleado
inner join detalles_de_pedidos on pedidos.IdPedido = detalles_de_pedidos.IdPedido group by empleado having Euros >150000 order by Euros desc;



