require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(person, date)
    Rental.new(date, person, self)
    # @rentals.push(rental)
    # rental.books = self
  end

  # def belongs_to=(rentals)
  #   @rentals = rentals
  #   rentals.books.push(self) unless rentals.books.include?(self)
  # end
end
