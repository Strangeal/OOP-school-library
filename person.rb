require_relative 'student'

class Person
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return if of_age? && parent_permission

    true
  end

  private

  def of_age?
    @age >= 18
  end
end
