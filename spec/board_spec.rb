require 'board'

describe Board do
  describe '#initialize' do
    it 'contains a hash of numbers' do
      expect(subject.cells).to be_a(Hash)
    end

    it 'raises error if args are passed' do
      expect { Board.new('X') }.to raise_error(ArgumentError)
    end
  end

  describe '#set' do
    it 'sets the user move on the board' do
      cell = 5
      subject.set(cell, 'X')
      expect(subject.cells[cell]).to eq('X')
    end

    it 'raises argument error if only one arg is passed' do
      expect {subject.set('X')}.to raise_error(ArgumentError)
    end
  end

  describe '#track' do
    it 'checks the value of that board position' do
      cell = 9
      subject.set(cell, 'O')
      expect(subject.track(cell)).to eq('O')
    end

    it 'raises argument error if no args are passed' do
      expect {subject.track}.to raise_error(ArgumentError)
    end
  end
end
