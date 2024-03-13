-- Write SQL queries to perform the following tasks using the Sakila database:
USE sakila ;


-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT
inv. film_id AS film_id
, film.title AS title
, COUNT(*) AS title_count
FROM inventory AS inv
LEFT JOIN film USING (film_id)
WHERE film.title LIKE "Hunchback Impossible"
GROUP BY inv.inventory_id, inv.film_id, film.title;

-- if I want to count how many times "Hunchback Impossible" appears:
SELECT 
    film.film_id,
    film.title AS film_title,
    COUNT(*) AS appearances
FROM inventory
JOIN film ON inventory.film_id = film.film_id
WHERE film.title = 'Hunchback Impossible'
GROUP BY film.film_id, film.title;


-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT
    film_id
    , title
    , length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT
    actor.actor_id
    , actor.first_name
    , actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE
    film_actor.film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    );


-- Bonus:

-- 4. Sales have been lagging among young families, and you want to target family movies for a promotion. 
-- Identify all movies categorized as family films.

SELECT
    film.film_id
    , film.title
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Family';


-- 5. Retrieve the name and email of customers from Canada using both subqueries and joins. 
-- To use joins, you will need to identify the relevant tables and their primary and foreign keys.




-- 6. Determine which films were starred by the most prolific actor in the Sakila database. 
-- A prolific actor is defined as the actor who has acted in the most number of films. 
-- First, you will need to find the most prolific actor and then use that actor_id 
-- to find the different films that he or she starred in.



-- 7. Find the films rented by the most profitable customer in the Sakila database. 
-- You can use the customer and payment tables to find the most profitable customer, 
-- i.e., the customer who has made the largest sum of payments.



-- 8. Retrieve the client_id and the total_amount_spent of those clients who spent more than 
-- the average of the total_amount spent by each client. 
-- You can use subqueries to accomplish this.