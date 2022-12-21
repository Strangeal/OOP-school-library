require_relative 'person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization)
    super('spe Alex', 55)
    @specialization = specialization
  end

  def can_use_services?
    false
  end
end
