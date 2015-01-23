require('spec_buddy')

describe('Stylist') do
  describe('#stylist_name') do
    it('will return the name of the stylist') do
      stylist1 = Stylist.new({:name => "Yo Mama"})
      expect(stylist1.stylist_name()).to(eq("Yo Mama"))
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

  describe('.find') do
    it('finds a specific stylist by his/her unique id') do
      stylist1 = Stylist.new({:name => "the Motley Crue crew"})
      stylist1.save()
      stylist2 = Stylist.new({:name => "the Def Leppard hair helpers"})
      stylist2.save()
      expect(Stylist.find(stylist2.stylist_id())).to(eq(stylist2))
    end
  end

  describe('.client_list') do

  end
end
