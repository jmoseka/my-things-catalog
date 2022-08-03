class App
  def initialize
    @games_manager = GamesManager.new
    @author_manager = AuthorManager.new
    @music_manager = MusicManager.new
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
    loop do
      homepage(menu)
    end
  end
end
