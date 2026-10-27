# Sección 8 — Preguntas teóricas

## 1. Relación entre `ALQUILERES` y `SUCURSALES`

**Pregunta:**  
¿Por qué la tabla `ALQUILERES` tiene claves foráneas hacia `SUCURSALES` dos veces
(`id_sucursal_retiro` e `id_sucursal_devolucion`)? ¿Qué tipo de relación representa esto?

**Respuesta:**  
Porque un alquiler puede comenzar en una sucursal y finalizar en otra. Representa
dos relaciones muchos a uno desde `ALQUILERES` hacia `SUCURSALES`, utilizando dos
roles diferentes: sucursal de retiro y sucursal de devolución.

## 2. Eliminación de una categoría con vehículos asociados

**Pregunta:**  
Si intentamos borrar una `CATEGORIA` que tiene vehículos asociados, ¿qué debería
hacer la base de datos? ¿Por qué? Menciona al menos dos opciones (`RESTRICT`,
`CASCADE`, `SET NULL`) y justifica cuál sería la más adecuada para este modelo.

**Respuesta:**  
La base de datos debería impedir el borrado para preservar la integridad referencial.

- `RESTRICT`: bloquea el borrado si existen vehículos asociados.
- `CASCADE`: elimina automáticamente los vehículos asociados.
- `SET NULL`: conserva los vehículos, pero requiere que `CATEGORIA_ID` permita valores nulos.

Para este modelo, `RESTRICT` es la opción más adecuada porque no debería eliminar
vehículos automáticamente. Primero habría que reasignarlos o eliminarlos de forma
explícita.

## 3. Separación de `CATEGORIAS`

**Pregunta:**  
Observando la tabla `VEHICULOS`, ¿por qué la categoría está en una tabla separada
(`CATEGORIAS`) y no directamente como un campo de texto en `VEHICULOS`?

**Respuesta:**  
Porque se evita repetir nombres y descripciones, se mantienen los datos consistentes
y se pueden modificar las categorías desde un único lugar. La relación se implementa
mediante la clave foránea `VEHICULOS.CATEGORIA_ID`.

## 4. Relación entre `SUCURSALES` y `EMPLEADOS`

**Pregunta:**  
¿Qué tipo de relación existe entre `SUCURSALES` y `EMPLEADOS`? ¿Es uno a muchos,
muchos a muchos, etc.? Justifica.

**Respuesta:**  
Es una relación uno a muchos: una sucursal puede tener varios empleados, pero cada
empleado pertenece a una sola sucursal. Se implementa con `EMPLEADOS.SUCURSAL_ID`
como clave foránea.

## 5. Campo `TIPO` en `CHECK_ALQUILER`

**Pregunta:**  
¿Por qué la tabla `CHECK_ALQUILER` tiene un campo `TIPO` con valores `'salida'` o
`'entrada'` en lugar de tener dos tablas separadas? ¿Qué ventaja aporta este diseño?

**Respuesta:**  
Permite registrar en una misma tabla los distintos controles de un alquiler,
diferenciándolos mediante el campo `TIPO`. Reduce la duplicación de estructuras,
facilita las consultas y mantiene un diseño más simple y normalizado.

En los datos actuales del proyecto, los valores utilizados son `'retiro'` y
`'devolucion'`, con el mismo propósito.