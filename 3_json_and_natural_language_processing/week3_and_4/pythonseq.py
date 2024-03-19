import hidden
import psycopg2

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


def get_pseudo_random_number():
    number = 74836
    for i in range(300):
        yield i + 1, number
        number = int((number * 22) / 7) % 1000000


def sql_drop_and_create_if_not_exists():
    sql = "DROP TABLE IF EXISTS pythonseq CASCADE;"
    print(sql)
    cur.execute(sql)

    sql = "CREATE TABLE pythonseq (iter INTEGER, val INTEGER);"
    print(sql)
    cur.execute(sql)
    conn.commit()


sql_drop_and_create_if_not_exists()

for i, value in get_pseudo_random_number():
    sql = f"INSERT INTO pythonseq(iter, val) VALUES ({i}, {value})"
    print(sql)
    cur.execute(sql)
    if i % 50 == 0:
        conn.commit()
