require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    difference = Time.now.year - @last_played_at
    return true if super() && difference > 2
    false
  end
end
