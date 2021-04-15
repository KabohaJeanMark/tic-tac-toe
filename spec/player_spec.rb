require 'player'

describe Player do
  describe "#initialize" do
    it 'creates a new player with capitalized name' do
      player_1 = Player.new('mark', 'X')
      expect(player_1.name).to eq('Mark')
    end
  end
  
end