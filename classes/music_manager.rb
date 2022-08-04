require_relative 'music_album'
require_relative 'genre_manager'
require 'json'

class MusicManager
  def initialize
    @music_albums = []
    @genre_manager = GenreManager.new
  end

  def add_music_album
    puts '####################################'
    puts '####### Creating Music Album #######'
    puts '####################################'
    puts 'Album name: '
    name = gets.chomp
    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp
    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase == 'y' || false
    music_album = MusicAlbum.new(name, publish_date, on_spotify)
    @music_albums.push(music_album)
    @genre_manager.add_genre_info(music_album)
    puts '*---------------------------------*'
    puts '*-----* Music album created *-----*'
    puts '*---------------------------------*'
  end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |albums|
      puts "Name: #{albums.name}, Publish Date: #{albums.publish_date}, On Spotify: #{albums.on_spotify}"
    end
  end

  def load_music_albums
    file = './data/music_albums.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |music|
        @music_albums.push(MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify']))
      end
    end
    @music_albums
  end

  def save_music_album
    data = []
    @music_albums.each do |album|
      data.push({ name: album.name, publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.write('./data/music_albums.json', JSON.pretty_generate(data))
  end
end
