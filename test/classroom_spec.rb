describe Classroom do
  it 'instance' do
    new_classroom = Classroom.new("grade")

    expect(new_classroom.label).to eql("grade")
  end

  it 'student' do
    new_student = Student.new("C-67", 34, "John Doe")
    new_classroom = Classroom.new("grade")
    new_classroom.add_student(new_student)

    expect(new_classroom.students.length).to eql 1
  end
end