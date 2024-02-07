# frozen_string_literal: true

class AuthorPresenter
  def self.display_author_info(author)
    books_list = "#{@name} #{@surname}, books: "
    author.books.each do |book|
      books_list += "#{book.title};\n"
    end
    books_list
  end
end
