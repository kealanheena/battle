require "player"

describe Player do 

  let(:dave) { Player.new('Dave') }
  let(:sam) { Player.new('Sam') }


  describe "#name" do
    it "returns the players name" do 
      expect(dave.name).to eq "Dave"
    end
  end

end