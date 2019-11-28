describe Game do
  let(:dave) { Player.new('Dave') }
  let(:sam) { Player.new('Sam') }

  describe "#attack" do
    it "player 1 attacks, player 2 loses 10 hp" do
      expect { Game.new(dave, sam).attack(sam) }.to change { sam.health }.by -10
    end
  end
end
