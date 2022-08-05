require './classes/app'
require './classes/games_manager'
require './classes/author_manager'
require './classes/music_manager'
require './classes/genre_manager'

def main
  app = App.new
  app.run
end

def homepage(input)
  case input
  when '1'
    list_all_books(@books)
  when '2'
    @music_manager.list_all_music_album
  when '3'
    @games_manager.list_games
  when '4'
    @genres_manager.list_all_genres
  when '5'
    list_all_labels(@labels)
  when '6'
    @author_manager.list_authors
  when '7'
    add_book_instructions(@books)
    add_label_instructions(@labels)
  when '8'
    @music_manager.add_music_album
  when '9'
    @games_manager.add_game(@author_manager)
  
  when '10'
    @games_manager.store_games
    @author_manager.store_authors
    save_data(@books, 'books')
    save_data(@labels, 'labels')
    @music_manager.save_music_album
    puts 'Thanks for using the App'
    exit
  end
end

main
