require 'colorize'

class UsaBooks::CLI

  def call
    puts "Welcome to the USA Today best sellers list!".blue
    book_list
    menu
    goodbye
  end
end
