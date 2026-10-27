--================SECCIÓN 4 — Vistas========================= 
 
/*1.  Crea una vista llamada VW_ALQUILERES_DETALLE que muestre de forma 
"amigable" la información de los alquileres. En lugar de mostrar los IDs numéricos, 
debe mostrar: 
 
●  Fecha de inicio y fecha de fin del alquiler. 
●  Nombre completo del cliente. 
●  Marca y modelo del vehículo. 
●  Nombre del empleado que gestionó el alquiler. 
●  Nombre de la sucursal de retiro y nombre de la sucursal de devolución. 
●  Total del alquiler. */
 

CREATE VIEW VW_ALQUILERES_DETALLE AS
SELECT A.FECHA_INICIO,
       A.FECHA_FIN,
       C.NOMBRE AS CLIENTE,
       CONCAT(V.MARCA, ' ', V.MODELO) AS VEHICULO,
       E.NOMBRE AS EMPLEADO,
       SR.NOMBRE AS SUCURSAL_RETIRO,
       SD.NOMBRE AS SUCURSAL_DEVOLUCION,
       A.TOTAL
FROM ALQUILERES A
JOIN CLIENTES C ON C.ID = A.ID_CLIENTE  
JOIN VEHICULOS V ON V.ID = A.ID_VEHICULO
JOIN EMPLEADOS E ON E.ID = A.ID_EMPLEADO
JOIN SUCURSALES SR ON SR.ID = A.ID_SUCURSAL_RETIRO
JOIN SUCURSALES SD ON SD.ID = A.ID_SUCURSAL_DEVOLUCION;



/*2.  Crea una vista llamada VW_VEHICULOS_POR_SUCURSAL que muestre el nombre 
de la sucursal, la ciudad donde está y la cantidad total de vehículos que posee. Esto 
le servirá al administrador para ver rápidamente qué sede tiene más flota. */
 
CREATE VIEW VW_VEHICULOS_POR_SUCURSAL AS
SELECT S.NOMBRE AS SUCURSAL,
       S.CIUDAD,
       COUNT(V.ID) AS CANTIDAD_VEHICULOS
FROM SUCURSALES S
LEFT JOIN VEHICULOS V ON V.SUCURSAL_ID = S.ID
GROUP BY S.ID, S.NOMBRE, S.CIUDAD;

/*3. Crea una vista llamada VW_INGRESOS_POR_CATEGORIA que muestre el nombre 
de la categoría, la cantidad de alquileres finalizados y el monto total facturado por 
esa categoría (solo alquileres con estado 'finalizado'). */
CREATE VIEW VW_INGRESOS_POR_CATEGORIA AS
SELECT C.NOMBRE AS CATEGORIA,
       COUNT(A.ID_ALQUILER) AS CANTIDAD_ALQUILERES_FINALIZADOS,
       SUM(A.TOTAL) AS MONTO_TOTAL_FACTURADO
FROM CATEGORIAS C
JOIN VEHICULOS V ON V.CATEGORIA_ID = C.ID
JOIN ALQUILERES A ON A.ID_VEHICULO = V.ID
WHERE A.ESTADO LIKE 'finalizado'
GROUP BY C.ID, C.NOMBRE;

