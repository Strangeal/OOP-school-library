require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def many?(student)
    @students.push(student)
    student.classrooms = self
  end
end
