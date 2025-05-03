-- 1. Get a list of all the languages, from the language table.
SELECT * FROM language;

-- 2. Get a list of all films joined with their languages.
SELECT f.title, f.description, l.name AS language
FROM film f
JOIN language l ON f.language_id = l.language_id;

-- 3. Get all languages, even if there are no films in those languages.
SELECT f.title, f.description, l.name AS language
FROM language l
LEFT JOIN film f ON f.language_id = l.language_id;

-- 4. Create a new table called new_film.
DROP TABLE IF EXISTS new_film;
CREATE TABLE new_film (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Add some new films to the table.
INSERT INTO new_film (name) VALUES ('The Great Adventure'), ('Shadows of Time');

-- 5. Create a new table called customer_review.
DROP TABLE IF EXISTS customer_review;
CREATE TABLE customer_review (
    review_id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES new_film(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES language(language_id),
    title VARCHAR(255),
    score INTEGER CHECK (score BETWEEN 1 AND 10),
    review_text TEXT,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Add 2 movie reviews.
INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES
(1, 1, 'Amazing Journey', 9, 'A truly inspiring tale of adventure.'),
(2, 2, 'Time Warp', 7, 'Intriguing plot with solid performances.');

-- 7. Delete a film that has a review.
DELETE FROM new_film WHERE id = 1;

-- The corresponding review for film_id = 1 will be automatically deleted due to ON DELETE CASCADE.
