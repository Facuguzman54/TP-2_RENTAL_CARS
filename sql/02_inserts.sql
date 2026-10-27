/* ========== ENTIDAD: CATEGORIA ========== */

INSERT INTO CATEGORIAS (ID, NOMBRE, DESCRIPCION) VALUES
(1, 'Economico', 'Vehiculos compactos para uso urbano'),
(2, 'Sedan', 'Vehiculos comodos para viajes y uso diario'),
(3, 'SUV', 'Vehiculos amplios para familias y viajes'),
(4, 'Pickup', 'Vehiculos utilitarios con caja de carga'),
(5, 'Lujo', 'Vehiculos premium con equipamiento superior'),
(6, 'Deportivo', 'Vehiculos de altas prestaciones'),
(7, 'Electrico', 'Vehiculos propulsados exclusivamente por electricidad'),
(8, 'Hibrido', 'Vehiculos con motor electrico y de combustion'),
(9, 'Familiar', 'Vehiculos con amplio espacio interior'),
(10, 'Van', 'Vehiculos para grupos y transporte de pasajeros');

/* ========== ENTIDAD: SUCURSAL ========== */

INSERT INTO SUCURSALES (ID, NOMBRE, DIRECCION, CIUDAD, TELEFONO) VALUES
(1, 'Centro', 'Av. Corrientes 1250', 'Buenos Aires', '011-4567-1001'),
(2, 'Palermo', 'Av. Santa Fe 3450', 'Buenos Aires', '011-4567-1002'),
(3, 'Belgrano', 'Av. Cabildo 2100', 'Buenos Aires', '011-4567-1003'),
(4, 'Rosario', 'Bv. Oroño 850', 'Rosario', '0341-456-1004'),
(5, 'Cordoba', 'Av. Colon 1550', 'Cordoba', '0351-456-1005'),
(6, 'Mendoza', 'Av. San Martin 980', 'Mendoza', '0261-456-1006'),
(7, 'Mar del Plata', 'Av. Independencia 2200', 'Mar del Plata', '0223-456-1007'),
(8, 'La Plata', 'Calle 7 980', 'La Plata', '0221-456-1008'),
(9, 'Salta', 'Av. Belgrano 640', 'Salta', '0387-456-1009'),
(10, 'Bariloche', 'Av. Bustillo 1200', 'Bariloche', '0294-456-1010');

/* ========== ENTIDAD: CLIENTE ========== */

INSERT INTO CLIENTES (ID, NOMBRE, EMAIL, TELEFONO, CIUDAD, FECHA_REGISTRO, LICENCIA_CONDUCIR) VALUES
(1, 'Ana Martinez', 'ana.martinez@example.com', '1155551001', 'Buenos Aires', '2025-01-15', 'BUE-100001'),
(2, 'Bruno Fernandez', 'bruno.fernandez@example.com', '1155551002', 'Buenos Aires', '2025-02-20', 'BUE-100002'),
(3, 'Carla Gonzalez', 'carla.gonzalez@example.com', '3415551003', 'Rosario', '2025-03-10', 'ROS-100003'),
(4, 'Diego Rodriguez', 'diego.rodriguez@example.com', '3515551004', 'Cordoba', '2025-04-05', 'COR-100004'),
(5, 'Elena Lopez', 'elena.lopez@example.com', '2615551005', 'Mendoza', '2025-05-18', 'MEN-100005'),
(6, 'Facundo Perez', 'facundo.perez@example.com', '2235551006', 'Mar del Plata', '2025-06-22', 'MDP-100006'),
(7, 'Gabriela Sanchez', 'gabriela.sanchez@example.com', '2215551007', 'La Plata', '2025-07-12', 'LPL-100007'),
(8, 'Hernan Romero', 'hernan.romero@example.com', '3875551008', 'Salta', '2025-08-08', 'SAL-100008'),
(9, 'Ines Torres', 'ines.torres@example.com', '2945551009', 'Bariloche', '2025-09-14', 'BAR-100009'),
(10, 'Javier Silva', 'javier.silva@example.com', '1155551010', 'Buenos Aires', '2025-10-01', 'BUE-100010'),
(11, 'Micaela Ruiz', 'micaela.ruiz@example.com', '1155551011', 'Buenos Aires','2026-9-01', 'BUE-100011');


