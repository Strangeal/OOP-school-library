require_relative 'nameable'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return if of_age? && parent_permission

    true
  end

  def correct_name
    @name
  end

  def many?(rental)
    rentals.push(rental)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
    # @rentals = rentals
    # rentals.persons.push(self) unless rentals.persons.include?(self)
  end

  private

  def of_age?
    @age >= 18
  end
end
