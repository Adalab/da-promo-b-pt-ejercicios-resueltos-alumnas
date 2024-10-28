USE tienda;

-- 1. Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.

SELECT last_name AS "Apellidos" FROM employees
UNION
SELECT contact_last_name FROM customers;

-- 2.  Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers. 
SELECT first_name AS "nombre", last_name AS "Apellidos" FROM employees
UNION
SELECT contact_first_name, contact_last_name FROM customers;

-- 3. Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.

SELECT first_name AS "nombre", last_name AS "Apellidos" FROM employees
UNION ALL
SELECT contact_first_name, contact_last_name FROM customers;

-- 4. Queremos ver ahora el employee_number como 'Número empleado', first_name como 'nombre Empleado' y last_name como 'Apellido Empleado' 
-- para los empleados con employee_number: 1002,1076,1088 y 1612.
SELECT employee_number AS "Número empleado", first_name AS "nombre Empleado", last_name AS "Apellido Empleado" 
FROM employees
WHERE employee_number IN (1002, 10076, 1088, 1612);

SELECT employee_number AS "Número empleado", first_name AS "nombre Empleado", last_name AS "Apellido Empleado" 
FROM employees
WHERE employee_number REGEXP '1002|1076|1088|1612'; 

-- 5. Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' 
--  la tabla customers, que no estén en: Ireland, France, Germany.
SELECT city as "ciudad", customer_name AS "nombre de la empresa"
FROM customers
WHERE city NOT IN ("Ireland", "France", "Germany");

-- 6. Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.
SELECT contact_first_name, city
FROM customers
WHERE city LIKE "%on";


-- 7. Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on'
-- y que unicamente sean de longitud 4.

SELECT contact_first_name, city
FROM customers
WHERE city LIKE "%on" AND LENGTH(city) = 4;

-- 8. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3
-- en su dirección postal (o lo que es lo mismo, su primera dirección).
SELECT contact_first_name, address_line1, city, postal_code
FROM customers
WHERE postal_code REGEXP 3;

-- 9. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 
-- en su dirección postal y la ciudad no empiece por T

SELECT contact_first_name, address_line1, city, postal_code -- esta mal, seguir por aqui
FROM customers
WHERE postal_code REGEXP 3 AND WHERE city NOT IN "T_%";