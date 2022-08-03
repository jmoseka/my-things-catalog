require_relative 'game'
require_relative 'author'
require 'json'

class GamesManager
  attr_accessor :games

  def initialize
    @games = []
  end

  def add_game(author_manager)
    puts '#################################'
    puts '###### Creating a New Game #######'
    puts '##################################'
    puts 'Multiplayer? (y/n)'
    multi_player = gets.chomp
    puts 'Last played at (enter year)'
    last_played_at = gets.chomp.to_i
    puts 'Publish date (enter year)'
    publish_date = gets.chomp.to_i
    game = Game.new(multi_player, last_played_at, publish_date)
    game.move_to_archive if game.archived
    puts 'Would you like to add an author to the agame? [Y/N]?'
    author_result = gets.chomp
    author_manager.add_author if author_result.downcase == 'y'
    @games << game unless @games.include?(game)
    puts '*****************************'
    puts '****** Game  created! *******'
    puts '*****************************'
  end

  def list_games
    puts ''
    if @games.length.zero?
      puts '** No games available **'
    else
      puts ''
      @games.each_with_index do |game, index|
        puts "Game|#{index}| published:#{game.publish_date} last_visited:#{game.last_played_at}"
      end
    end
  end
end
