# Task: Create a simple class structure for a library system (Book, Author, Library).

class Book
  attr_reader :title, :author, :genre, :pages
  attr_accessor :copies

  ONE_COPY = 1 # как бы и не magic number, но и глупость вроде #ещё название было COPIES_NUMBER

  def initialize(title, author, genre, pages, copies)
    @title = title
    @author = author
    @genre = genre
    @pages = pages
    @copies = copies
  end

  def add_copy
    self.copies += ONE_COPY # можно и как в джаве, вместо this только self
  end

  def remove_copy
    self.copies -= ONE_COPY
  end

  def is_available?
    copies > 0
  end

  def display_book_info
    puts "#{@title}, author #{@author.name} #{@author.surname}, genre: #{@genre}, pages: #{@pages}, copies available: #{@copies}"
  end
end

class Author
  attr_accessor :name, :surname, :books

  def initialize(name, surname)
    @name = name
    @surname = surname
    @books = []
  end

  def display_author_info
    puts "#{@name} #{@surname}, books: #{@books.each { |book| print "#{book}, " }}" #Переписать
  end

  def add_book(book)
    @books << book
  end
end

class Library
  attr_accessor :shelf

  ONE_COPY = 1 # как бы и не magic number, но и глупость вроде #ещё название было COPIES_NUMBER

  def initialize(shelf = [])
    @shelf = shelf
  end

  def display_shelf
    puts(shelf.each { |book| print "#{book}, " })
  end

  def add_book(book)
    @shelf << book
    book.add_copy(ONE_COPY)
  end

  def remove_book(book)
    if book.is_available?
      book.remove_copy(ONE_COPY)
    else
      puts 'No books available!'
    end
  end
end

author = Author.new('Anton', 'Nemtosu')
book = Book.new('New dawn', author, 'Comedy', 255, 1)
book.display_book_info

author.add_book(book)
author.display_author_info
