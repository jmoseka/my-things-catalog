require './classes/app'
require './classes/games_manager'
require './classes/author_manager'

def main
  app = App.new
  app.run
end

def homepage(input)
  case input
  when '13'
    @games_manager.store_games
    @author_manager.store_authors
    puts 'Thanks for using the App'
    exit
  when '12'
    @games_manager.add_game(@author_manager)
  when '4'
    @games_manager.list_games
  when '7'
    @author_manager.list_authors
  end
end

main
