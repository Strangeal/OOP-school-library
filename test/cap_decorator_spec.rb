require_relative '../cap_decorator'

describe CapitalizeDecorator do
  before :each do
    @new_person = Person.new(24, 'baby')
    @new_cap_decorator = CapitalizeDecorator.new(@new_person)
  end

  it 'CapitalizeDecorator should inherit from Decorator' do
    expect(@new_cap_decorator).to be_kind_of(Decorator)
  end

  it 'CapitalizeDecorator should capitalize the return value of person instance' do
    expect(@new_cap_decorator.correct_name).to eql('Baby')
  end
end
