require_relative 'book_presenter'

class LibraryPresenter
  def self.display_shelf(library)
    library.shelf.map { |book| BookPresenter.display_book_info(book) }
  end
end
