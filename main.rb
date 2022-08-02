require './classes/app'

def main
  app = App.new
  app.run
end

def homepage(input)
  case input
  when '9'
    add_book
  when '13'
    puts 'Thanks for using the App'
    exit
  end
end

main
