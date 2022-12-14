RSpec.describe 'satisfy matcher' do
  subject { 'noon' }

  it 'is a palindrome' do
    expect(subject).to satisfy { |value| value == value.reverse }
    expect(subject).to satisfy { |value| value == 'NOON'.downcase }
  end

  it 'can accept a custom error message' do
    expect(subject).to satisfy('be a palindrome') do |value|
      value == value.reverse
    end
  end
end