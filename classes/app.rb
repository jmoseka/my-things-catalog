require_relative '../modules/book_module'
require_relative '../modules/label_module'
require_relative '../modules/store_module'

class App
  include BookModule
  include LabelModule
  include StoreModule
  attr_accessor :books, :labels

  def initialize
    @games_manager = GamesManager.new
    @author_manager = AuthorManager.new
    @books = []
    @labels = []
    @music_manager = MusicManager.new
    @genres_manager = GenreManager.new
    load_info
  end

  def menu
    puts
    puts 'Welcome to Catalog of things!'
    puts
    puts 'Please Select an option by entering a number'

    @options = {
      '1': 'List all books',
      '2': 'List all music albums',
      '3': 'List all movies',
      '4': 'List of games',
      '5': 'List all genres',
      '6': 'List all labels',
      '7': 'List all authors',
      '8': 'List all sources',
      '9': 'Add a book',
      '10': 'Add a music album',
      '11': 'Add a movie',
      '12': 'Add a game',
      '13': 'Exit App'
    }

    @options.each do |option, string|
      puts "#{option} - #{string}"
    end
    print "\n Enter option from menu-list: "
    gets.chomp
  end

  def run
    @games_manager.load_games
    @author_manager.load_authors
    @music_manager.load_music_albums
    loop do
      homepage(menu)
    end
  end

  def load_info
    @books = load_data('books')
    @labels = load_data('labels')
  end

end
