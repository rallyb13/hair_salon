require('sinatra')
require('sinatra/reloader')
require('pg')
also_reload('lib/**/*.rb')
require('./lib/clients')
require('./lib/stylists')

DB = PG.connect({:dbname => "hair"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/add_stylists') do
  name = params.fetch("stylist_name")
  @stylist = Stylist.new({:name => name})
  @stylist.save()
  @stylists = Stylist.all()
  redirect('/')
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylists)
end

post('/client_list') do
  client_name = params.fetch("client_name")
  stylist_id = params.fetch("stylist_id").to_i()
  @client = Client.new({:name => client_name, stylist_id => stylist_id})
  @client.save()
  @stylist = styist.find(stylist_id)
  redirect('stylists/:id')
end
