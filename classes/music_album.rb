require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date, :id

  def initialize(name, publish_date, on_spotify)
    super(id, publish_date)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end
