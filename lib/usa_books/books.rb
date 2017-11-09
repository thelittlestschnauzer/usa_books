class UsaBooks::Books

  attr_accessor :title, :author, :description

  def self.bestsellers_list
    self.scrape_books
  end

  def self.scrape_books

    list_of_books = []

    doc = Nokogiri::HTML(open('https://www.usatoday.com/life/books/best-selling/'))
    bestbooks = doc.search('aside.comp.books-meta-comp')
    bestbooks.each_with_index{|book, index|
      if index < 11 then

        new_book = UsaBooks::Books.new
        new_book.title = book.search('h3.books-front-meta-title').text
        new_book.author = book.search('span.books-front-meta-author').text
        new_book.description = book.css('div.books-front-meta-short').text
        list_of_books[index] = new_book
      end
    }
    list_of_books
  end

end
