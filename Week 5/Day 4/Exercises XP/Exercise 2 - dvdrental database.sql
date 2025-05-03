
-- 1. Select all the columns from the customer table
SELECT * FROM customer;

-- 2. Display full name using alias
SELECT first_name || ' ' || last_name AS full_name FROM customer;

-- 3. Get unique create_date values
SELECT DISTINCT create_date FROM customer;

-- 4. Get all customer details ordered by first_name descending
SELECT * FROM customer ORDER BY first_name DESC;

-- 5. Get film ID, title, description, release year, and rental rate ordered by rental rate
SELECT film_id, title, description, release_year, rental_rate 
FROM film 
ORDER BY rental_rate ASC;

-- 6. Get address and phone number of customers in Texas district
SELECT address, phone 
FROM address 
WHERE district = 'Texas';

-- 7. Retrieve all movie details where movie ID is 15 or 150
SELECT * FROM film WHERE film_id IN (15, 150);

-- 8. Check if your favorite movie exists (replace 'MY_MOVIE' with actual title)
SELECT film_id, title, description, length, rental_rate 
FROM film 
WHERE title = 'MY_MOVIE';

-- 9. Search for movies starting with first 2 letters of favorite movie (replace 'AB')
SELECT film_id, title, description, length, rental_rate 
FROM film 
WHERE title ILIKE 'AB%';

-- 10. Find the 10 cheapest movies
SELECT * FROM film 
ORDER BY rental_rate ASC 
LIMIT 10;

-- 11. Find the next 10 cheapest movies without using LIMIT
WITH ranked_films AS (
  SELECT *, ROW_NUMBER() OVER (ORDER BY rental_rate) AS rn
  FROM film
)
SELECT * FROM ranked_films WHERE rn BETWEEN 11 AND 20;

-- 12. Join customer and payment tables: get first name, last name, amount, and payment date
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY c.customer_id;

-- 13. Get all movies not in inventory
SELECT * FROM film 
WHERE film_id NOT IN (SELECT film_id FROM inventory);

-- 14. Find which city is in which country
SELECT city.city, country.country
FROM city
JOIN country ON city.country_id = country.country_id;

-- Bonus: Check seller performance by staff_id
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date, p.staff_id
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.staff_id;
