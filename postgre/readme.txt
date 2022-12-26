SELECT * FROM my_table WHERE upper(my_column) LIKE 'SEARCHED %';  -- starts with
SELECT * FROM my_table WHERE upper(my_column) LIKE '% SEARCHED';  -- ends with
SELECT * FROM my_table WHERE upper(my_column) LIKE '%SEARCHED%';  -- contains

--- restore superuser ---
Stop the database server as operating system user postgres : /path/to/postgresql/bin/pg_ctl stop -D /path/to/data/directory.
Start the server in single user mode: /path/to/postgresql/bin/postgres --single -D /path/to/data/directory postgres. ...
Restore the superuser privilege: ALTER ROLE postgres SUPERUSER.

pg_hba.conf
- authentication type
- who can authenticate
- which database to authenticate
- which IP addresses are allowed
