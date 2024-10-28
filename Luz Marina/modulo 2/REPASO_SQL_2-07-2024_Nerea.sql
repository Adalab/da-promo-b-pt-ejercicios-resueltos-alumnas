-- EJERCICIOS REPASO

USE sakila;

-- JOINS -- 

-- 1. Obtener los clientes y las películas que han alquilado.

SELECT * FROM customer;

SELECT c.first_name AS Nombre, c.last_name AS Apellido, f.title AS NombrePeli
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
INNER JOIN inventory AS i 
ON r.inventory_id = i.inventory_id
INNER JOIN film AS f
ON i.film_id = f.film_id;

-- LIKE, NOT LIKE, REGEXP 

-- 1. Encuentra todas las películas que comienzan con la letra "A" en su título.

SELECT film_id, title, description
FROM film
WHERE title LIKE "A%";

-- 4. Encuentra todas las películas cuyo título contiene la palabra "The."

SELECT film_id, title, description
FROM film
WHERE title LIKE "%The%" OR title LIKE "The%" OR title LIKE "The %";

-- UNIONES --

-- 1. Encuentra todos los actores cuyos nombres comienzan con la letra "A" en la tabla actor, 
-- y encuentra todos los clientes cuyos nombres comienzan con la letra "B" en la tabla 
-- customer. Combina ambos conjuntos de resultados en una sola tabla.

SELECT first_name AS nombre
FROM actor
WHERE first_name LIKE "A%"
UNION
SELECT first_name
FROM customer
WHERE first_name LIKE "B%";

-- SUBQUERIES -- SUBCONSULTAS --

-- 1. Encuentra el nombre y apellido de los actores que han actuado en películas que se
--  alquilaron después de que la película "ACADEMY DINOSAUR" se alquilara por primera vez. 
-- Ordena los resultados alfabéticamente por apellido.

-- Busco cuándo se alquiló la película "ACADEMY DINOSAUR" por primera vez:

SELECT rental.*, film_id
FROM rental
INNER JOIN inventory
USING (inventory_id);

SELECT title
FROM film_text
WHERE film_id IN (
	SELECT rental.*, film_id
	FROM rental
	INNER JOIN inventory
	USING (inventory_id)
    );
    
-- QUERY FINAL

SELECT actor_id, first_name, last_name, inventory_id
FROM actor
INNER JOIN film_actor
USING (actor_id)
INNER JOIN inventory
USING (film_id)
WHERE inventory_id IN (
	SELECT inventory_id -- seleccionamos el id del inventario
	FROM rental
	INNER JOIN inventory
	USING (inventory_id)
	WHERE rental_date > ( -- sacamos la fecha inicial de alquiler de la peli
		SELECT MIN(rental_date)
		FROM rental
		WHERE inventory_id IN (	-- Sacamos el film_id de la película
			SELECT inventory_id
			FROM inventory
			WHERE film_id = (
				SELECT film_id
				FROM film_text
				WHERE title = 'ACADEMY DINOSAUR'
	))));