require_relative 'book'

class Rental
  attr_accessor :date
  attr_reader :books, :persons

  def initialize(date, _books, _persons)
    @date = date
    @books = []
    @persons = []
  end

  def many?(book, person)
    books.push(book)
    book.rentals = self
    persons.push(person)
    person.rentals = self
  end

  def belongs_to=(books, persons)
    @books = books
    books.rentals.push(self) unless books.rentals.include?(self)
    @persons = persons
    persons.rentals.push(self) unless persons.rentals.include?(self)
  end
end
