/* SECCIÓN 2 — Consultas SELECT */

/* 1. Muestra la marca, modelo y año de todos los vehículos registrados, ordenados del
   más antiguo al más nuevo. */

SELECT MARCA, MODELO, ANIO 
FROM VEHICULOS
ORDER BY ANIO ASC;

/* 2. Obtén el nombre, email y ciudad de todos los clientes registrados el mes anterior. */
    SELECT NOMBRE, EMAIL, CIUDAD
    FROM CLIENTES
    WHERE EXTRACT(MONTH FROM FECHA_REGISTRO) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '1 month')
      AND EXTRACT(YEAR FROM FECHA_REGISTRO) = EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 month');


/* 3. Muestra la marca, modelo y precio por día de los vehículos que pertenecen a la
   categoría con id = 2. */

SELECT MARCA, MODELO, PRECIO_DIA
FROM VEHICULOS
WHERE CATEGORIA_ID = 2;

/* 4. Lista todos los datos de los empleados cuyo nombre comience con la letra "L". */

SELECT *
FROM EMPLEADOS
WHERE NOMBRE LIKE 'L%';

/* 5. Muestra el nombre y cargo de los empleados cuyo salario sea distinto a 180000.00. */

SELECT NOMBRE, CARGO
FROM EMPLEADOS
WHERE SALARIO <> 180000.00;

/* 6. Muestra la marca y modelo del vehículo junto con el nombre de su categoría. */

SELECT V.MARCA, V.MODELO, C.NOMBRE AS CATEGORIA
FROM VEHICULOS V
JOIN CATEGORIAS C ON C.ID = V.CATEGORIA_ID;

/* 7. Realiza una consulta que muestre:
    a. Fecha de inicio del alquiler (fecha_inicio)
    b. Nombre del cliente (nombre)
    c. Marca y modelo del vehículo (marca + modelo)
    d. Nombre del empleado que atendió (nombre) */

SELECT A.FECHA_INICIO,
        C.NOMBRE AS CLIENTE,
        CONCAT(V.MARCA, ' ', V.MODELO) AS VEHICULO,
        E.NOMBRE AS EMPLEADO
FROM ALQUILERES A
JOIN CLIENTES C ON C.ID = A.ID_CLIENTE
JOIN VEHICULOS V ON V.ID = A.ID_VEHICULO
JOIN EMPLEADOS E ON E.ID = A.ID_EMPLEADO;

/* 8. Muestra el nombre del cliente, su ciudad y la fecha de registro. */

SELECT NOMBRE, CIUDAD, FECHA_REGISTRO
FROM CLIENTES;

/* 9. Lista la marca, modelo del vehículo junto con el nombre de la sucursal y la ciudad
    donde se encuentra. */

SELECT V.MARCA, V.MODELO, S.NOMBRE AS SUCURSAL, S.CIUDAD
FROM VEHICULOS V
JOIN SUCURSALES S ON S.ID = V.SUCURSAL_ID;

/* 10. Muestra el nombre del alquiler y el nombre de la sucursal de retiro y la de devolución
     (pueden ser distintas). */

SELECT A.ID_ALQUILER AS ALQUILER,
        SR.NOMBRE AS SUCURSAL_RETIRO,
        SD.NOMBRE AS SUCURSAL_DEVOLUCION
FROM ALQUILERES A
JOIN SUCURSALES SR ON SR.ID = A.ID_SUCURSAL_RETIRO
JOIN SUCURSALES SD ON SD.ID = A.ID_SUCURSAL_DEVOLUCION;

/* 11. ¿Cuántos vehículos hay registrados por cada categoría? Muestra el nombre de la
    categoría y la cantidad. */

SELECT C.NOMBRE AS CATEGORIA, COUNT(V.ID) AS CANTIDAD_VEHICULOS
FROM CATEGORIAS C
LEFT JOIN VEHICULOS V ON V.CATEGORIA_ID = C.ID
GROUP BY C.ID, C.NOMBRE
ORDER BY C.NOMBRE;

/* 12. Calcula el precio promedio por día de los vehículos agrupados por categoría. */

SELECT C.NOMBRE AS CATEGORIA, AVG(V.PRECIO_DIA) AS PRECIO_PROMEDIO_DIA
FROM CATEGORIAS C
JOIN VEHICULOS V ON V.CATEGORIA_ID = C.ID
GROUP BY C.ID, C.NOMBRE
ORDER BY C.NOMBRE;

