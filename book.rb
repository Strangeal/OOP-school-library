require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def many?(rental)
    @rentals.push(rental)
    rental.books = self
  end

  def belongs_to=(rentals)
    @rentals = rentals
    rentals.books.push(self) unless rentals.books.include?(self)
  end
end
