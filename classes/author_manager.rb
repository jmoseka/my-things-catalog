require_relative 'author'
class AuthorManager
  attr_accessor :author

  def initialize
    @authors = []
  end

  def add_author
    puts ''
    puts '####################################'
    puts '###### Creating a New Author #######'
    puts '####################################'
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author) unless @authors.include?(author)
    author
  end

  def list_authors
    puts ''
    if @authors.length.zero?
      puts '* No authors available, Create a game to add an author *'
    else
      @authors.each_with_index do |author, index|
        puts "#{index}| #{author.first_name} #{author.last_name}"
      end
    end
  end
end
