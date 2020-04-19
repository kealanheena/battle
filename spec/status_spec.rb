require 'status'

describe Status do

  let(:status) { Status.new }

  describe '#add' do
    it 'should add a status to the current array' do
      expect(status.add('poisoned')).to eq ['poisoned']
    end

    it 'should add different statuses to the current array' do
      expect(status.add('immobilised')).to eq ['immobilised']
    end

    it 'should be able to add multiple statuses to the current array' do
      status.add('poisoned')
      expect(status.add('immobilised')).to eq ['poisoned', 'immobilised']
    end

    it 'should not add the same status twice' do
      status.add('poisoned')
      status.add('poisoned')
      expect(status.add('immobilised')).to eq ['poisoned', 'immobilised']
    end
  end

  describe '#remove' do
    it 'should remove statuses' do
      status.add('poisoned')
      expect(status.remove('poisoned')).to eq []
    end

    it 'should only remove the specified statuses' do
      status.add('poisoned')
      status.add('immobilised')
      expect(status.remove('poisoned')).to eq ['immobilised']
    end

    it 'should retrun the current array if the remove item is not present' do
      status.add('immobilised')
      expect(status.remove('poisoned')).to eq ['immobilised']
    end
  end

  describe '#effect?' do
    it 'should return true when the status is in the current array' do
      status.add('immobilised')
      expect(status.effect?('immobilised')).to eq true
    end

    it 'should return false when the status is not in the current array' do
      expect(status.effect?('immobilised')).to eq false
    end
  end
end
