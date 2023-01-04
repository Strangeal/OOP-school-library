describe Person do
  it "person" do
    new_person = Person.new(12, "Baby")
    age = new_person.age
    name = new_person.name

    expect(age).to eql(age)
    expect(name).to eql(name)
  end

  it 'can use service' do
    new_person = Person.new(24, "Baby")
    testAge = new_person.can_use_services?
    testName = new_person.correct_name

    expect(testAge).to be_truthy
    expect(testName).to eql("Baby")
  end

  it "add book rental" do
    new_person = Person.new(24, "Baby")
    new_book = Book.new("Millions", "John Doe")
    expect_obj = new_person.add_book_rental(new_book, "2023/01/01")

    expect(expect_obj).to be_instance_of(Rental)
  end
end