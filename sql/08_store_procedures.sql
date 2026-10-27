
 
---===========SECCIÓN 6 — Procedimientos almacenados===================== 
 
/*1.  Crea un procedimiento almacenado llamado SP_REGISTRAR_ALQUILER que 
reciba como parámetros de entrada: 
●  p_id_cliente (ID del cliente) 
●  p_id_vehiculo (ID del vehículo) 
●  p_id_empleado (ID del empleado) 
●  p_fecha_inicio (fecha de inicio del alquiler) 
●  p_fecha_fin (fecha de fin del alquiler) 
 
El procedimiento debe: 
a.  Verificar si el vehículo está disponible (estado = TRUE). Si no lo está, lanzar 
un mensaje de error. 
b.  Calcular el total multiplicando los días de alquiler por el precio_dia del 
vehículo. 
c.  Insertar el nuevo registro en la tabla ALQUILERES con estado 'activo'. 
d.  Mostrar un mensaje de éxito: "Alquiler registrado correctamente". 
*/

CREATE OR REPLACE PROCEDURE SP_REGISTRAR_ALQUILER(
    IN p_id_cliente INT,
    IN p_id_vehiculo INT,
    IN p_id_empleado INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_estado INT;
    v_precio_dia DECIMAL(9, 2);
    v_id_sucursal INT;
    v_dias INT;
    v_total DECIMAL(9, 2);
    v_id_alquiler INT;
BEGIN
    IF p_fecha_fin <= p_fecha_inicio THEN
        RAISE EXCEPTION 'La fecha de fin debe ser posterior a la fecha de inicio';
    END IF;

    SELECT ESTADO, PRECIO_DIA, SUCURSAL_ID
    INTO v_estado, v_precio_dia, v_id_sucursal
    FROM VEHICULOS
    WHERE ID = p_id_vehiculo;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'El vehículo % no existe', p_id_vehiculo;
    END IF;

    IF v_estado <> 1 THEN
        RAISE EXCEPTION 'El vehículo % no está disponible', p_id_vehiculo;
    END IF;

    v_dias := p_fecha_fin - p_fecha_inicio;
    v_total := v_dias * v_precio_dia;

    SELECT COALESCE(MAX(ID_ALQUILER), 0) + 1
    INTO v_id_alquiler
    FROM ALQUILERES;

    INSERT INTO ALQUILERES (
        ID_ALQUILER, ID_CLIENTE, ID_VEHICULO, FECHA_INICIO, FECHA_FIN,
        TOTAL, ID_EMPLEADO, ID_SUCURSAL_RETIRO, ID_SUCURSAL_DEVOLUCION, ESTADO
    )
    VALUES (
        v_id_alquiler, p_id_cliente, p_id_vehiculo, p_fecha_inicio, p_fecha_fin,
        v_total, p_id_empleado, v_id_sucursal, v_id_sucursal, 'activo'
    );

    UPDATE VEHICULOS
    SET ESTADO = 0
    WHERE ID = p_id_vehiculo;

    RAISE NOTICE 'Alquiler registrado correctamente';
END;
$$;

/* 

SELECT A.*, V.ESTADO AS ESTADO_VEHICULO
FROM ALQUILERES A
JOIN VEHICULOS V ON V.ID = A.ID_VEHICULO
WHERE A.ID_ALQUILER = (SELECT MAX(ID_ALQUILER) FROM ALQUILERES);

*/



/*2.  Crea un procedimiento almacenado llamado SP_CALCULAR_MULTA que reciba 
como parámetros de entrada: 
●  p_id_alquiler (ID del alquiler) 
●  p_motivo (motivo de la multa) 
●  p_monto (monto de la multa) 
 
El procedimiento debe: 
a.  Verificar que el alquiler exista. Si no existe, lanzar un mensaje de error. 
b.  Insertar la multa en la tabla MULTAS con pagada = FALSE y la fecha actual. 
c.  Mostrar un mensaje de éxito: "Multa registrada correctamente".
*/

CREATE OR REPLACE PROCEDURE SP_CALCULAR_MULTA(
    IN p_id_alquiler INT,
    IN p_motivo VARCHAR(120),
    IN p_monto DECIMAL(9, 2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_id_multa INT;
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM ALQUILERES
        WHERE ID_ALQUILER = p_id_alquiler
    ) THEN
        RAISE EXCEPTION 'El alquiler % no existe', p_id_alquiler;
    END IF;

    IF p_monto <= 0 THEN
        RAISE EXCEPTION 'El monto de la multa debe ser mayor que cero';
    END IF;

    SELECT COALESCE(MAX(ID), 0) + 1
    INTO v_id_multa
    FROM MULTAS;

    INSERT INTO MULTAS (ID, ID_ALQUILER, FECHA, MOTIVO, MONTO, PAGADA)
    VALUES (v_id_multa, p_id_alquiler, CURRENT_DATE, p_motivo, p_monto, 0);

    RAISE NOTICE 'Multa registrada correctamente';
END;
$$;

/* Prueba: registra una multa para el último alquiler creado y verifica el resultado. */
/*DO $$
DECLARE
    v_id_alquiler INT;
BEGIN
    SELECT MAX(ID_ALQUILER)
    INTO v_id_alquiler
    FROM ALQUILERES;

    CALL SP_CALCULAR_MULTA(
        v_id_alquiler,
        'Devolucion fuera de horario',
        15000.00
    );
END;
$$;

SELECT *
FROM MULTAS
WHERE ID = (SELECT MAX(ID) FROM MULTAS);*/