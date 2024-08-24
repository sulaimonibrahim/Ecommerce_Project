import psycopg2

try:
    connection = psycopg2.connect(
        user="sulaimonibrahim",
        password="Ladi_555",
        host="127.0.0.1",
        port="5433",
        database="ecommerce"
    )

    cursor = connection.cursor()
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connected to - ", record, "\n")

except Exception as error:
    print("Error while connecting to PostgreSQL", error)

finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
