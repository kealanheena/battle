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

  describe '#poison_attack' do
    it "should reduce the players health by 5" do 
      expect(dave.poison_attack).to eq 55
    end

    it "should set poison to true when srand(6) is passed" do
      srand(6)
      dave.poison_attack
      expect(dave.poison).to eq true
    end

    it "should make poison to falsey when srand(1) is passed" do
      srand(1)
      dave.poison_attack
      expect(dave.poison).to be_falsey
    end
  end

  describe '#electric_attack' do
    it "should reduce the players health by 5" do 
      expect(dave.electric_attack).to eq 55
    end

    it "should set paralysed to true when srand(7) is passed" do
      srand(7)
      dave.electric_attack
      expect(dave.paralysed).to eq true
    end

    it "should make paralysed to falsey when srand(1) is passed" do
      srand(1)
      dave.electric_attack
      expect(dave.paralysed).to be_falsey
    end
  end

  describe '#sleep_spell' do
    it 'should set sleeping to true when srand(1) is run' do
      srand(1)
      expect(dave.sleep_spell).to eq true
    end

    it 'should set sleeping to false when srand(6) is run' do
      srand(6)
      expect(dave.sleep_spell).to be_falsey
    end
  end
end
