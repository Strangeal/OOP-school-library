require_relative '../book'
require_relative '../student'
require_relative '../person'
require_relative '../rental'

describe Book do
  before :each do
    @new_book = Book.new('Book1', 'Hamzah')
  end

  it 'Inserted data should match attributes' do
    title = @new_book.title
    author = @new_book.author

    expect(title).to eql 'Book1'
    expect(author).to eql 'Hamzah'
  end

  it 'Rental instance should be created' do
    new_person = Person.new('Nick', 34)
    expect_obj = @new_book.rent_book(new_person, '2022/08/01')

    expect(expect_obj).to be_instance_of(Rental)
  end
end
