-- 1. Use UPDATE to change the language of some films. Make sure you use valid languages.
UPDATE film
SET language_id = 2  -- For example, French
WHERE film_id IN (1, 2, 3);

-- 2. Foreign keys in the customer table

--address_id
--store_id

--How this affects INSERT operations:
--When inserting a new row into the customer table:
--The address_id must already exist in the address table.
--The store_id must already exist in the store table.

-- 3. Drop the customer_review table
DROP TABLE IF EXISTS customer_review;

-- 4. Rentals still outstanding (not returned yet)
SELECT COUNT(*) AS outstanding_rentals
FROM rental
WHERE return_date IS NULL;

-- 5. 30 most expensive outstanding movies
SELECT f.title, f.rental_rate, r.rental_date
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NULL
ORDER BY f.rental_rate DESC
LIMIT 30;

-- 6. Find specific movies for friend

-- 6.1 Film about sumo wrestler, actor Penelope Monroe
SELECT f.title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'Penelope' AND a.last_name = 'Monroe'
AND f.description ILIKE '%sumo%';

-- 6.2 Short documentary (length < 60), rated 'R'
SELECT title
FROM film
WHERE length < 60 AND rating = 'R';

-- 6.3 Film rented by Matthew Mahan, returned 28 Jul - 1 Aug 2005, paid over $4
SELECT f.title
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON p.customer_id = c.customer_id
WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
  AND p.amount > 4.00
  AND r.return_date BETWEEN '2005-07-28' AND '2005-08-01';

-- 6.4 Expensive film Matthew Mahan watched, with "boat" in title or description
SELECT DISTINCT f.title, f.replacement_cost
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
  AND (f.title ILIKE '%boat%' OR f.description ILIKE '%boat%')
ORDER BY f.replacement_cost DESC;
