
import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

class MenuItem:
    def __init__(self, name, price):
        self.name = name
        self.price = price

    def save(self):
        try:
            with psycopg2.connect(
                dbname=os.getenv('DB_NAME'),
                user=os.getenv('DB_USER'),
                password=os.getenv('DB_PASSWORD')
            ) as conn:
                with conn.cursor() as cur:
                    cur.execute("INSERT INTO Menu_Items (item_name, item_price) VALUES (%s, %s)", (self.name, self.price))
            print("Item added successfully.")
        except Exception as e:
            print("Error saving item:", e)

    def delete(self):
        try:
            with psycopg2.connect(
                dbname=os.getenv('DB_NAME'),
                user=os.getenv('DB_USER'),
                password=os.getenv('DB_PASSWORD')
            ) as conn:
                with conn.cursor() as cur:
                    cur.execute("DELETE FROM Menu_Items WHERE item_name = %s", (self.name,))
            print("Item deleted successfully.")
        except Exception as e:
            print("Error deleting item:", e)

    def update(self, new_name, new_price):
        try:
            with psycopg2.connect(
                dbname=os.getenv('DB_NAME'),
                user=os.getenv('DB_USER'),
                password=os.getenv('DB_PASSWORD')
            ) as conn:
                with conn.cursor() as cur:
                    cur.execute("UPDATE Menu_Items SET item_name = %s, item_price = %s WHERE item_name = %s", (new_name, new_price, self.name))
            print("Item updated successfully.")
        except Exception as e:
            print("Error updating item:", e)
