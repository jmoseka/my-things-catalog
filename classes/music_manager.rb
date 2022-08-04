require_relative 'music_album'
require_relative 'genre'

class MusicManager
  def initialize
    @music_albums = []
  end

  def add_music_album
    puts '####################################'
    puts '###### Creating Music Album #######'
    puts '####################################'
    puts 'Album name: '
    name = gets.chomp
    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp
    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase == 'y' || false
    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts 'Music album created'
  end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |albums|
      puts "Name: #{albums.name}, Publish Date: #{albums.publish_date}, On Spotify: #{albums.on_spotify}"
    end
  end
end
