describe Student do
  before :each do
    @student = Student.new 'B-65', 67, 'Nana'
  end

  it 'student should inherit from person' do
    classroom = @student.classroom

    expect(classroom).to eql('B-65')
    expect(@student).to be_kind_of(Person)
  end

  it 'play_hooky should return a text emoji' do
    play = @student.play_hooky

    expect(play).to eql(' ¯(ツ)/¯ ')
  end

  it 'classrooms setter should populate @students array' do
    new_classroom = Classroom.new(@student.classroom)

    @student.classrooms = new_classroom

    expect(new_classroom.students.length).to eql(1)
  end
end
