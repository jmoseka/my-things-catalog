require_relative './book'
require_relative './label'

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
        books << Book.new(publisher, cover_state, publish_date)
      end

      def add_label_instructions(labels)
        puts "\n---------------------------"
        puts "ENTER LABEL DETAILS \n"
        print 'Enter book label [e.g title] : '
        title = gets.chomp
        print 'Enter color of book : '
        color = gets.chomp
        add_label(title, color)
        puts 'Label created successfully !!'
        puts '---------------------------'
        books
      end

      def add_label(title, color)
        labels << Label.new(title, color)
      end
    
      def list_all_books(books)
        puts "\nNo Books available." if books.empty?
        puts "\n\t\t LIST OF BOOKS"
        puts "\nPublisher \t| Cover State \t| Publish Date"
        puts "--------------------------------------------"
        books.each do |book|
        puts "#{book.publisher} \t\t| #{book.cover_state} \t| #{book.publish_date} "
      puts "\n----------------------------"
    end
      end

      def list_all_labels(labels)
        puts "\nNo labels available." if labels.empty?
        puts "\n\t\t LIST OF LABELS"
        puts "\nLabels \t| Color "
        puts "----------------------------"
        labels.each do |lbl|
        puts "#{lbl.title} \t| #{lbl.color} "
      puts "\n----------------------------"
    end
      end

end