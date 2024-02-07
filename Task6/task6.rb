# frozen_string_literal: true #???
# Task: Create a simple class structure for a library system (Book, Author, Library).\

require_relative 'entities/author'
require_relative 'entities/book'
require_relative 'entities/library'

require_relative 'presenters/author_presenter'
require_relative 'presenters/book_presenter'
require_relative 'presenters/library_presenter'

author = Author.new('Anton', 'Nemtosu')
book = Book.new('New dawn', author, 'Comedy', 255, 1)
book2 = Book.new('Test2', author, 'Vaw', 255, 1)
book3 = Book.new('Test3', author, 'fFDSFds', 244, 5)

puts BookPresenter.display_book_info(book)
puts
author.add_book(book)
puts AuthorPresenter.display_author_info(author)
puts
author.add_book(book2)
author.add_book(book3)
puts
library = Library.with_books(book, book2, book3)
puts LibraryPresenter.display_shelf(library)
puts BookPresenter.display_book_info(book)
library.remove_book(book)
puts BookPresenter.display_book_info(book)
library.remove_book(book)
library.remove_book(book3)
library.remove_book(book3)
puts BookPresenter.display_book_info(book3)
library.add_book(book)
puts BookPresenter.display_book_info(book)
puts
search_result = library.find_book('new Dawn')
puts BookPresenter.display_book_info(search_result)
