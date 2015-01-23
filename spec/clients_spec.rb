require('spec_buddy')

describe('Client') do
  describe('#client_name') do
    it('will identify the name of the client') do
      test_client = Client.new({:name => "Cher"})
      expect(test_client.client_name()).to(eq("Cher"))
    end
  end

  describe('.all') do
    it('returns the entire list of clients--but is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('recognizes that two clients with the same name are the same') do
      test_client1 = Client.new({:name => "David Bowie"})
      test_client2 = Client.new({:name => "David Bowie"})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe('#save') do
    it('saves a client into the database') do
      test_client = Client.new({:name => "Snuffleupagus"})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

end
