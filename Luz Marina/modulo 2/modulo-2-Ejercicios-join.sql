USE northwind;
-- 1. Pedidos por empresa en UK:
-- Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer 
-- cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT cu.company_name AS NombreEmpresa, cu.customer_id AS Identificador, COUNT(ord.order_id) AS NuemeroPedidos
FROM customers AS cu
LEFT JOIN orders AS ord
ON cu.customer_id = ord.customer_id
WHERE ship_country = "UK"
GROUP BY cu.customer_id;

-- 2. Productos pedidos por empresa en UK por año:
-- Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie 
-- de consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada 
-- empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y 
-- la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.


