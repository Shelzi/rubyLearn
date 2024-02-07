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
end
