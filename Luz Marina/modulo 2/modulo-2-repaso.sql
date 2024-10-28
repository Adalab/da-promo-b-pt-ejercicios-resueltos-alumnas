USE sakila; -- llamo a la bbdd

-- Ejercicios joins

-- 1. Obtener los clientes y las películas que han alquilado.
-- Miramos todas las tablas y sacamos qué columna necesitamos de cada una de ellas
SELECT * FROM customer; customer_id, first_name, last_name
SELECT * FROM rental; rental_id, inventory_id, customer_id
SELECT * FROM film; film_id, title
SELECT * FROM inventory; inventory_id, film_id



SELECT cu.customer_id, cu.first_name, cu.last_name, re.rental_id, re.inventory_id, f.title
FROM customer AS cu
INNER JOIN rental AS re
ON cu.customer_id = re.customer_id
INNER JOIN inventory AS inv
ON re.inventory_id = inv.inventory_id
INNER JOIN film AS f
ON inv.film_id = f.film_id;

-- Para dejarlo limpio solo con titulo y nombre de cliente se puede quitar el resto del SELECT
SELECT cu.first_name, cu.last_name,f.title
FROM customer AS cu
INNER JOIN rental AS re
ON cu.customer_id = re.customer_id
INNER JOIN inventory AS inv
ON re.inventory_id = inv.inventory_id
INNER JOIN film AS f
ON inv.film_id = f.film_id;

-- Ejercicios like, not like y regexp
-- 1. Encuentra todas las películas que comienzan con la letra "A" en su título.
SELECT title AS titulo_inicio_A
FROM film
WHERE title LIKE "A%";
-- 2  Encuentra todas las películas cuyo título contiene la palabra "The."

SELECT title AS contenga_the
FROM film
WHERE title LIKE '%The%';

-- Ejericicos subquerys y querys complejas
-- 1.Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que 
-- la película "ACADEMY DINOSAUR" se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.


----------------------------------------

SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
);
-- Obtenemos el inventory_id de nuestra película

SELECT MIN(rental_date)
FROM rental
WHERE inventory_id IN (	-- Sacamos el film_id de la película
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
));

SELECT inventory_id, film_id
FROM rental
INNER JOIN inventory
USING (inventory_id)
WHERE rental_date > (
SELECT MIN(rental_date)
FROM rental
WHERE inventory_id IN (	-- Sacamos el film_id de la película
SELECT inventory_id
FROM inventory
WHERE film_id = (
SELECT film_id
FROM film_text
WHERE title = 'ACADEMY DINOSAUR'
)));
-- Estamo obteniendo el inventory_id y el film_id de las películas que cumplen con la condición del enunciado

SELECT actor_id, first_name, last_name, inventory_id
FROM actor
INNER JOIN film_actor
USING (actor_id)
INNER JOIN inventory
USING (film_id);
-- Obtenemos el nombre y el apellido de los actores e inventory_id

SELECT actor_id, first_name, last_name, inventory_id
FROM actor
INNER JOIN film_actor
USING (actor_id)
INNER JOIN inventory
USING (film_id)
WHERE inventory_id IN(

SELECT inventory_id
FROM rental
INNER JOIN inventory
USING (inventory_id)
WHERE rental_date > (
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