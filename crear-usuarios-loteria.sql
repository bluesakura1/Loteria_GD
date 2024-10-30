use loteria;
-- 1
CREATE USER 'app'@'localhost' IDENTIFIED BY 'passwordtest';
SHOW GRANTS FOR  'app'@'localhost';
-- 2 Crear role con el usuario ya creado
CREATE ROLE AppOrm;
-- 3 Permitir el uso de todas las vistas
GRANT SELECT ON loteria.* TO AppOrm;
-- 4 Permitir el uso de procedimientos almacenados
GRANT EXECUTE ON PROCEDURE loteria.insertar_ganador_sorteo TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.insertar_sorteo TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.obtener_sorteos TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.insertar_acceso TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.insertar_cliente TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.Insertar_millones_primitivo TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.LeerGanadoresPorEmail TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.LeerGanadorPorEstado TO AppOrm;
GRANT EXECUTE ON PROCEDURE loteria.actualizar_monto_cobrado TO AppOrm;
-- 5 dar role a usuario
GRANT AppOrm TO 'app'@'localhost';
-- 6 activar role manual si falla el default
SET ROLE 'rol_vistas_funciones';
-- 6 activar role default
SET DEFAULT ROLE AppOrm TO 'app'@'localhost';
-- 7 ingresa en consola linux
mysql -u app -p
-- 8 prueva vistas
SHOW FULL TABLES IN nombre_base_datos WHERE TABLE_TYPE = 'VIEW';
-- 9 procedimientos
CALL nombre_base_datos.nombre_procedimiento();
call loteria.LeerGanadorPorEstado(1);
