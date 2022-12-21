require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
# require_relative 'rental'

class Student < Person
  attr_accessor :classroom
  attr_reader :classrooms

  def initialize(classroom)
    super('Ahmed', 24)
    @classroom = classroom
  end

  def play_hooky
    ' ¯(ツ)/¯ '
  end

  def belongs_to=(classrooms)
    @classrooms = classrooms
    classrooms.students.push(self) unless classrooms.students.include?(self)
  end
end
