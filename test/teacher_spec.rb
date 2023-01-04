describe Teacher do
  before :each do
    @teacher = Teacher.new 45, 'Time Travel', 'Mohammed'
  end

  it 'Should inherit from person' do
    expect(@teacher).to be_kind_of(Person)
  end

  it 'specialization should return inserted data' do
    spec = @teacher.specialization

    expect(spec).to eql('Time Travel')
  end

  it 'can_use_service should always return false' do
    service = @teacher.can_use_services?

    expect(service).to be_falsey
  end
end
