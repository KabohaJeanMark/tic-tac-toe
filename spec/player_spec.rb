require 'player'

describe Player do
  describe '#initialize' do
    it 'creates a new player with capitalized name' do
      player = Player.new('mark', 'X')
      expect(player.name).to eq('Mark')
    end

    it 'raises error if no args are passed' do
      expect { Player.new }.to raise_error(ArgumentError)
    end
  end
end
