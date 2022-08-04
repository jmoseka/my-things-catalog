require './classes/app'
require './classes/games_manager'
require './classes/author_manager'
require './classes/book'
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
  when '6'
    list_all_labels(@labels)

  when '1'
    list_all_books(@books)
  when '6'
    list_all_labels(@labels)
  when '2'
    @music_manager.list_all_music_album
  when '10'
    @music_manager.add_music_album
  when '5'
    @genres_manager.list_all_genres
  when '9'
    add_book_instructions(@books)
    add_label_instructions(@labels)
  when '13'
    @games_manager.store_games
    @author_manager.store_authors
    save_data(@books, 'books')
    save_data(@labels, 'labels')
    @music_manager.save_music_album
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
