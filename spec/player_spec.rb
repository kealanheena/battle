require "player"

describe Player do 

  let(:dave) { Player.new('Dave') }

  describe "#initialize" do
    it "stores the players name" do 
      expect(dave.name).to eq "Dave"
    end

    it "initializes with a health of 60" do 
      expect(dave.health).to eq 60
    end
  end

  describe '#get_damage' do
    it "should reduce the players health by 10" do 
      expect(dave.get_damage).to eq 50
    end

    it "should reduce the players health by 20 if attacked twice" do 
      dave.get_damage
      expect(dave.get_damage).to eq 40
    end
  end

  describe '#dead?' do
    it "should start a player as alive" do
      expect(dave.dead?).to eq false
    end

    it "should still be alive after 5 attacks" do
      5.times {
        dave.get_damage
      }
      expect(dave.dead?).to eq false
    end

    it "should return true if a players hit points drop to 60" do 
      6.times {
        dave.get_damage
      }
      expect(dave.dead?).to eq true
    end

    it "should return true if a players hit points below 60" do
      7.times {
        dave.get_damage
      }
      expect(dave.dead?).to eq true
    end
  end
end
