describe Game do

  before(:each) do
    @player_1 = double(:player)
    @player_2 = double(:player)
    @game = Game.new(@player_1, @player_2)
    allow(@game.player_2).to receive(:health) { 50 }
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
      @game.attack
      expect(@game.turn).to eq 2
    end

    it "should increment the turn counter by 2 after an attack" do
      @game.attack
      @game.attack
      expect(@game.turn).to eq 3
    end
  end
end
