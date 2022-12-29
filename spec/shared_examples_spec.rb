RSpec.shared_examples 'a Ruby object with three elements' do
  it 'returns the number of items' do
    expect(subject.length).to eq(3)
  end
end

RSpec.describe Array do
  subject { [1, 2, 3] }
end

RSpec.describe String do
  subject { 'abc' }
end

RSpec.describe Hash do
  subject {{ a: 1, b: 2, c: 3 }}
end