require 'board'

describe Board do
  describe "#initialize" do
    it 'contains a hash of numbers' do
      expect(subject.cells).to be_a(Hash)
    end
  end

  describe "#set" do
    it 'sets the user move on the board' do
      cell = 5
      subject.set(cell, 'X')
      expect(subject.cells[cell]).to eq('X')
    end
  end
  
end
