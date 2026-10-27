# Descripción del modelo de datos

## 1. ¿De qué se trata?

El proyecto modela el funcionamiento de una empresa de alquiler de vehículos.
La base de datos permite administrar clientes, vehículos, categorías, sucursales,
empleados, reservas, alquileres, controles de entrega y devolución, seguros,
pagos, multas, mantenimientos y auditorías.

El sistema está implementado en PostgreSQL y utiliza claves primarias, claves
foráneas, restricciones de integridad, triggers, procedimientos almacenados y
permisos de usuarios.

## 2. ¿Qué representa?

El modelo representa el ciclo completo de un alquiler:

1. Se registra un cliente.
2. Se administra una flota de vehículos clasificados por categoría.
3. Cada vehículo se encuentra asignado a una sucursal.
4. El cliente puede realizar una reserva.
5. Un empleado registra el alquiler.
6. Se establecen las sucursales de retiro y devolución.
7. Se registra el importe total, el estado del alquiler y los pagos.
8. Se pueden registrar controles, seguros y multas.
9. Los vehículos pueden recibir mantenimientos.
10. Los nuevos alquileres pueden quedar registrados en una tabla de auditoría.

## 3. Entidades principales

| Entidad | Descripción |
|---|---|
| `CLIENTES` | Personas que reservan o alquilan vehículos. |
| `CATEGORIAS` | Clasificaciones de los vehículos. |
| `SUCURSALES` | Oficinas donde se retiran y devuelven vehículos. |
| `VEHICULOS` | Flota disponible para alquiler. |
| `EMPLEADOS` | Personal que trabaja en las sucursales. |
| `RESERVAS` | Solicitudes anticipadas de vehículos. |
| `ALQUILERES` | Operaciones concretas de alquiler. |
| `CHECK_ALQUILER` | Controles de retiro y devolución. |
| `SEGUROS` | Coberturas asociadas a los alquileres. |
| `PAGOS` | Pagos realizados por los alquileres. |
| `MULTAS` | Cargos adicionales por incumplimientos. |
| `MANTENIMIENTOS` | Trabajos realizados sobre los vehículos. |
| `AUDITORIA_ALQUILERES` | Registro de los nuevos alquileres creados. |

## 4. Relaciones y relación inversa

La relación inversa muestra cómo se observa cada vínculo desde la entidad
relacionada. Por ejemplo, cada vehículo pertenece a una categoría, mientras que
una categoría puede tener varios vehículos.

| Relación | Relación directa | Relación inversa |
|---|---|---|
| `CATEGORIAS` - `VEHICULOS` | Cada vehículo pertenece a una categoría. | Una categoría puede incluir muchos vehículos. |
| `SUCURSALES` - `VEHICULOS` | Cada vehículo está asignado a una sucursal. | Una sucursal puede tener varios vehículos. |
| `SUCURSALES` - `EMPLEADOS` | Cada empleado pertenece a una sucursal. | Una sucursal puede tener varios empleados. |
| `CLIENTES` - `RESERVAS` | Cada reserva pertenece a un cliente. | Un cliente puede realizar varias reservas. |
| `VEHICULOS` - `RESERVAS` | Cada reserva corresponde a un vehículo. | Un vehículo puede aparecer en varias reservas. |
| `CLIENTES` - `ALQUILERES` | Cada alquiler pertenece a un cliente. | Un cliente puede realizar varios alquileres. |
| `VEHICULOS` - `ALQUILERES` | Cada alquiler utiliza un vehículo. | Un vehículo puede participar en varios alquileres a lo largo del tiempo. |
| `EMPLEADOS` - `ALQUILERES` | Cada alquiler es gestionado por un empleado. | Un empleado puede gestionar varios alquileres. |
| `SUCURSALES` - `ALQUILERES` | Cada alquiler tiene retiro y devolución. | Una sucursal puede intervenir en muchos alquileres con ambos roles. |
| `ALQUILERES` - `CHECK_ALQUILER` | Cada control pertenece a un alquiler. | Un alquiler puede tener controles de retiro y devolución. |
| `ALQUILERES` - `SEGUROS` | Cada seguro pertenece a un alquiler. | Un alquiler puede tener una o varias coberturas. |
| `ALQUILERES` - `PAGOS` | Cada pago corresponde a un alquiler. | Un alquiler puede tener uno o varios pagos. |
| `ALQUILERES` - `MULTAS` | Cada multa corresponde a un alquiler. | Un alquiler puede tener ninguna o varias multas. |
| `VEHICULOS` - `MANTENIMIENTOS` | Cada mantenimiento corresponde a un vehículo. | Un vehículo puede tener varios mantenimientos. |
| `ALQUILERES` - `AUDITORIA_ALQUILERES` | Cada auditoría registra un alquiler. | Un alquiler puede generar registros de auditoría. |