/* ========== ENTIDAD: VEHICULO ========== */

INSERT INTO VEHICULOS (ID, MARCA, MODELO, ANIO, PRECIO_DIA, ESTADO, CATEGORIA_ID, SUCURSAL_ID, PATENTE, KM_ACTUAL) VALUES
(1, 'Toyota', 'Etios', 2020, 28000.00, 1, 1, 1, 'AA123AA', 45200),
(2, 'Volkswagen', 'Vento', 2021, 42000.00, 1, 2, 2, 'AB234BB', 31800),
(3, 'Jeep', 'Renegade', 2022, 56000.00, 1, 3, 3, 'AC345CC', 22600),
(4, 'Ford', 'Ranger', 2021, 65000.00, 1, 4, 4, 'AD456DD', 40100),
(5, 'BMW', '320i', 2023, 95000.00, 1, 5, 5, 'AE567EE', 12400),
(6, 'Audi', 'A3', 2022, 88000.00, 1, 6, 6, 'AF678FF', 18900),
(7, 'Nissan', 'Leaf', 2023, 72000.00, 1, 7, 7, 'AG789GG', 9800),
(8, 'Toyota', 'Corolla Cross', 2022, 61000.00, 1, 8, 8, 'AH890HH', 17600),
(9, 'Chevrolet', 'Spin', 2020, 39000.00, 1, 9, 9, 'AI901II', 53400),
(10, 'Mercedes-Benz', 'Sprinter', 2021, 78000.00, 0, 10, 10, 'AJ012JJ', 36700),
(11, 'Renault', 'Duster', 2024, 50000.00, 1, 3, 1, 'AK123KK', 8200);

/* ========== ENTIDAD: EMPLEADO ========== */

INSERT INTO EMPLEADOS (ID, NOMBRE, CARGO, SUCURSAL_ID, FECHA_INGRESO, SALARIO) VALUES
(1, 'Laura Acosta', 'Gerente', 1, '2025-02-10', 250000.00),
(2, 'Martin Benitez', 'Asesor de alquileres', 2, '2025-06-15', 180000.00),
(3, 'Lucia Castro', 'Asesora de alquileres', 3, '2025-01-20', 195000.00),
(4, 'Nicolas Diaz', 'Jefe de flota', 4, '2025-11-05', 230000.00),
(5, 'Olivia Escobar', 'Administrativa', 5, '2025-03-12', 165000.00),
(6, 'Pablo Flores', 'Asesor de alquileres', 6, '2025-08-18', 185000.00),
(7, 'Rocio Gimenez', 'Administrativa', 7, '2025-09-01', 172000.00),
(8, 'Santiago Herrera', 'Jefe de sucursal', 8, '2025-07-27', 240000.00),
(9, 'Valentina Ibarra', 'Asesora de alquileres', 9, '2025-05-09', 178000.00),
(10, 'Luis Juarez', 'Mecanico', 10, '2025-04-16', 210000.00),
(11, 'Ricardo Molina', 'Vendedor de alquileres', 1, '2020-12-15', 185000.00);

/* ========== ENTIDAD: ALQUILER ========== */

