describe Game do

  describe "#attack" do
    it "player 1 attacks, player 2 loses 10 hp" do
      game = Game.new("Dave", "Sam")
      expect { game.attack }.to change { game.player_2.health }.by -10
    end
  end
end