/* 13. Muestra el nombre del empleado y cuántos alquileres ha gestionado en total
    (ordenado de mayor a menor). */

SELECT E.NOMBRE, COUNT(A.ID_ALQUILER) AS CANTIDAD_ALQUILERES
FROM EMPLEADOS E
LEFT JOIN ALQUILERES A ON A.ID_EMPLEADO = E.ID
GROUP BY E.ID, E.NOMBRE
ORDER BY CANTIDAD_ALQUILERES DESC, E.NOMBRE;

/* 14. Lista los clientes que tienen más de 1 alquiler registrado en el sistema. */

SELECT C.NOMBRE, COUNT(A.ID_ALQUILER) AS CANTIDAD_ALQUILERES
FROM CLIENTES C
JOIN ALQUILERES A ON A.ID_CLIENTE = C.ID
GROUP BY C.ID, C.NOMBRE
HAVING COUNT(A.ID_ALQUILER) > 1;

/* 15. Muestra el nombre de la ciudad y la cantidad de sucursales que hay en cada una. */

SELECT CIUDAD, COUNT(*) AS CANTIDAD_SUCURSALES
FROM SUCURSALES
GROUP BY CIUDAD
ORDER BY CIUDAD;

/* 16. Muestra la marca, modelo y año del vehículo más antiguo de la flota. */

SELECT MARCA, MODELO, ANIO
FROM VEHICULOS
WHERE ANIO = (SELECT MIN(ANIO) FROM VEHICULOS);

/* 17. Lista los vehículos que nunca han sido alquilados. */

SELECT V.MARCA, V.MODELO, V.PATENTE
FROM VEHICULOS V
WHERE NOT EXISTS (
     SELECT 1
     FROM ALQUILERES A
     WHERE A.ID_VEHICULO = V.ID
);

/* 18. Muestra los alquileres cuyo estado sea 'activo' y que hayan comenzado en el mes de
     octubre de 2025. */

SELECT *
FROM ALQUILERES
WHERE ESTADO = 'activo'
  AND FECHA_INICIO >= DATE '2025-10-01'
  AND FECHA_INICIO < DATE '2025-11-01';

/* 19. Muestra los 3 vehículos con el precio por día más alto. */

SELECT MARCA, MODELO, PRECIO_DIA
FROM VEHICULOS
ORDER BY PRECIO_DIA DESC
LIMIT 3;

/* 20. Muestra la cantidad total de multas pagadas y el monto total recaudado por multas
     pagadas. */

SELECT COUNT(*) AS CANTIDAD_MULTAS_PAGADAS,
        SUM(MONTO) AS MONTO_TOTAL_RECAUDADO
FROM MULTAS
WHERE PAGADA = 1;


/*======= SECCIÓN 3 — Operaciones DML ========*/

/*
1. Nuevo cliente: Inserta un nuevo cliente en la tabla CLIENTES (inventa los datos,
    asígnale una licencia nueva y una ciudad existente en el sistema).
*/
INSERT INTO CLIENTES (ID, NOMBRE, EMAIL, TELEFONO, CIUDAD, FECHA_REGISTRO, LICENCIA_CONDUCIR)
VALUES
(12, 'matias gonzalez', 'matias.gonzalez@example.com', '2645412125', 'San Juan', CURRENT_DATE, 'BUE-100099');

/*
2. Actualizar salario: Actualiza el salario a 200000.00 para todos los empleados cuyo
    cargo sea 'Vendedor' o 'Vendedora' y que hayan ingresado antes del 2021-01-01.
*/

UPDATE EMPLEADOS
SET SALARIO = 200000.00
WHERE CARGO LIKE 'Vendedor%'
  AND FECHA_INGRESO < DATE '2021-01-01';

/*
3. Borrar vehículo: Elimina un vehículo específico de la tabla VEHICULOS (asegúrate
    de que no tenga alquileres, reservas ni mantenimientos asociados para evitar error
    de integridad referencial).
*/
DELETE FROM VEHICULOS
WHERE ID = 11;;  

/*
4. Cambio de sucursal: Actualiza el id_sucursal de un vehículo específico porque fue
    trasladado a otra sucursal.
*/

UPDATE VEHICULOS
SET SUCURSAL_ID = 3
WHERE ID = 5;   