INSERT INTO ALQUILERES (ID_ALQUILER, ID_CLIENTE, ID_VEHICULO, FECHA_INICIO, FECHA_FIN, TOTAL, ID_EMPLEADO, ID_SUCURSAL_RETIRO, ID_SUCURSAL_DEVOLUCION, ESTADO) VALUES
(1, 1, 1, '2025-09-02', '2025-09-05', 84000.00, 1, 1, 1, 'finalizado'),
(2, 2, 2, '2025-09-10', '2025-09-14', 168000.00, 2, 2, 3, 'finalizado'),
(3, 3, 3, '2025-10-03', '2025-10-07', 224000.00, 3, 3, 4, 'activo'),
(4, 4, 4, '2025-10-12', '2025-10-15', 195000.00, 4, 4, 5, 'finalizado'),
(5, 5, 5, '2025-10-20', '2025-10-23', 285000.00, 5, 5, 5, 'activo'),
(6, 6, 6, '2025-11-01', '2025-11-04', 264000.00, 6, 6, 7, 'finalizado'),
(7, 7, 7, '2025-11-08', '2025-11-12', 288000.00, 7, 7, 8, 'finalizado'),
(8, 8, 8, '2025-11-15', '2025-11-18', 183000.00, 8, 8, 9, 'activo'),
(9, 9, 9, '2025-12-01', '2025-12-06', 195000.00, 9, 9, 10, 'finalizado'),
(10, 10, 10, '2025-12-10', '2025-12-13', 234000.00, 10, 10, 1, 'reservado'),
(11, 1, 2, '2026-01-10', '2026-01-14', 168000.00, 1, 2, 2, 'finalizado');

/* ========== ENTIDAD: CHECK_ALQUILER ========== */

INSERT INTO CHECK_ALQUILER (ID, ID_ALQUILER, TIPO, FECHA, KM, NIVEL_COMBUSTIBLE) VALUES
(1, 1, 'retiro', '2025-09-02', 45200, 90),
(2, 2, 'devolucion', '2025-09-14', 32100, 75),
(3, 3, 'retiro', '2025-10-03', 22600, 100),
(4, 4, 'devolucion', '2025-10-15', 40750, 60),
(5, 5, 'retiro', '2025-10-20', 12400, 95),
(6, 6, 'devolucion', '2025-11-04', 19400, 80),
(7, 7, 'retiro', '2025-11-08', 9800, 100),
(8, 8, 'devolucion', '2025-11-18', 18200, 70),
(9, 9, 'retiro', '2025-12-01', 53400, 85),
(10, 10, 'devolucion', '2025-12-13', 37200, 65),
(11, 11, 'retiro', '2026-01-10', 31800, 95);

/* ========== ENTIDAD: RESERVA ========== */

INSERT INTO RESERVAS (ID, ID_CLIENTE, ID_VEHICULO, FECHA_RESERVA, FECHA_INICIO, FECHA_FIN, ESTADO) VALUES
(1, 1, 2, '2025-08-01', '2025-08-10', '2025-08-13', 'confirmada'),
(2, 2, 3, '2025-08-05', '2025-08-15', '2025-08-18', 'finalizada'),
(3, 3, 4, '2025-08-12', '2025-08-22', '2025-08-25', 'cancelada'),
(4, 4, 5, '2025-09-01', '2025-09-20', '2025-09-23', 'finalizada'),
(5, 5, 6, '2025-09-08', '2025-10-01', '2025-10-04', 'confirmada'),
(6, 6, 7, '2025-09-15', '2025-10-10', '2025-10-14', 'finalizada'),
(7, 7, 8, '2025-10-01', '2025-11-01', '2025-11-05', 'confirmada'),
(8, 8, 9, '2025-10-10', '2025-11-10', '2025-11-14', 'cancelada'),
(9, 9, 1, '2025-11-01', '2025-12-01', '2025-12-05', 'finalizada'),
(10, 10, 10, '2025-11-10', '2025-12-20', '2025-12-23', 'confirmada');

/* ========== ENTIDAD: MANTENIMIENTO ========== */

INSERT INTO MANTENIMIENTOS (ID, ID_VEHICULO, FECHA, TIPO, COSTO, OBSERVACIONES) VALUES
(1, 1, '2025-01-20', 'Cambio de aceite', 85000.00, 'Se reemplazaron aceite y filtros'),
(2, 2, '2025-02-15', 'Revision de frenos', 120000.00, 'Pastillas delanteras reemplazadas'),
(3, 3, '2025-03-12', 'Alineacion', 45000.00, 'Alineacion y balanceo realizados'),
(4, 4, '2025-04-18', 'Service general', 180000.00, 'Service preventivo completo'),
(5, 5, '2025-05-22', 'Cambio de neumaticos', 560000.00, 'Se instalaron cuatro neumaticos nuevos'),
(6, 6, '2025-06-10', 'Revision electrica', 95000.00, 'Diagnostico del sistema electrico'),
(7, 7, '2025-07-08', 'Revision de bateria', 110000.00, 'Bateria revisada y calibrada'),
(8, 8, '2025-08-19', 'Cambio de aceite', 90000.00, 'Se reemplazaron aceite y filtros'),
(9, 9, '2025-09-25', 'Reparacion de suspension', 235000.00, 'Se reemplazaron amortiguadores'),
(10, 10, '2025-10-30', 'Service general', 210000.00, 'Mantenimiento preventivo de rutina');

