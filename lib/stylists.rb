class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_method(:==) do |other_guy|
    self.name().==(other_guy.name()).&(self.id().==(other_guy.id()))
  end

  define_singleton_method(:all) do
    stylists = []
    from_db = DB.exec("SELECT * FROM stylists;")
    from_db.each() do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    to_db = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = to_db.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |search_id|
    Stylist.all().each() do |stylist|
      if stylist.id().==(search_id)
        return stylist
      end
    end
  end

  # define_method(:add_client) do |new_client|
  #   joining = DB.exec("INSERT INTO clients_stylists (client_id, stylist_id) VALUES ('#{new_client.id()}', '#{self.id()}') RETURNING id;")
  #   join_id = joining.first().fetch("id").to_i()
  # end

#
  define_method(:client_list) do
    my_clients = []
    from_tables = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    from_tables.each() do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      my_clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
    end
    my_clients
  end
end
