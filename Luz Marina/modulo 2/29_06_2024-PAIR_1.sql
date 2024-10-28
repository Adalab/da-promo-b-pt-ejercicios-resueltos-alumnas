-- CTE

-- 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
-- Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente 
-- y el nombre de la compañia de la tabla Customers.

USE northwind;

WITH customer_id AS(SELECT customer_id, company_name
FROM customers) 
SELECT * FROM customer_id;

-- 2. Selecciona solo los de que vengan de "Germany"
-- Ampliemos un poco la query anterior. En este caso, 
-- queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany".

WITH customer_id AS(SELECT customer_id, company_name
FROM customers
WHERE country = "Germany") 
SELECT * FROM customer_id;

-- 3. Extraed el id de las facturas y su fecha de cada cliente.
-- En este caso queremos extraer todas las facturas que se han emitido a un cliente, 
-- su fecha la compañia a la que pertenece.
-- 📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).

WITH customer_info AS(SELECT cu.customer_id, cu.company_name, ord.order_id, ord.order_date
FROM customers AS cu
INNER JOIN orders AS ord ON cu.customer_id = ord.customer_id)
SELECT * FROM customer_info;

-- 4. Contad el número de facturas por cliente
-- Mejoremos la query anterior. En este caso queremos saber el 
-- número de facturas emitidas por cada cliente.

WITH customer_info AS (
    SELECT cu.customer_id, cu.company_name, COUNT(ord.order_id) AS num_facturas
    FROM customers AS cu
    INNER JOIN orders AS ord ON cu.customer_id = ord.customer_id
    GROUP BY cu.customer_id, cu.company_name
)
SELECT *
FROM customer_info;

-- 5. Cuál la cantidad media pedida de todos los productos ProductID.
-- Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.

WITH total_productos
AS (
	SELECT product_id, SUM(quantity) AS pedidos_company_cantidad
	FROM order_details
    GROUP BY product_id)
SELECT AVG (pedidos_company_cantidad) AS cantidad_media
FROM total_productos; 

-- 6 Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
with tabla as(select c.*, p.unit_price from products as p 
inner join categories as c
on p.category_id = c.category_id)
select category_name, round(avg(unit_price),2) as media, max(unit_price) as max, min(unit_price) as min
from tabla
group by category_name ; 

-- 7.La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos. 
with tabla as (select * from orders as o
natural join customers as c)
select count(*), contact_name, phone, year(order_date)
from tabla
group by contact_name, phone, year(order_date);

select count(*), contact_name, phone
 from (with tabla as (select * from orders as o
natural join customers as c)
select *
from tabla) as tabla2
group by contact_name, phone;

SELECT COUNT(*) AS count_per_contact,c.contact_name, c.phone
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
GROUP BY c.contact_name, c.phone; 