CREATE VIEW vista_ejecu_exitosas AS 
SELECT * FROM Ejecucion WHERE resultado = 'Exitoso';

CREATE VIEW vista_casos_funcional_alto AS 
SELECT * FROM Caso_Prueba WHERE prioridad = 'Alta' AND tipo = 'Funcional';

CREATE VIEW vista_caso_pend_pro AS 
SELECT Caso_Prueba.descripcion AS nombre_caso, Proyecto.nombre AS nombre_proyecto 
FROM Caso_Prueba 
JOIN Proyecto ON Caso_Prueba.id_proyecto = Proyecto.id_proyecto 
WHERE Caso_Prueba.estado = 'Pendiente';

CREATE VIEW vista_caso_ejecu_falli AS 
SELECT Caso_Prueba.id_caso, Caso_Prueba.descripcion, Ejecucion.resultado 
FROM Ejecucion 
JOIN Caso_Prueba ON Ejecucion.id_caso = Caso_Prueba.id_caso 
WHERE Ejecucion.resultado = 'Fallido';

CREATE VIEW vista_ejecu_usua AS 
SELECT Usuario.nombre, Usuario.correo 
FROM Usuario 
JOIN Ejecucion ON Usuario.id_usuario = Ejecucion.id_usuario;

CREATE VIEW vista_test_exit AS 
SELECT DISTINCT u.nombre 
FROM Usuario u 
JOIN Ejecucion e ON u.id_usuario = e.id_usuario 
WHERE u.rol = 'Tester' AND e.resultado = 'Exitoso';

CREATE VIEW vista_caso_estado AS 
SELECT cp.descripcion AS `desc` 
FROM Caso_Prueba cp 
JOIN (
  SELECT DISTINCT id_requisito 
  FROM Requisito 
  WHERE estado = 'En progreso'
) requisitos_en_progreso 
ON cp.id_requisito = requisitos_en_progreso.id_requisito;
