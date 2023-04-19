
# -- INFORME SOBRE LA CANTIDAD DE GASTO QUE GENERA LOS DELIVERYS

-- Este muestra el gasto total que genera tener delivery en el negocio en proceso de ampliacion y crecimiento,
-- en base a estos datos se podran tomar desiciones de si es un buen momento para abrir otras alternativas de ventas
-- sobre los gastos que este genera teniendo en cuentas los gastos ya presentes para la ampliacion de las sucursales
-- y desarrollo de nuevo sistema de gestion de datos.


DELIMITER //
CREATE FUNCTION GASTO_TOTAL_ENVIOS ()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE GASTO INT;
    SET GASTO = (SELECT SUM(gasto_envio) FROM DELIVERY);
    
	RETURN GASTO;
END//


SELECT GASTO_TOTAL_ENVIOS()