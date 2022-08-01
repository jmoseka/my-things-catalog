# frozen_string_literal: true

require './classes/app'

def main
  app = App.new
  app.run
end

def homepage(input)
    case input
    when '13'
        puts 'Thanks for using the App'
        exit
    end
end


main
