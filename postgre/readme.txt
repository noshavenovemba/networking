SELECT * FROM my_table WHERE upper(my_column) LIKE 'SEARCHED %';  -- starts with
SELECT * FROM my_table WHERE upper(my_column) LIKE '% SEARCHED';  -- ends with
SELECT * FROM my_table WHERE upper(my_column) LIKE '%SEARCHED%';  -- contains

CASE WHEN something THEN ELSE // if else

DISTINCT vs GROUP BY // DISTINCT gets specific values

UNION // combine SQL queries

AVG SUM // aggregate functions

RANK ROW_NUMBER // window function to assign values

SELECT DATE_FORMAT (...) as date_value

GROUP BY -> HAVING

VIEW (sql query, dynamic change) vs SYNONYM (alias) // 

--- restore superuser ---
Stop the database server as operating system user postgres : /path/to/postgresql/bin/pg_ctl stop -D /path/to/data/directory.
Start the server in single user mode: /path/to/postgresql/bin/postgres --single -D /path/to/data/directory postgres. ...
Restore the superuser privilege: ALTER ROLE postgres SUPERUSER.

pg_hba.conf
- authentication type
- who can authenticate
- which database to authenticate
- which IP addresses are allowed

\dt // all tables
\c
\l // all databases

CREATE DATABASE test_erp;
\c test_erp
CREATE TABLE clients (id SERIAL PRIMARY KEY, first_name VARCHAR, last_name VARCHAR, role VARCHAR);

psql -h 44.204.52.138 -p 5432 -d test_erp -U vadim

nano /etc/postgresql/14/main/pg_hba.conf

sudo -u postgres psql

CREATE user1 WITH PASSWORD 'user1' WITH CREATEROLE SUPERUSER

pg_dump -U vadim -d test_erp > clients.sql

\i /tmp/clients.sql
