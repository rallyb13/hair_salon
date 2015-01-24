This is a Ruby application that uses the Sinatra gem as well as a database
(made with Postgres). To set up the database, use the following instructions:

CREATE DATABASE hair;
\c hair
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_test WITH TEMPLATE hair; (this last if you run specs)

<hr></hr>
