describe Game do

  before(:each) do
    @player_1 = double(:player)
    @player_2 = double(:player)
    @game = Game.new(@player_1, @player_2)
    allow(@game.player_2).to receive(:health) { 50 }
    allow(@game.player_2).to receive(:get_damage) { 58 }
    allow(@game.player_1).to receive(:get_damage) { 58 }
  end

  describe "#initialize" do
    it "initializes with a player 1 variable" do
      expect(@game.player_1.name).to eq @player_1
    end

    it "initializes with a player 2 variable" do
      expect(@game.player_2.name).to eq @player_2
    end
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

  describe "#poison_attack" do
    it "should increment the turn counter after an attack" do
      expect(@game.poison_attack).to eq 2
    end

    it "should increment the turn counter by 2 after an attack" do
      @game.attack
      expect(@game.poison_attack).to eq 3
    end
  end

  describe "#electric_attack" do
    before(:each) do
      allow(@game.player_1).to receive(:paralysed) { false }
      allow(@game.player_2).to receive(:paralysed) { true }
    end

    it "should do additional damage if true" do
      expect(@game.electric_attack).to eq 3
    end

    it "it should do nothing if false" do
      allow(@game.player_2).to receive(:paralysed) { false }
      expect(@game.electric_attack).to eq 2
    end
  end

  describe '#sleep_spell' do
    it 'should increase the turn counter by 2 when srand(1) is run' do
      srand(1)
      expect(@game.sleep_spell).to eq 3
    end

    it 'should increase the turn counter by 1 when srand(6) is run' do
      srand(6)
      expect(@game.sleep_spell).to eq 2
    end
  end

  describe "#poison_damage" do
    before(:each) do
      allow(@game.player_1).to receive(:poison) { false }
      allow(@game.player_2).to receive(:poison) { true }
    end

    it "should do additional damage if true" do
      expect(@game.poison_damage).to eq 58
    end

    it "it should do nothing if false" do
      allow(@game.player_2).to receive(:poison) { false }
      expect(@game.poison_damage).to eq nil
    end
  end

  describe "#self.instance" do
    it "should return an instance of the 'Game' class" do
      expect(Game.instance).to eq @game
    end
  end
end
