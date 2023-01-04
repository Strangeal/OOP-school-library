require_relative '../cap_decorator.rb'

describe CapitalizeDecorator do
  it 'instance' do
    new_cap_decorator = CapitalizeDecorator.new('mike')
    expect(new_cap_decorator).to be_kind_of(Decorator)
  end

  it 'capitalize' do
    new_person = Person.new(24, "baby")
    new_cap_decorator = CapitalizeDecorator.new(new_person)
    

    expect(new_cap_decorator.correct_name).to eql("Baby")
  end
end