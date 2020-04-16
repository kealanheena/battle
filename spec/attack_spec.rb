require 'Attack'

describe Attack do

  let(:attack) { Attack.new('Dave', 'Normal') }

  describe '#initialize' do
    it 'should be initialized with a player' do
      expect(attack.player).to eq 'Dave'
    end

    it 'should be initialized with an attack type' do
      expect(attack.type).to eq 'Normal'
    end
  end
end