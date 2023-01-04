describe Teacher do
  before :each do
    @teacher = Teacher.new 45, "Time Travel", "Mohammed"
end

it 'kind of ' do
  expect(@teacher).to be_kind_of(Person)
end

it 'specialization' do 
  spec = @teacher.specialization
  expect(spec).to eql('Time Travel')
end

it 'can use service' do
  service = @teacher.can_use_services?

  expect(service).to be_falsey
end
end