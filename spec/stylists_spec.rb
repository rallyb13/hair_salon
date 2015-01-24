require('spec_buddy')

describe('Stylist') do
  describe('#name') do
    it('will return the name of the stylist') do
      stylist1 = Stylist.new({:name => "Yo Mama"})
      expect(stylist1.name()).to(eq("Yo Mama"))
    end
  end

  describe('#==') do
    it('will recognize that two stylists with the same name are the same') do
      stylist1 = Stylist.new({:name => "Tone-EE"})
      stylist2 = Stylist.new({:name => "Tone-EE"})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.all') do
    it('returns the entire list of stylists--but is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a new stylist into the database') do
      stylist1 = Stylist.new({:name => "the double-rainbow guy"})
      stylist1.save()
      expect(Stylist.all()).to(eq([stylist1]))
    end
  end

  describe('#id') do
    it('will return the id of the stylist') do
      stylist1 = Stylist.new({:name => "Yogi Haira"})
      stylist1.save()
      expect(stylist1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('finds a specific stylist by his/her unique id') do
      stylist1 = Stylist.new({:name => "the Motley Crue crew"})
      stylist1.save()
      stylist2 = Stylist.new({:name => "the Def Leppard hair helpers"})
      stylist2.save()
      expect(Stylist.find(stylist2.id())).to(eq(stylist2))
    end
  end

  # describe('#add_client') do
  #   it('connects a client to a specific stylist') do
  #     stylist1 = Stylist.new({:name => "Harry Barber"})
  #     stylist1.save()
  #     client1 = Client.new({:name => "Ron Weasley-Grainger"})
  #     client1.save()
  #     expect(stylist1.add_client(client1)).to(be_an_instance_of(Fixnum))
  #   end
  # end

  describe('#client_list') do
    it('gives the list of clients who use a specific stylist') do
      stylist1 = Stylist.new({:name => "Harry Barber", :id => nil})
      stylist1.save()
      client1 = Client.new({:name => "Ron Weasley-Grainger", :stylist_id => stylist1.id()})
      client1.save()
      client2 = Client.new({:name => "Hermoine The Great", :stylist_id => stylist1.id()})
      client2.save()
      expect(stylist1.client_list()).to(eq([client1, client2]))
    end
  end

end
