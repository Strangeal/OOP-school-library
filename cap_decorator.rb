require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.upcase.to_s
  end
end
