require_relative 'nameable'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id
  attr_reader :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return true if of_age? && parent_permission
  end

  def correct_name
    @name
  end

  def add_book_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
