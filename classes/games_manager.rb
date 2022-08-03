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

  def load_games
    data = []
    file = './data/games.json'
    return if File.zero?(file)

    JSON.parse(File.read(file)).each do |games|
      data.push(Game.new(games['multiplayer'], games['last_played_at'], games['publish_date']))
    end

    data.each do |item|
      multi_player = item.multiplayer
      last_played_at = item.last_played_at
      publish_date = item.publish_date
      game = Game.new(multi_player, last_played_at, publish_date)
      @games << game unless @games.include?(game)
    end
  end

  def store_games
    data = []
    @games.each do |game|
      data.push({ multiplayer: game.multiplayer, publish_date: game.publish_date,
                  last_played_at: game.last_played_at })
    end
    File.write('./data/games.json', JSON.generate(data))
  end
end
