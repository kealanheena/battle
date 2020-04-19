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

    it 'should add different statuses to the current array' do
      status.add('poison')
      expect(status.add('paralysed')).to eq ['poison', 'paralysed']
    end
  end
end