## 5. Requerimientos funcionales

El sistema debe:

1. Registrar, consultar y actualizar clientes.
2. Registrar vehículos con marca, modelo, año, precio, patente, kilometraje,
   estado, categoría y sucursal.
3. Administrar categorías, sucursales y empleados.
4. Registrar reservas con cliente, vehículo, fechas y estado.
5. Registrar alquileres con cliente, vehículo, empleado, fechas, importe,
   sucursal de retiro, sucursal de devolución y estado.
6. Verificar que un vehículo esté disponible antes de alquilarlo.
7. Calcular el total según los días y el precio diario.
8. Cambiar el estado del vehículo al iniciar un alquiler activo.
9. Registrar controles de retiro y devolución, kilometraje y combustible.
10. Registrar seguros y pagos asociados a los alquileres.
11. Registrar multas con fecha, motivo, monto y estado de pago.
12. Registrar mantenimientos y sus costos.
13. Consultar vehículos por categoría, precio, antigüedad, sucursal y estado.
14. Consultar alquileres por cliente, empleado, vehículo, estado y fechas.
15. Identificar vehículos que nunca fueron alquilados.
16. Obtener reportes agrupados por categoría, ciudad, sucursal o empleado.
17. Auditar la creación de nuevos alquileres mediante un trigger.
18. Gestionar usuarios y privilegios según sus responsabilidades.
19. Revocar operaciones sensibles, como eliminar alquileres a un vendedor.

## 6. Requerimientos no funcionales

### Integridad y consistencia

- Cada entidad debe tener una clave primaria única.
- Las relaciones deben mantenerse mediante claves foráneas.
- No deben permitirse registros relacionados con entidades inexistentes.
- Las patentes y los correos electrónicos deben ser únicos.
- No se deben eliminar registros si se rompe la integridad referencial.

### Seguridad

- El acceso debe gestionarse mediante roles y privilegios de PostgreSQL.
- `vendedor_user` debe tener solo lectura sobre vehículos, categorías y sucursales.
- `vendedor_user` debe poder gestionar alquileres y pagos sin eliminar alquileres.
- `admin_user` debe tener privilegios administrativos sobre la base de datos.
- Las contraseñas deben ser seguras y no compartirse.

### Disponibilidad y confiabilidad

- La base debe impedir el alquiler de vehículos no disponibles.
- Los procedimientos deben validar los datos antes de insertar.
- Los errores de integridad o validación deben informarse explícitamente.
- La creación de alquileres debe quedar auditada.

### Mantenibilidad

- El modelo debe evitar la duplicación mediante tablas normalizadas.
- Las categorías, sucursales y relaciones deben administrarse desde sus entidades.
- Los procedimientos y triggers deben centralizar reglas de negocio.
- Las consultas deben utilizar nombres y relaciones consistentes.

### Rendimiento y escalabilidad

- Las claves primarias y foráneas deben facilitar búsquedas y relaciones.
- El modelo debe admitir nuevos clientes, vehículos y operaciones sin cambiar su
  estructura principal.
- Los reportes deben poder ejecutarse sobre un volumen creciente de alquileres.

### Compatibilidad

- Las sentencias deben utilizar sintaxis compatible con PostgreSQL.
- Los tipos temporales deben corresponder a PostgreSQL, como `DATE` y `TIMESTAMP`.
