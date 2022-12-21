require "rails_helper"
require "byebug"

RSpec.describe 'math calculations' do
  it 'should return false' do
    twitter_ceo = 'Jack Dorsey'
    expect(twitter_ceo).to_not eq('Elon Musk')
  end

  describe 'with even number' do
    it 'should return true' do
      expect(4.even?).to eq(true)
    end
  end

  it 'does basic math' do

=begin
  expect(3+4)
  def to(expect(3 + 4), eq(7))
    variable = 7
    case when eq
      then 7 == 7
      return true
  end
=end

    expect(3 + 4).to eq(7)
    expect(9 * 10).to eq(90)
    expect(100 / 10).to eq(10)
    expect(70 - 5).to eq(65)
  end
end