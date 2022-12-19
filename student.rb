require_relative 'person'
require_relative 'teacher'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    ' ¯(ツ)/¯ '
  end
end
