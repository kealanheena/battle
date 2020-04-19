require 'status'

describe Status do

  let(:status) { Status.new }

  describe '#add' do
    it 'should add a status to the current array' do
      expect(status.add('poison')).to eq ['poison']
    end
  end
end