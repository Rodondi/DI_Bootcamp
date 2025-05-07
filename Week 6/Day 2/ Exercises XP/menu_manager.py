
import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

class MenuManager:

    @classmethod
    def get_by_name(cls, name):
        try:
            with psycopg2.connect(
                dbname=os.getenv('DB_NAME'),
                user=os.getenv('DB_USER'),
                password=os.getenv('DB_PASSWORD')
            ) as conn:
                with conn.cursor() as cur:
                    cur.execute("SELECT * FROM Menu_Items WHERE item_name = %s", (name,))
                    return cur.fetchone()
        except Exception as e:
            print("Error fetching item:", e)
            return None

    @classmethod
    def all_items(cls):
        try:
            with psycopg2.connect(
                dbname=os.getenv('DB_NAME'),
                user=os.getenv('DB_USER'),
                password=os.getenv('DB_PASSWORD')
            ) as conn:
                with conn.cursor() as cur:
                    cur.execute("SELECT * FROM Menu_Items")
                    return cur.fetchall()
        except Exception as e:
            print("Error fetching items:", e)
            return []
