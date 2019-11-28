require "player"

describe Player do 

  let(:dave) { Player.new('Dave') }
  let(:sam) { Player.new('Sam') }


  describe "#name" do
    it "returns the players name" do 
      expect(dave.name).to eq "Dave"
    end
  end

  scenario "player 1 attacks, player 2 loses 10 hp" do
    expect { dave.attack(sam) }.to change { sam.health }.by -10
  end
end