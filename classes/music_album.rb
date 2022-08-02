require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize( on_spotify: true)
    super(id: 50, publish_date: Date.today.to_s)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

end

p music_album = MusicAlbum.new()