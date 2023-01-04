require_relative '../book.rb'
require_relative '../student.rb'
require_relative '../person.rb'
require_relative '../rental.rb'

describe Book do
  it "book" do
    new_book = Book.new("Book1", "Hamzah")
    title = new_book.title
    author = new_book.author

    expect(title).to eql "Book1"
    expect(author).to eql "Hamzah"
  end

  it "rent book" do
    rental = Book.new("Millions", "Mike")
    new_person = Person.new("Nick", 34)
    expect_obj = rental.rent_book(new_person, "2022/08/01")

    expect(expect_obj).to be_instance_of(Rental)
    
  end
end