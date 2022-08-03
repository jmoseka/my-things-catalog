require_relative 'genre'
require 'json'

class GenreManager
    def initialize
        @load_genres = load_genres 
      end

  def list_all_genres
    puts 'Genres:'
    @load_genres.each do |genre|
      puts "Genre name: #{genre.name}"
    end
  end

  def load_genres
    data = []
    file = './data/genres.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |genre|
        data.push(Genre.new(genre['name'], genre['id']))
      end
    end
    data
  end

  def save_genre
    data = []
    @music_albums.each do |genre|
      data.push({ name: genre.name, id: genre.id })
    end
    File.write('./data/genres.json', JSON.generate(data))
  end
end
