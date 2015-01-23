require('rspec')
require('pg')
require('pry')
require('stylists')
require('clients')

DB = PG.connect({:dbname => 'hair_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM clients_stylists *;")
  end
end
