--Creating the students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL
);

-- Step 4: Inserting the data
INSERT INTO students (first_name, last_name, birth_date) VALUES
('Marc', 'Benichou', '1998-11-02'),
('Yoan', 'Cohen', '2010-12-03'),
('Lea', 'Benichou', '1987-07-27'),
('Amelia', 'Dux', '1996-04-07'),
('David', 'Grez', '2003-06-14'),
('Omer', 'Simpson', '1980-10-03'),

-- Adding my own details
('Rodgers', 'Odondi', '1980-01-01');

-- Fetching all the data from the table
SELECT * FROM students;

-- Fetching student with id = 2
SELECT first_name, last_name FROM students WHERE id = 2;

-- Fetching Marc Benichou
SELECT first_name, last_name FROM students 
WHERE last_name = 'Benichou' AND first_name = 'Marc';

-- Fetching students whose last_name is Benichou OR first_name is Marc
SELECT first_name, last_name FROM students 
WHERE last_name = 'Benichou' OR first_name = 'Marc';

-- Students whose first_names contain letter 'a'
SELECT first_name, last_name FROM students 
WHERE first_name ILIKE '%a%';

-- Students whose first_names start with 'a'
SELECT first_name, last_name FROM students 
WHERE first_name ILIKE 'a%';

-- Students whose first_names end with 'a'
SELECT first_name, last_name FROM students 
WHERE first_name ILIKE '%a';

-- Students whose second to last letter in first_name is 'a'
SELECT first_name, last_name FROM students 
WHERE SUBSTRING(first_name FROM LENGTH(first_name)-1 FOR 1) = 'a';

-- Students whose id is 1 AND 3
SELECT first_name, last_name FROM students 
WHERE id IN (1, 3);

-- Students born on or after 2000-01-01
SELECT * FROM students 
WHERE birth_date >= '2000-01-01';