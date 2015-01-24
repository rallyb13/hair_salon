require('spec_buddy')

describe('Client') do
  describe('#name') do
    it('will identify the name of the client') do
      test_client = Client.new({:name => "Cher"})
      expect(test_client.name()).to(eq("Cher"))
    end
  end

  describe('.all') do
    it('returns the entire list of clients--but is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('recognizes that two clients with the same name are the same') do
      test_client1 = Client.new({:name => "David Bowie", :stylist_id => 1})
      test_client2 = Client.new({:name => "David Bowie", :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe('#save') do
    it('saves a client into the database') do
      test_client = Client.new({:name => "Snuffleupagus", :stylist_id => 3})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  # describe('.find') do
  #   it("finds a client by that client's unique id") do
  #     test_client = Client.new({:name => "Dustin Diamond"})
  #     test_client.save()
  #     test_client2 = Client.new({:name => "Kelly Kapowski"})
  #     test_client2.save()
  #     expect(Client.find(test_client2.id())).to(eq(test_client2))
  #   end
  # end

  # describe('#add_stylist') do
  #   it('adds the specific stylist chosen by the client to the client database') do
  #     client1 = Client.new({:name => "Maurice"})
  #     client1.save()
  #     stylist1 = Stylist.new({:name => "Wild Things"})
  #     stylist1.save()
  #     expect(client1.add_stylist(stylist1)).to(be_an_instance_of(Fixnum))
  #   end
  # end

end
