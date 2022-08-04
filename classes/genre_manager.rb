require_relative 'genre'
require 'json'

class GenreManager
  def initialize
    @load_genres = []
  end

  def read_data
    return unless File.exist?('./data/genres.json')

    file = File.read('./data/genres.json')
    file_data = JSON.parse(file)
    genres = []
    file_data.each do |genre|
      genre_instance = Genre.new(genre['name'])
      genres.push(genre_instance)
    end
    genres
  end

  def list_all_genres
    puts 'Genres:'
    read_data.each do |genre|
      puts "Genre name: #{genre.name}"
    end
  end

  def save_genre(genre)
    read_data&.each do |data|
      @load_genres.push({ name: data.name, id: data.id }) if data.name.downcase != genre.name.downcase
    end
    @load_genres.push({ name: genre.name, id: genre.id })

    File.write('./data/genres.json', JSON.pretty_generate(@load_genres))
  end

  def add_genre_info(item)
    print "  What is the genre of the item?\n"
    print '  name: '
    genre_name = gets.chomp

    genre = Genre.new(genre_name)

    genre.add_item(item)

    save_genre(genre)
  end
end
