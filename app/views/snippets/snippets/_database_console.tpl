<h4>Database console</h4>

<p>Database console is ready to accept your commands.</p>

{code}
$ ./scripts/dbconsole
Timing is on.
psql (9.3.10)
SSL connection (cipher: DHE-RSA-AES256-GCM-SHA384, bits: 256)
Type "help" for help.

atk14_demo@mimi=> select count(*) from books;
 count 
-------
    78
(1 row)

Time: 2.484 ms
atk14_demo@mimi=> \q
{/code}

<p>In development you may find useful to empty a devel database and import data to it from the production database.</p>

{code}
$ ./scripts/destroy_database_objects 
Shall I wipe out all objects in the database atk14_demo?
Hit y, if so > y
table books dropped
table schema_migrations dropped
table users dropped
table categories dropped
table products dropped
table product_categories dropped
table sessions dropped
table session_values dropped
sequence seq_books dropped
sequence seq_categories dropped
sequence seq_product_categories dropped
sequence seq_products dropped
sequence seq_session_values dropped
sequence seq_sessions dropped
sequence seq_users dropped

Database atk14_demo is now empty. You may want to run:
 $ ATK14_ENV=development ./scripts/migrate

$ ssh deploy@server /path/to/your/deployed/project/scripts/dump_db | ./scripts/dbconsole
Timing is on.
SET
Time: 0.369 ms
SET
Time: 0.117 ms
CREATE EXTENSION
Time: 1.739 ms
SET
Time: 0.094 ms
CREATE SEQUENCE
Time: 6.298 ms
ALTER TABLE
Time: 0.411 ms
...
{/code}
