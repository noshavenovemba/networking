import psycopg2
import psycopg2.extras

print("gamarjoba")

hostname = '3.82.22.69'
database = 'my'
username = 'postgres'
pwd = 'My:s3Cr3t/'
port_id = 30432
con = None
cur = None

try:
	con = psycopg2.connect(
		host = hostname,
		dbname = database,
		user = username,
		password = pwd,	
		port = port_id,
	)

	cur = con.cursor()
	print('PostgreSQL database version:')
	cur.execute('SELECT version()')
	db_version = cur.fetchone()
	print(db_version)


	postgreSQL_select_Query = "SELECT * FROM public.stuff"
	cur.execute(postgreSQL_select_Query)
	print("Selecting rows from mobile table using cursor.fetchall")
	stuff_records = cur.fetchall()
	print("Print each row and it's columns values")
	for record in stuff_records:
		print(record[0], record[1], record[2], record[3])

	con.commit()
	
	cur.close()
	con.close()

except Exception as error:
	print(error)
finally:
	if cur is not None:
		cur.close()
	if con is not None:
		con.close()
