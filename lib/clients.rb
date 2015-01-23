class Client

  attr_reader(:client_name, :client_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:name)
    @client_id = attributes[:id]
  end

  define_singleton_method(:all) do
    clients = []
    from_database = DB.exec("SELECT * FROM clients;")
    from_database.each() do |client|
      name = client.fetch('client_name')
      id = client.fetch('client_id').to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:==) do |other_guy|
    self.client_name().==(other_guy.client_name()).&(self.client_id().==(other_guy.client_id()))
  end

  define_method(:save) do
    to_database = DB.exec("INSERT INTO clients (client_name) VALUES ('#{@client_name}') RETURNING client_id;")
    @client_id = to_database.first().fetch('client_id').to_i()
  end

  define_singleton_method(:find) do |search_id|
    found_client = nil
    Client.all().each() do |client|
      if client.client_id().==(search_id)
        found_client = client
      end
    end
    found_client
  end



end
