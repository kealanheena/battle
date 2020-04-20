describe Game do

  let(:player_1) { double(:player) }
  let(:player_2) { double(:player) }

  before(:each) do
    @game = Game.new('Dave', 'Jeff', player_1, player_2)
  end

  describe "#attack" do
    before(:each) do
      allow(player_1).to receive(:attack).with(10) { 50 }
      allow(player_2).to receive(:attack).with(10) { 50 }
    end

    it "should increment the turn counter after an attack" do
      expect(@game.attack).to eq 2
    end

    it "should increment the turn counter by 2 after an attack" do
      @game.attack
      expect(@game.attack).to eq 3
    end
  end

  describe "#special_attack" do
    before(:each) do
      allow(player_1).to receive(:immobilised?) { false }
      allow(player_2).to receive(:immobilised?) { false }
      allow(player_2).to receive(:special_attack).with('poisoned') { 55 }
    end

    it "should increment the turn counter after an attack" do
      expect(@game.special_attack('poisoned')).to eq 2
    end

    it "should increment the turn counter by 2 if immobilised" do
      allow(player_1).to receive(:immobilised?) { true }
      expect(@game.special_attack('poisoned')).to eq 3
    end
  end

  describe "#poison_damage" do
    before(:each) do
      allow(player_1).to receive(:poisoned?) { false }
      allow(player_2).to receive_messages(
        :poisoned? => true,
        :poison_damage => 59
      )
    end

    it "should do additional damage if true" do
      expect(@game.poison_damage).to eq 59
    end

    it "it should do nothing if false" do
      allow(player_2).to receive(:poisoned?) { false }
      expect(@game.poison_damage).to eq nil
    end
  end

  describe "#over?" do
    before(:each) do
      allow(player_1).to receive(:dead?) { true }
      allow(player_2).to receive(:dead?) { false }
    end

    it "should return true if a player is dead" do
      expect(@game.over?).to eq true
    end

    it "should return false if both players are alive" do
      allow(player_1).to receive(:dead?) { false }
      expect(@game.over?).to eq false
    end
  end

  describe "#self.instance" do
    it "should return an instance of the 'Game' class" do
      expect(Game.instance).to eq @game
    end
  end
end
