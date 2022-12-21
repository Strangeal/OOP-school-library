require_relative 'book'

class Rental
  attr_accessor :date, :books, :persons

  def initialize(date, books, persons)
    @date = date
    @books = books
    @persons = persons
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
