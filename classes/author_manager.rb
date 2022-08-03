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

  def load_authors
    data = []
    file = './data/author.json'
    return if File.zero?(file)

    JSON.parse(File.read(file)).each do |author|
      data.push(Author.new(author['first_name'], author['last_name']))
    end

    data.each do |item|
      first_name = item.first_name
      last_name = item.last_name
      author = Author.new(first_name, last_name)
      @authors << author unless @authors.include?(author)
    end
  end

  def store_authors
    data = []
    @authors.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    File.write('./data/author.json', JSON.generate(data))
  end
end
