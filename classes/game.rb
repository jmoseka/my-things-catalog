class Game
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
