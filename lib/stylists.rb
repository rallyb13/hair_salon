class Stylist

  attr_reader(:stylist_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:name)
    @stylist_id = attributes[:id]
  end

  define_method(:==) do |other_guy|
    self.stylist_name().==(other_guy.stylist_name()).&(self.stylist_id().==(other_guy.stylist_id()))
  end

  define_singleton_method(:all) do
    stylists = []
    from_db = DB.exec("SELECT * FROM stylists;")
    from_db.each() do |stylist|
      name = stylist.fetch('stylist_name')
      id = stylist.fetch('stylist_id').to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    to_db = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING stylist_id;")
    @stylist_id = to_db.first().fetch('stylist_id').to_i()
  end

  define_singleton_method(:find) do |search_id|
    Stylist.all().each() do |stylist|
      if stylist.stylist_id().==(search_id)
        return stylist
      end
    end
  end

end
