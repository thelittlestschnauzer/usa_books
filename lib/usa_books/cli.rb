require 'colorize'
require 'open-uri'
require 'readline'

class UsaBooks::CLI

  def call
    puts "Welcome to the USA Today best sellers list!".blue
    book_list
    #select_book
    #goodbye
  end

  def book_list
    puts "Here is the list of the bestsellers on USA Today Bestsellers: ".green

    books_arr = UsaBooks::Books.bestsellers_list
    puts books_arr.map.with_index {|book, index|
       "\t#{index+1}. #{book.title}"
    }
    select_book(books_arr)
    end

    def select_book(books_arr)
      input = nil
      while input != 'exit'
        puts "Enter the number of the book you would like to know more about or type list to see the books again or type exit if you are done.".green


        input = gets.strip.downcase
        #goodbye if input.downcase == 'exit'
         #input = input.to_i

        if input.to_i > 0 #&& input < 11
          book_name = books_arr[input.to_i-1]
          puts "#{book_name.description}".blue
        elsif input == "list"
          book_list
        elsif input == "exit"
          goodbye
        else
          puts "I'm not sure which book you selected, please select a book or type exit"
        end
      end
    end

    # def menu
    #   input = nil
    #   while input != "exit"
    #
    #     puts "Enter the number of the book you would like to read more about, or list to see the list of books again or you can type exit."
    #     input = gets.strip.downcase
    #
    #     if input.to_i > 0
    #       the_book = @books[input.to_i-1].title.strip
    #       puts "#{author} writes #{the_book.description}"
    #     elsif input == "list"
    #       books_arr
    #     elsif input == "exit"
    #       goodbye
    #     else
    #       puts "That was not a valid selection, please type list or exit"
    #     end
    #   end
    # end

    def goodbye
      puts "Come back and read with USA Today again!".green
    end
  end
