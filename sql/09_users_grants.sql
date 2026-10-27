--- ================== SECCIÓN 7 — Usuarios y permisos =====================
 
/*1.  Crea un usuario llamado 'vendedor_user'@'localhost' con una contraseña segura.*/

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'vendedor_user'
    ) THEN
        CREATE ROLE vendedor_user
            LOGIN
            PASSWORD 'Vendedor#2026_Rental!';
    END IF;
END;
$$;

/* Verifica que el usuario exista y pueda iniciar sesión. */
SELECT rolname, rolcanlogin
FROM pg_roles
WHERE rolname = 'vendedor_user';


 
/*2.  Otorga permisos de Solo Lectura (SELECT) sobre las tablas VEHICULOS, 
CATEGORIAS y SUCURSALES al usuario vendedor_user (no debe poder 
modificarlas). */

GRANT CONNECT ON DATABASE rental_cars TO vendedor_user;
GRANT USAGE ON SCHEMA public TO vendedor_user;
GRANT SELECT ON TABLE VEHICULOS, CATEGORIAS, SUCURSALES
TO vendedor_user;

 
/*3.  Otorga permisos de Lectura y Escritura (SELECT, INSERT, UPDATE, DELETE) 
sobre la tabla ALQUILERES y PAGOS al mismo usuario (porque él registra los 
alquileres y cobros).*/ 

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE ALQUILERES, PAGOS
TO vendedor_user;

 
/*4.  Crea un usuario 'admin_user'@'localhost' y otórgale TODOS LOS PRIVILEGIOS 
sobre la base de datos completa. */

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'admin_user'
    ) THEN
        CREATE ROLE admin_user
            LOGIN
            PASSWORD 'Admin#2026_Rental!';
    END IF;
END;
$$;

GRANT ALL PRIVILEGES ON DATABASE rental_cars TO admin_user;
GRANT ALL PRIVILEGES ON SCHEMA public TO admin_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_user;


/*5.  Escribe la sentencia para revocar el permiso de DELETE sobre la tabla 
ALQUILERES al usuario vendedor_user (por si borra un alquiler por error).*/

REVOKE DELETE ON TABLE ALQUILERES
FROM vendedor_user;

