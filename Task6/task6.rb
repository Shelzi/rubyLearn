# frozen_string_literal: true

# Task: Create a simple class structure for a library system (Book, Author, Library).\
# Это наверное будет последняя таска в таком формате и лучше их разделять на отдельные проекты, кажется мне
# Каждый класс должен быть в отдельном файле с названием этого класса и тд.

require 'pry'

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

  def available?
    copies.positive?
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
    # puts "#{@name} #{@surname}, books: #{@books.each { |book| puts book.title }}" # как это правильно переписать?
    # binding.pry
    print "#{@name} #{@surname}, books: "
    books.each do |book|
      print "#{book.title}; "
    end
    puts
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

  def self.with_books(*books)
    new(books)
  end

  def display_shelf
    shelf.each { |book| puts book.display_book_info }
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

# Я специально заливаю именно в таком виде, что бы было видно что я делал или пытался делать
# binding.pry
author = Author.new('Anton', 'Nemtosu')
book = Book.new('New dawn', author, 'Comedy', 255, 1)
book2 = Book.new('Test2', author, 'Vaw', 255, 1)
book3 = Book.new('Test3', author, 'fFDSFds', 244, 5)

book.display_book_info
puts
author.add_book(book)
author.display_author_info
puts
author.add_book(book2)
author.add_book(book3)
puts
library = Library.with_books(book, book2, book3)
library.display_shelf
book.display_book_info
library.remove_book(book)
book.display_book_info
library.remove_book(book)
library.remove_book(book3)
library.remove_book(book3)
book3.display_book_info
library.add_book(book)
book.display_book_info
puts
search_book = library.find_book('new Dawn')
puts search_book.display_book_info
