require_relative '../trim_decorator'

describe TrimmerDecorator do
  it 'Should inherit form Decorator' do
    trim_decorator = TrimmerDecorator.new('mike')

    expect(trim_decorator).to be_kind_of(Decorator)
  end

  it 'name should have no more than 10 characters' do
    new_person = Person.new(24, 'babyIsSoNice')

    trim_decorator = TrimmerDecorator.new(new_person)

    expect(trim_decorator.correct_name).to eql('babyIsSoNi')
  end
end
