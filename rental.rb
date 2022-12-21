require_relative 'book'

class Rental
  attr_accessor :date, :book, :persons

  def initialize(date, book, persons)
    @date = date
    @book = book
    @persons = persons
    book.rentals << self
  end
end
