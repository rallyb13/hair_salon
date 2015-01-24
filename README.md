The Hair Salon:

This is a Ruby application that uses the Sinatra gem as well as a database
(made with Postgres). To set up the database, use the following instructions:

CREATE DATABASE hair;
\c hair
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_test WITH TEMPLATE hair; (this last if you run specs)

<hr></hr>

In addition to the database, you will need the following gems:
sinatra, sinatra-contrib, pg
if you are planning to dig around in the code, I also recommend rspec & maybe pry
I've included the gemfile for sinatra & pg, so if you "gem install bundler",
you can get those by simply running the command "bundle".
As this is a Sinatra-enabled application, you'll need to go to localhost:4567/ to view it.

<hr></hr>
Functionality: The idea is pretty simple. There's one page for keeping track of stylists,
and there's another for keeping track of their very loyal customers
(as this is a one-to-many relationship and therefore assumes no client flips stylists).


Needs styling, but there aren't any real bugs to speak of. If you find one, please let me know.
Feel free to try and break it. I'm still pretty new, so feedback is appreciated.

Author: Benjamin D. Herson, MIT license
