describe Rental do
  it 'rental' do
    new_book = Book.new("Book1", "Hamzah")
    new_student = Student.new("B-65", 67, "Nana") 
    new_rental = Rental.new("2020/09/09", new_book, new_student)

    expect(new_rental.book).to be_kind_of(Book)
    expect(new_rental.person).to be_kind_of(Student)
  end
end