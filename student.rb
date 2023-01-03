require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'

class Student < Person
  attr_accessor :classroom
  attr_reader :type

  def initialize(age, classroom, name = 'Unknown', parent_permission: true, type: 'Student')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @type = type
  end

  def play_hooky
    ' ¯(ツ)/¯ '
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
