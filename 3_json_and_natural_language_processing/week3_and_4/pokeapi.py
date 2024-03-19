# Week 4 exersice (only this one)
import time

import hidden
import psycopg2
import requests

secrets = hidden.secrets()

conn = psycopg2.connect(
    host=secrets["host"],
    port=secrets["port"],
    database=secrets["database"],
    user=secrets["user"],
    password=secrets["pass"],
    connect_timeout=3,
)

cur = conn.cursor()


def sql_drop_and_create_if_not_exists():
    sql = "DROP TABLE IF EXISTS pokeapi CASCADE;"
    print(sql)
    cur.execute(sql)

    sql = "CREATE TABLE pokeapi (id INTEGER, body JSONB);"
    print(sql)
    cur.execute(sql)
    conn.commit()


sql_drop_and_create_if_not_exists()

i = 0
proceed = True
while i < 100:
    try:
        url = f"https://pokeapi.co/api/v2/pokemon/{i+1}"
        pokemon = requests.get(url)
        sql_commad = f"INSERT INTO pokeapi(id, body) VALUES ({i+1} , '{pokemon.text}');"
        cur.execute(sql_commad)
        if i == 0:
            print(sql_commad)
        i += 1
    except Exception as e:
        print(
            f"Error while retrieving the json data for {i}. {str(e)}. Waiting before retry."
        )
        time.sleep(5)
    except KeyboardInterrupt:
        proceed = False
        print("Cancelled by user")

if proceed:
    conn.commit()
    print("Done")
