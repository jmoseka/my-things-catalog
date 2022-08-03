require_relative 'music_album'
require 'json'

class MusicManager
  def initialize
    @music_albums = []
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
    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts 'Music album created'
  end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |albums|
      puts "Name: #{albums.name}, Publish Date: #{albums.publish_date}, On Spotify: #{albums.on_spotify}"
    end
  end

  def load_music_albums
    data = []
    file = './data/music_albums.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |music|
        data.push(MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify']))
      end
    end
    data
  end

  def save_music_album
    data = []
    @music_albums.each do |album|
      data.push({ name: album.name, publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.write('./data/music_albums.json', JSON.generate(data))
  end
end
