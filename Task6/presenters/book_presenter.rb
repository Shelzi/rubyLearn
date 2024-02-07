# frozen_string_literal: true

class BookPresenter
  def self.display_book_info(book)
    "#{book.title},
     author #{book.author.name} #{book.author.surname},
     genre: #{book.genre},
     pages: #{book.pages},
     copies available: #{book.copies}"
  end
end
