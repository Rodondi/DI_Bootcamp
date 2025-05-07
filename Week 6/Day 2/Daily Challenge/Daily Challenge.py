import requests
import random
import sqlite3

# Fetches all countries
response = requests.get("https://restcountries.com/v3.1/all")
countries = response.json()

# Randomly selects 10 countries
random_countries = random.sample(countries, 10)

# Creates database connection
conn = sqlite3.connect('countries.db')
cursor = conn.cursor()

# Creates the table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS countries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        capital TEXT,
        flag TEXT,
        subregion TEXT,
        population INTEGER
    )
''')

# Inserts countries into the table
for country in random_countries:
    name = country.get('name', {}).get('common', 'Unknown')
    capital = country.get('capital', ['Unknown'])[0]
    flag = country.get('flags', {}).get('png', 'No flag')
    subregion = country.get('subregion', 'Unknown')
    population = country.get('population', 0)

    cursor.execute('''
        INSERT INTO countries (name, capital, flag, subregion, population)
        VALUES (?, ?, ?, ?, ?)
    ''', (name, capital, flag, subregion, population))

# Commit and close
conn.commit()
conn.close()