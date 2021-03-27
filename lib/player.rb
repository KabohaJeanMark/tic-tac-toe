class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name.capitalize
    @token = token
  end
end
