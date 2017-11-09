require 'colorize'

class UsaBooks::CLI

  def call
    puts "Welcome to the USA Today best sellers list!".blue
    book_list
    menu
    goodbye
  end

  def book_list
    puts "Here is the list of the bestsellers on USA Today Bestsellers: ".green
    books_arr = UsaBooks::Books.bestsellers_list
    puts books_arr.map.with_index { |book, index|
      puts "\t#{index+1}. #{book.title}"
    }
    books_arr
    end
end
