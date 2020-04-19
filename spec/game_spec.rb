describe Game do

  before(:each) do
    @player_1 = double(:player)
    @player_2 = double(:player)
    @game = Game.new(@player_1, @player_2)
    allow(@game.player_2).to receive(:health) { 50 }
    allow(@game.player_2).to receive(:apply_damage) { 58 }
    allow(@game.player_1).to receive(:apply_damage) { 58 }
  end

  describe "#attack" do
    it "should increment the turn counter after an attack" do
      expect(@game.attack).to eq 2
    end

    it "should increment the turn counter by 2 after an attack" do
      @game.attack
      expect(@game.attack).to eq 3
    end
  end

  describe "#poison_damage" do
    before(:each) do
      allow(@game.player_1).to receive(:poisoned?) { false }
      allow(@game.player_2).to receive(:poisoned?) { true }
    end

    it "should do additional damage if true" do
      expect(@game.poison_damage).to eq 58
    end

    it "it should do nothing if false" do
      allow(@game.player_2).to receive(:poisoned?) { false }
      expect(@game.poison_damage).to eq nil
    end
  end

  describe "#self.instance" do
    it "should return an instance of the 'Game' class" do
      expect(Game.instance).to eq @game
    end
  end
end
