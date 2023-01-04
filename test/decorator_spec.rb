require_relative '../decorator.rb'

describe Decorator do
  it 'decorator' do
    new_decorator = Decorator.new('Mike')
    expect(new_decorator).to be_kind_of(Nameable)
  end

  it 'nameable' do
    new_person = Person.new(24, "baby")
    new_decorator = Decorator.new(new_person)
    expect(new_decorator.nameable).to be_instance_of(Person)
  end

  it 'correct name' do
    new_person = Person.new(24, "baby")
    new_decorator = Decorator.new(new_person)

    expect(new_person.correct_name).to eql("baby")
  end
end