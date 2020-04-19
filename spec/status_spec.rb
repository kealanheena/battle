require 'status'

describe Status do

  let(:status) { Status.new }

  describe '#add' do
    it 'should add a status to the current array' do
      expect(status.add('poison')).to eq ['poison']
    end

    it 'should add different statuses to the current array' do
      expect(status.add('paralysed')).to eq ['paralysed']
    end

    it 'should be able to add multiple statuses to the current array' do
      status.add('poison')
      expect(status.add('paralysed')).to eq ['poison', 'paralysed']
    end

    it 'should not add the same status twice' do
      status.add('poison')
      status.add('poison')
      expect(status.add('paralysed')).to eq ['poison', 'paralysed']
    end
  end

  describe '#remove' do
    it 'should remove statuses' do
      status.add('poison')
      expect(status.remove('poison')).to eq []
    end
  end
end