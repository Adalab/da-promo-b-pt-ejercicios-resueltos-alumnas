USE northwind;
-- CTE's
-- 1.Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
-- Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers
WITH consulta AS (
SELECT customer_id AS CustID , company_name AS CompanyName
FROM customers);



-- 5. Cuál es la cantidad media pedida de todos los productos ProductID.
-- Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.
-- Los resultados de esta query serán:


-- 6. Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
WITH precios AS(
	SELECT categories.*,product.unit_price
    FROM categories 
    INNER JOIN products ON categories.category_id = products.category_id
    )
    
SELECT category_name, round(AVG(unit_price),2) AS PrecioMedio, ROUND(MAX(unit_price),2),ROUND(MIN(unit_price)2)
FROM precios
Group BY category_name;
    
SELECT ca.category_name AS NombreCategoria, MAX(pr.unit_price) AS PrecioMaximo, ROUND(AVG(pr.unit_price),2) AS PrecioMedio,   MIN(pr.unit_price) AS PrecioMinimo
FROM products AS pr
INNER JOIN categories AS ca 
ON pr.category_id = ca.category_id
GROUP BY category_name;
    
-- 7. La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos.
WITH clientes AS (
	SELECT cu.customer_id, cu.contact_name, cu.phone, COUNT(ord.order_id)
    FROM customers AS cu
    INNER JOIN  orders AS ord ON cu.customer_id = ord.customer_id
    GROUP BY customer_id;)

SELECT 

