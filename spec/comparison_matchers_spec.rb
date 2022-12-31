RSpec.describe 'comparison matchers' do
  lion = 'lion'
  fifty = 50
  three_point_three = 3.3

  it 'allows for comparison with built-in Ruby operators' do
    number = 10
    number_2 = 5
    number_3 = 3

    char_1 = 'a'
    char_2 = 'A'

    string_1 = 'ab'
    string_2 = 'ac'
    string_3 = 'ab'

    expect(string_1).to be <= string_2

    expect(char_1).to be >= char_2
    expect(number).to be >= number_2

    expect(10).to be > 5
    expect(8).to be < 15

    expect(1).to be >= -1
    expect(1).to be >= 1

    expect(22).to be <= 100
    expect(22).to be <=22
  end

  describe 100 do
    it { is_expected.to be > 90 }
    it { is_expected.to be >= 100 }
    it { is_expected.to be < 500 }
    it { is_expected.to be <= 100 }
    it { is_expected.not_to be > 105 }
  end

  describe lion do
    it { is_expected.to eq('lion') }
    it { is_expected.to eq('Lion'.downcase) }
    it { is_expected.to eq('lions'.chop) }
  end
end