require_relative '../classes/book'

module BookModule
  def add_book_instructions(books)
    puts "\n---------------------------"
    puts "ENTER BOOK DETAILS \n"
    print 'Enter name of publisher : '
    publisher = gets.chomp
    print 'Enter cover state [e.g good or bad] : '
    cover_state = gets.chomp
    print 'Enter date of publish [yyyy/mm/dd] : '
    publish_date = gets.chomp
    add_book(publisher, cover_state, publish_date)
    puts 'Book created successfully !!'
    puts '---------------------------'
    books
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    hash = {
      'publisher' => book.publisher,
      'publish_date' => book.publish_date,
      'cover_state' => book.cover_state
    }
    @books << hash
  end

  def list_all_books(books)
    puts "\nNo Books available." if books.empty?
    puts "\n\t\t LIST OF BOOKS"
    puts "\nPublisher \t| Cover State \t| Publish Date"
    puts '--------------------------------------------'
    books.each do |book|
      puts "#{book['publisher']} \t\t| #{book['cover_state']} \t| #{book['publish_date']} "
      puts "\n----------------------------"
    end
  end
end
