-- Creating the "items" table
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Creating the "customers" table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

-- Inserting data into the "items" table
INSERT INTO items (name, price) VALUES
    ('Small Desk', 100),
    ('Large Desk', 300),
    ('Fan', 80);

-- Inserting data into the "customers" table
INSERT INTO customers (first_name, last_name) VALUES
    ('Greg', 'Jones'),
    ('Sandra', 'Jones'),
    ('Scott', 'Scott'),
    ('Trevor', 'Green'),
    ('Melanie', 'Johnson');

-- 1. All the items.
SELECT * FROM items;

-- 2. All the items with a price above 80 (80 not included).
SELECT * FROM items WHERE price > 80;

-- 3. All the items with a price below 300 (300 included)
SELECT * FROM items WHERE price <= 300;

-- 4. All customers whose last name is ‘Smith’
SELECT * FROM customers WHERE last_name = 'Smith';

-- 5. All customers whose last name is ‘Jones’.
SELECT * FROM customers WHERE last_name = 'Jones';

-- 6. All customers whose firstname is not ‘Scott’.
SELECT * FROM customers WHERE first_name != 'Scott';