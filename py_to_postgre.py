import psycopg2
import psycopg2.extras

print("gamarjoba")

hostname = 'localhost'
database = 'mynewdb'
username = 'postgres'
pwd = 'trarara'
port_id = 5432
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

	#cur = con.cursor(cursor_factory=psycopg2.extras.DictCursor)

	cur.execute('DROP TABLE IF EXIST employe')

	delete_script = ''' DROP TABLE h_owner
	'''

	insert_script = ' INSERT INTO employe (id, name, salary) VALUES (%s, %s, %s)'
	insert_value = [(1, 'James', 2000), (2, 'John', 1000)]
	for record in insert_value:
		cur.execute(insert_script, record)


	update_script = 'UPDATE employe SET salary = salary + (salary * 0,5)'

	cur.execute(delete_script)

	cur.execute('SELECT * FROM employe')
	#print(cur.fetchall())

	for record in cur.fetchall():
		#print(record)
		print(record[1], record[2])
		#print(record['name'], record['salary'])

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
