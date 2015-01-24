class Client

  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes[:stylist_id]

  end

  define_singleton_method(:all) do
    clients = []
    from_database = DB.exec("SELECT * FROM clients;")
    from_database.each() do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:==) do |other_guy|
    self.name().==(other_guy.name()).&(self.stylist_id().==(other_guy.stylist_id()))
  end

  define_method(:save) do
    to_database = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = to_database.first().fetch('id').to_i()
  end

  # define_singleton_method(:find) do |search_id|
  #   found_client = nil
  #   Client.all().each() do |client|
  #     if client.id().==(search_id)
  #       found_client = client
  #     end
  #   end
  #   found_client
  # end

  # define_method(:add_stylist) do |new_stylist|
  #   new_info = DB.exec("INSERT INTO clients_stylists (client_id, stylist_id) VALUES (#{self.id()}, #{new_stylist.id()}) RETURNING id;")
  #   join_id = new_info.first().fetch("id").to_i()
  # end

end
