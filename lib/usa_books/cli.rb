require 'colorize'

class UsaBooks::CLI

  def call
    list_books
    menu
    goodbye
  end


end
