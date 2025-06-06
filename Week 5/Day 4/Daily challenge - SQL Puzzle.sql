CREATE TABLE FirstTab (
    id INTEGER, 
    name VARCHAR(10)
);

INSERT INTO FirstTab VALUES
(5, 'Pawan'),
(6, 'Sharlee'),
(7, 'Krish'),
(NULL, 'Avtaar');

SELECT * FROM FirstTab;

CREATE TABLE SecondTab (
    id INTEGER
);

INSERT INTO SecondTab VALUES
(5),
(NULL);

SELECT * FROM SecondTab;

-- Q1. What will be the OUTPUT of the following statement?
--The OUPUT will be 0

SELECT COUNT(*)
FROM FirstTab AS ft 
WHERE ft.id NOT IN (
    SELECT id FROM SecondTab WHERE id IS NULL
);

-- Q2. What will be the OUTPUT of the following statement?
-- The OUTPUT will be 2

SELECT COUNT(*)
FROM FirstTab AS ft 
WHERE ft.id NOT IN (
    SELECT id FROM SecondTab WHERE id = 5
);

-- Q3. What will be the OUTPUT of the following statement?
-- The OUTPUT will be 0

SELECT COUNT(*)
FROM FirstTab AS ft 
WHERE ft.id NOT IN (
    SELECT id FROM SecondTab
);
	
-- Q4. What will be the OUTPUT of the following statement?
-- The OUTPUT will be 2

SELECT COUNT(*)
FROM FirstTab AS ft 
WHERE ft.id NOT IN (
    SELECT id FROM SecondTab WHERE id IS NOT NULL
);