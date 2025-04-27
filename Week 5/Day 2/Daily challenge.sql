CREATE TABLE actors(
  actor_id SERIAL PRIMARY KEY,
  first_name VARCHAR (50) NOT NULL,
  last_name VARCHAR (100) NOT NULL,
  age DATE NOT NULL,
  number_oscars SMALLINT NOT NULL
);

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES('Matt','Damon','08/10/1970', 5);

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES('George','Clooney','06/05/1961', 2);

-- Add two more female actors in the table actors. Add them one by one
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES('Meryl', 'Streep', '06/22/1949', 3);

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES('Nicole', 'Kidman', '06/20/1967', 1);


-- Add three more actors, add all of them in one query !
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES  ('Leonardo', 'DiCaprio', '11/11/1974', 1),
        ('Brad', 'Pitt', '12/18/1963', 1),
        ('Scarlett', 'Johansson', '11/22/1984', 0);

-- Retrieve everything from the table actors
SELECT * FROM actors;

-- Retrieve everything from the table actors
SELECT * FROM actors;

-- 1. Count how many actors are in the table.
SELECT COUNT(*) AS total_actors FROM actors;

-- 2. Try to add a new actor with some blank fields. What do you think the outcome will be?
-- The outcome will be an error.
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES ('','','',0);
--Try a NULL value
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES (NULL,NULL,NULL,0);
