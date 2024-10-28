USE tienda;
-- 1 Calcula el numero de clientes por cada ciudad

SELECT  COUNT(customer_number) AS NumeroClientes , city
FROM customers
GROUP BY city
ORDER BY COUNT(customer_number) DESC ;

-- 4. Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'
SELECT em.employee_number AS NumeroEmpleado, em.first_name as NombreEmpleado, em.last_name AS ApellidoEmpleado, cu.customer_number AS Cliente
FROM employees  AS em
INNER JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number WHERE em.employee_number IN (SELECT sales_rep_employee_number FROM customers);

-- 5. Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: 
-- Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, 
-- sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.

SELECT DISTINCT cu.city AS ciudad, cu.customer_name AS nombreEmpresa
FROM customers AS cu
WHERE NOT EXISTS (
    SELECT 1
    FROM offices AS offi
    WHERE cu.city = offi.city
);
