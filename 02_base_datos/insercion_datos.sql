INSERT INTO Rol (nombre, descripcion) VALUES
('Administrador', 'Gestión total del sistema'),
('Tester', 'Realiza pruebas funcionales y de regresión'),
('Desarrollador', 'Implementa funcionalidades y corrige errores');

INSERT INTO Usuario (nombre, correo, rol, id_rol) VALUES
('Ana', 'ana@gmail.com', 'Administrador', 1),
('Carlos', 'carlos@gmail.com', 'Tester', 2),
('Luis', 'luis@gmail.com', 'Desarrollador', 3),
('Marta', 'marta@gmail.com', 'Tester', 2);

INSERT INTO Requisito (prioridad, descripcion, estado) VALUES
('Alta', 'Login de usuario', 'Completado'),
('Media', 'Registro de nuevo cliente', 'En progreso'),
('Baja', 'Visualización de reportes', 'Pendiente');

INSERT INTO Proyecto (estado, nombre, descripcon, fecha_inicio, fecha_fin, id_requisito, id_usuario) VALUES
('Activo', 'Sistema de Gestión Escolar', 'Proyecto para administrar estudiantes y profesores', '2023-03-01', '2023-10-30', 1, 1),
('Finalizado', 'App de Ventas', 'Aplicación móvil para ventas en línea', '2023-01-15', '2023-06-20', 2, 3);

INSERT INTO Caso_Prueba (descripcion, tipo, prioridad, estado, id_requisito, id_proyecto) VALUES
('Validar login con credenciales válidas', 'Funcional', 'Alta', 'Finalizado', 1, 1),
('Validar login con contraseña incorrecta', 'Funcional', 'Alta', 'Finalizado', 1, 1),
('Registrar cliente nuevo', 'Funcional', 'Media', 'En ejecución', 2, 2),
('Registrar cliente con datos incompletos', 'Funcional', 'Media', 'Pendiente', 2, 2),
('Visualizar reporte diario', 'UI', 'Baja', 'Pendiente', 3, 2),
('Acceder sin login', 'Seguridad', 'Alta', 'Finalizado', 1, 1);

INSERT INTO Ejecucion (historial, prioridad, comentarios, resultado, fecha, id_caso, id_usuario) VALUES
('Ejecución exitosa del login', 'Alta', 'Todo funcionó correctamente', 'Exitoso', '2023-05-10', 1, 2),
('Falla por contraseña incorrecta', 'Alta', 'Se mostró mensaje de error', 'Fallido', '2023-05-12', 2, 2),
('Cliente registrado correctamente', 'Media', 'Datos almacenados en la base', 'Exitoso', '2023-06-01', 3, 4),
('Error por falta de datos', 'Media', 'Validación no activada', 'Fallido', '2023-06-02', 4, 4),
('Diseño mal renderizado', 'Baja', 'Botones desalineados', 'Fallido', '2023-06-03', 5, 4),
('Acceso denegado correctamente', 'Alta', 'El sistema bloqueó correctamente', 'Exitoso', '2023-06-04', 6, 2);
