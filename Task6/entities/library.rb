class Library
  attr_accessor :shelf

  ONE_COPY = 1 # как бы и не magic number, но и глупость вроде #ещё название было COPIES_NUMBER

  def initialize(shelf = [])
    @shelf = shelf
  end

  def self.with_books(*books)
    new(books)
  end

  def add_book(book)
    @shelf << book
    book.add_copy
  end

  def remove_book(book)
    if book.available?
      book.remove_copy
    else
      puts 'No books available!'
    end
  end

  def find_book(search)
    shelf.select { |book| book.title.downcase == search.downcase }.first
  end
end