/* ========== ENTIDAD: SEGURO ========== */

INSERT INTO SEGUROS (ID, ID_ALQUILER, COMPANIA, NUMERO_POLIZA, COBERTURA, COSTO) VALUES
(1, 1, 'La Caja', 'POL-2024-0001', 'Responsabilidad civil y terceros', 18000.00),
(2, 2, 'Sancor Seguros', 'POL-2024-0002', 'Cobertura contra terceros completa', 22000.00),
(3, 3, 'Federacion Patronal', 'POL-2024-0003', 'Todo riesgo con franquicia', 35000.00),
(4, 4, 'Provincia Seguros', 'POL-2024-0004', 'Responsabilidad civil y robo', 26000.00),
(5, 5, 'La Segunda', 'POL-2024-0005', 'Todo riesgo con franquicia', 42000.00),
(6, 6, 'La Caja', 'POL-2024-0006', 'Responsabilidad civil y terceros', 30000.00),
(7, 7, 'Sancor Seguros', 'POL-2024-0007', 'Cobertura contra terceros completa', 32000.00),
(8, 8, 'Federacion Patronal', 'POL-2024-0008', 'Todo riesgo con franquicia', 38000.00),
(9, 9, 'Provincia Seguros', 'POL-2024-0009', 'Responsabilidad civil y robo', 24000.00),
(10, 10, 'La Segunda', 'POL-2024-0010', 'Todo riesgo con franquicia', 41000.00),
(11, 11, 'La Caja', 'POL-2026-0011', 'Cobertura contra terceros completa', 22000.00);

/* ========== ENTIDAD: PAGO ========== */

INSERT INTO PAGOS (ID, ID_ALQUILER, FECHA_PAGO, MONTO) VALUES
(1, 1, '2025-08-30', 84000.00),
(2, 2, '2025-09-08', 168000.00),
(3, 3, '2025-10-01', 224000.00),
(4, 4, '2025-10-10', 195000.00),
(5, 5, '2025-10-18', 285000.00),
(6, 6, '2025-10-28', 264000.00),
(7, 7, '2025-11-05', 288000.00),
(8, 8, '2025-11-12', 183000.00),
(9, 9, '2025-11-25', 195000.00),
(10, 10, '2025-12-05', 234000.00),
(11, 11, '2026-01-05', 168000.00);

/* ========== ENTIDAD: MULTA ========== */

INSERT INTO MULTAS (ID, ID_ALQUILER, FECHA, MOTIVO, MONTO, PAGADA) VALUES
(1, 1, '2025-09-05', 'Devolucion fuera de horario', 12000.00, 1),
(2, 2, '2025-09-14', 'Limpieza adicional del vehiculo', 18000.00, 1),
(3, 3, '2025-10-07', 'Exceso de kilometraje', 25000.00, 0),
(4, 4, '2025-10-15', 'Combustible insuficiente', 15000.00, 1),
(5, 5, '2025-10-23', 'Devolucion fuera de horario', 10000.00, 0),
(6, 6, '2025-11-04', 'Limpieza adicional del vehiculo', 14000.00, 1),
(7, 7, '2025-11-12', 'Exceso de kilometraje', 22000.00, 0),
(8, 8, '2025-11-18', 'Combustible insuficiente', 16000.00, 1),
(9, 9, '2025-12-06', 'Dano menor en el vehiculo', 30000.00, 1),
(10, 10, '2025-12-13', 'Devolucion fuera de horario', 12000.00, 0),
(11, 11, '2026-01-14', 'Limpieza adicional del vehiculo', 18000.00, 1);
