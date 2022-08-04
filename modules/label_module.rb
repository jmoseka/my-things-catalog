require_relative '../classes/label'

module LabelModule
  def add_label_instructions(_labels)
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
    lbl = Label.new(title, color)
    hash = {
      'title' => lbl.title,
      'color' => lbl.color
    }
    @labels << hash
  end

  def list_all_labels(labels)
    puts "\nNo labels available." if labels.empty?
    puts "\n\t\t LIST OF LABELS"
    puts "\nLabels \t| Color "
    puts '----------------------------'
    labels.each do |lbl|
      puts "#{lbl['title']} \t| #{lbl['color']} "
    end
  end
end
