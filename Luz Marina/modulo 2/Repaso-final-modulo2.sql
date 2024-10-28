/* ejercico 1- tema JOINa
Obtener los clientes y las películas que han alquilado. */

-- Solucion de Luz
SELECT cu.first_name, cu.last_name,f.title
FROM customer AS cu
INNER JOIN rental AS re
ON cu.customer_id = re.customer_id
INNER JOIN inventory AS inv
ON re.inventory_id = inv.inventory_id
INNER JOIN film AS f
ON inv.film_id = f.film_id;

-- Solucion de Alejandra

SELECT last_name AS customerSurname, first_name AS customerName, title AS filmName

FROM (
	SELECT inventory_id, title
	FROM inventory
	NATURAL JOIN film_text) AS Title

NATURAL JOIN (
	SELECT  first_name, last_name, inventory_id
	FROM customer
	INNER JOIN rental
	USING (customer_id)
    ) AS Name
ORDER BY last_name;

-- Solucion de Elena

SELECT DISTINCT CONCAT(c.last_name,", ",c.first_name) AS cliente, f.title
FROM customer AS cu
INNER JOIN rental AS re
ON cu.customer_id = re.customer_id
INNER JOIN inventory AS inv
ON re.inventory_id = inv.inventory_id
INNER JOIN film AS f
ON inv.film_id = f.film_id;

/* ejercico 1- tema LIKE
Encuentra todas las películas que comienzan con la letra "A" en su título. */

SELECT title
FROM film
WHERE title LIKE 'A%';

/* ejercico 4- tema LIKE
Encuentra todas las películas cuyo título contiene la palabra "The."*/
SELECT title
FROM film
WHERE title LIKE '%The%';

/* Ejercicio 1- tema UNION 
Encuentra todos los actores cuyos nombres comienzan con la letra "A" en la tabla actor, 
y encuentra todos los clientes cuyos nombres comienzan con la letra "B" en la tabla customer. 
Combina ambos conjuntos de resultados en una sola tabla. */

-- Solucion Alejandra

SELECT first_name
FROM actor
WHERE first_name LIKE 'A%'

UNION

SELECT first_name
FROM customer
WHERE first_name LIKE 'B%';

-- Solucion Elena

SELECT act.first_name, act.last_name, "actor" AS role
FROM actor AS act
WHERE act.first_name LIKE 'A%'
UNION
SELECT ctm.first_name, ctm.last_name, "cliente" AS role
FROM customer as ctm
WHERE ctm.first_name LIKE 'B%';


/* Ejercicio 1- tema subqueries
Encuentra el nombre y apellido de los actores que han actuado en películas 
que se alquilaron después de que la película "ACADEMY DINOSAUR" se alquilara por primera vez. 
Ordena los resultados alfabéticamente por apellido. */

-- Solucion Alejandra

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

-- Otra Solucion
USE sakila;
SELECT DISTINCT actor.first_name, actor.last_name 
    FROM rental
INNER JOIN inventory
    ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
    ON inventory.film_id = film.film_id
INNER JOIN film_actor 
    ON film.film_id = film_actor.film_id
INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id

WHERE rental_date > (SELECT min(rental_date) FROM rental
                        INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
                        INNER JOIN film ON film.film_id = inventory.film_id
                            WHERE title = "ACADEMY DINOSAUR")
ORDER BY actor.last_name, actor.first_name;

/* Ejercicio 1- tema CTE
Encuentra el nombre de los actores que han actuado en más películas y la cantidad de películas en las que han actuado. */

WITH ActorFilmCount AS (
    SELECT
        actor.actor_id,
        actor.first_name,
        actor.last_name,
        COUNT(film_actor.film_id) AS num_films
    FROM
        actor
    JOIN
        film_actor ON actor.actor_id = film_actor.actor_id
    GROUP BY
        actor.actor_id
)

SELECT
    first_name,
    last_name,
    num_films
FROM
    ActorFilmCount
WHERE
    num_films = (SELECT MAX(num_films) FROM ActorFilmCount);


