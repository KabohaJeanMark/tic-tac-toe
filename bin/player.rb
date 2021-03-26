class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name.capitalize
    @token = token
  end

  def to_s
    @name
  end
end
