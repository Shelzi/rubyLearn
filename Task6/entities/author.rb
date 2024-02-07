class Author
  attr_accessor :name, :surname, :books

  def initialize(name, surname)
    @name = name
    @surname = surname
    @books = []
  end

  def add_book(book)
    @books << book
  end
end
