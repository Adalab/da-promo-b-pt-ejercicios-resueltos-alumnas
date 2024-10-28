-- OPERADORES ESPECIALES DE FILTRO
USE northwind;
SELECT  'Hola!'  AS tipo_nombre
FROM customers;
-- 1 Ciudades que empiezan con "A" o "B".
-- Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañias que están afincadas en ciudades 
-- que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%";

-- 2 Número de pedidos que han hecho en las ciudades que empiezan con L.
-- En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que 
-- han hecho todas las ciudades que empiezan por "L".
SELECT cu.city, cu.company_name, cu.contact_name, COUNT(ord.order_id)
FROM customers AS cu
INNER JOIN orders AS ord
ON cu.customer_id = ord.customer_id
GROUP BY cu.city, cu.company_name, cu.contact_name
HAVING city LIKE "L%" ;

-- 3.Todos los clientes cuyo "country" no incluya "USA".
-- Nuestro objetivo es extraer los clientes que no sean de USA. 
-- Extraer el nombre de contacto, su pais y el nombre de la compañia.
SELECT contact_name AS Contacto, company_name as Empresa, country AS Pais 
FROM customers
WHERE country NOT LIKE "USA";

-- 4.Todos los clientes que no tengan una "A" en segunda posición en su nombre.
SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE "_A%";

-- 5.Extraer toda la información sobre las compañias que tengamos en la BBDD.
-- Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
-- Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). 
-- Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
-- Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
-- Nota: Deberás crear esta columna temporal en cada instrucción SELECT.
SELECT city, company_name AS Empresa, contact_name AS Contacto_Empresa, 'Customer' AS Relationship
FROM customers

UNION

SELECT city, company_name AS Empresa, contact_name AS Contacto_Empresa, 'Supplier'
FROM suppliers
ORDER BY city; 

-- 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".
SELECT *
FROM categories
WHERE description REGEXP "sweet" or description REGEXP "Sweet";

-- 7.Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:
-- 💡 Pista 💡 ¿Ambas tablas tienen las mismas columnas para nombre y apellido? Tendremos que combinar dos columnas 
SELECT city, company_name AS Empresa, contact_name AS Contacto_Empresa, 'Customer' AS Relationship
FROM customers

UNION

SELECT city, company_name AS Empresa, contact_name AS Contacto_Empresa, 'Supplier'
FROM suppliers
ORDER BY city;
 
 