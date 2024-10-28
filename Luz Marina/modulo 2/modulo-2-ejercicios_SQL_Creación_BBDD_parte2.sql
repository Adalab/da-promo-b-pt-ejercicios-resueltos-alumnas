SET SQL_SAFE_UPDATES = 0; -- Es para desactivar la proteccion infantil

UPDATE zapatillas
	SET color = "Amarillas"
    WHERE color = "Rosas" ;
    
UPDATE empleados 
	SET tienda = " A Coruña"
    WHERE tienda = "Alcobendas";
    
UPDATE clientes
SET numero_telefono = "123456728"

UPDATE tabla_facturas
SET total = "89.91"
WHERE id_factura = 2;
