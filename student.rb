require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super('Ahmed', 24)
    @classroom = classroom
  end

  def play_hooky
    ' ¯(ツ)/¯ '
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
