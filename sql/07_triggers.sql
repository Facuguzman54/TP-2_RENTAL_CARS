-- ======= SECCIÓN 5 — Triggers =========== 

/*1. Crea un Trigger llamado TR_AUDITAR_ALQUILER que se dispare después de 
insertar un nuevo registro en la tabla ALQUILERES e inserte un registro en 
AUDITORIA_ALQUILERES con los datos correspondientes. Para ello, antes debes 
crear la tabla con los siguientes atributos: 
● id_auditoria (autoincremental, PK) 
● id_alquiler (del alquiler insertado) 
● id_cliente (del alquiler insertado) 
● id_vehiculo (del alquiler insertado) 
● fecha_registro (fecha y hora actual del sistema) 
● accion (texto que diga "NUEVO ALQUILER") */

CREATE OR REPLACE FUNCTION FN_AUDITAR_ALQUILER()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO AUDITORIA_ALQUILERES
        (ID_ALQUILER, ID_CLIENTE, ID_VEHICULO, FECHA_REGISTRO, ACCION)
    VALUES
        (NEW.ID_ALQUILER, NEW.ID_CLIENTE, NEW.ID_VEHICULO,
         CURRENT_TIMESTAMP, 'NUEVO ALQUILER');

    RETURN NEW;
END;
$$;

CREATE TRIGGER TR_AUDITAR_ALQUILER
AFTER INSERT ON ALQUILERES
FOR EACH ROW
EXECUTE FUNCTION FN_AUDITAR_ALQUILER();


/*
INSERT INTO ALQUILERES (
    ID_ALQUILER, ID_CLIENTE, ID_VEHICULO, FECHA_INICIO,
    FECHA_FIN, TOTAL, ID_EMPLEADO,
    ID_SUCURSAL_RETIRO, ID_SUCURSAL_DEVOLUCION, ESTADO
)
VALUES (
    12, 1, 1, CURRENT_DATE, CURRENT_DATE + 3,
    84000.00, 1, 1, 1, 'reservado'
);

SELECT *
FROM AUDITORIA_ALQUILERES
WHERE ID_ALQUILER = 12;


*/

/*
2. Crea un Trigger llamado TR_ACTUALIZAR_ESTADO_VEHICULO que se dispare 
después de insertar un nuevo registro en ALQUILERES. Si el alquiler se inserta con 
estado 'activo', el trigger debe actualizar el campo estado del vehículo alquilado a 
FALSE (no disponible). 
*/

CREATE OR REPLACE FUNCTION FN_ACTUALIZAR_ESTADO_VEHICULO()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.ESTADO = 'activo' THEN
        UPDATE VEHICULOS
        SET ESTADO = 0
        WHERE ID = NEW.ID_VEHICULO;
    END IF;

    RETURN NEW;
END;
$$;
CREATE TRIGGER TR_ACTUALIZAR_ESTADO_VEHICULO
AFTER INSERT ON ALQUILERES
FOR EACH ROW
EXECUTE FUNCTION FN_ACTUALIZAR_ESTADO_VEHICULO();

/*
INSERT INTO ALQUILERES (
    ID_ALQUILER, ID_CLIENTE, ID_VEHICULO, FECHA_INICIO,
    FECHA_FIN, TOTAL, ID_EMPLEADO,
    ID_SUCURSAL_RETIRO, ID_SUCURSAL_DEVOLUCION, ESTADO
)
VALUES (
    13, 1, 2, CURRENT_DATE, CURRENT_DATE + 3,
    84000.00, 1, 1, 1, 'activo'
);

SELECT *
FROM VEHICULOS
WHERE ID = 2;
*/
