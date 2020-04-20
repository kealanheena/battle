require "player"

describe Player do 

  let(:status) { double(:status) }
  let(:dave) { Player.new('Dave', status) }

  before(:each) do
    allow(status).to receive(:add).with('poisoned') { ['poisoned'] }
    allow(status).to receive(:remove).with('immobilised') { [] }
    allow(status).to receive(:current) { [] }
  end

  describe "#initialize" do
    it "stores the players name" do 
      expect(dave.name).to eq "Dave"
    end
  end

  describe '#attack' do
    it "should reduce the players health by 10 when 10 is passed as an argument" do 
      expect(dave.attack(10)).to eq 50
    end

    it "should reduce the players health by 20 if attacked twice with 10 as an argument" do 
      dave.attack(10)
      expect(dave.attack(10)).to eq 40
    end
  end

  describe '#dead?' do
    it "should start a player as alive" do
      expect(dave.dead?).to eq false
    end

    it "should still be alive after receiving 50 damage" do
      dave.attack(50)
      expect(dave.dead?).to eq false
    end

    it "should return true if a players hit points drop to 60" do 
      dave.attack(60)
      expect(dave.dead?).to eq true
    end

    it "should return true if a players hit points below 60" do
      dave.attack(70)
      expect(dave.dead?).to eq true
    end
  end

  describe '#special_attack' do
    it 'should deal 5 damage' do
      expect(dave.special_attack('poisoned')).to eq 55
    end
  end

  describe '#poisoned?' do
    it 'should return false if player doesn\'t have poisoned status' do
      expect(dave.poisoned?).to eq false
    end

    it 'should return true if player has poisoned status' do
      allow(status).to receive(:current) { ['poisoned'] }
      expect(dave.poisoned?).to eq true
    end
  end

  describe '#immobilised?' do
    it 'should return false if player doesn\'t have immobilised status' do
      expect(dave.immobilised?).to eq false
    end

    it 'should return true if player has immobilised status' do
      allow(status).to receive(:current) { ['immobilised'] }
      expect(dave.immobilised?).to eq true
    end
  end
end
