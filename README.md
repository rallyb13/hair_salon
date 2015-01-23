This is a Ruby application that uses the Sinatra gem as well as a database
(made with Postgres). To set up the database, use the following instructions:

CREATE DATABASE hair;
\c hair
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients_stylists (id serial PRIMARY KEY, client_id int, stylist_id int);
CREATE DATABASE hair_test WITH TEMPLATE hair; (this last if you run specs)

<hr></hr>

Though I could have simply added the stylist_id to the clients table (since it's one-to-many)
so that if I WANTED to scale quickly to a many-to-many, it wouldn't be difficult to do.
