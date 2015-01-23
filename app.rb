require('sinatra')
require('sinatra/reloader')
require('pg')
also_reload('lib/**/*.rb')
require('./lib/clients')
require('./lib/stylists')

DB = PG.connect({:dbname => "hair"})

get('/') do
  erb(:index)
end
