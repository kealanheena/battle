require 'status'

describe Status do

  let(:status) { Status.new }

  describe '#add' do
    it 'should add a status to the current array' do
      expect(status.add('poisoned')).to eq ['poisoned']
    end

    it 'should add different statuses to the current array' do
      expect(status.add('paralysed')).to eq ['paralysed']
    end

    it 'should be able to add multiple statuses to the current array' do
      status.add('poisoned')
      expect(status.add('paralysed')).to eq ['poisoned', 'paralysed']
    end

    it 'should not add the same status twice' do
      status.add('poisoned')
      status.add('poisoned')
      expect(status.add('paralysed')).to eq ['poisoned', 'paralysed']
    end
  end

  describe '#remove' do
    it 'should remove statuses' do
      status.add('poisoned')
      expect(status.remove('poisoned')).to eq []
    end

    it 'should only remove the specified statuses' do
      status.add('poisoned')
      status.add('asleep')
      expect(status.remove('poisoned')).to eq ['asleep']
    end

    it 'should retrun the current array if the remove item is not present' do
      status.add('asleep')
      expect(status.remove('poisoned')).to eq ['asleep']
    end
  end

  describe '#effect?' do
    it 'should return true when the status is in the current array' do
      status.add('asleep')
      expect(status.effect?('asleep')).to eq true
    end

    it 'should return false when the status is not in the current array' do
      expect(status.effect?('asleep')).to eq false
    end
  end
end
