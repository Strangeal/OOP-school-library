describe Nameable do
  it 'test nameable' do
    new_nameable = Nameable.new

    expect{new_nameable.correct_name}.to raise_error(NotImplementedError)
  end
end