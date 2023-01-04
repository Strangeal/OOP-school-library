require_relative '../trim_decorator.rb'

describe TrimmerDecorator do
  it 'instance' do
    trim_decorator = TrimmerDecorator.new('mike')
    expect(trim_decorator).to be_kind_of(Decorator)
  end

  it 'name range' do
    new_person = Person.new(24, "babyIsSoNice")
    trim_decorator = TrimmerDecorator.new(new_person)
    

    expect(trim_decorator.correct_name).to eql("babyIsSoNi")
  end
end