require 'Attack'

describe Attack do

  let(:attack) { Attack.new('Dave') }

  describe '#initialize' do
    it 'should be initialized with a player' do
      expect(attack.player).to eq 'Dave'
    end

    it 'should be initialized with a default attack type of "normal"' do
      expect(attack.type).to eq 'normal'
    end

    it 'should be initialized with an attack type' do
      attack = Attack.new('Dave', 'poison')
      expect(attack.type).to eq 'poison'
    end
  end
end