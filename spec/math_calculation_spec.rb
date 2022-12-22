require "rails_helper"
require "byebug"

RSpec.describe 'math calculations' do
  before(:example) do
    @number = 4
    puts 'Outer before example'
  end

  after(:example) do
    puts 'Outer after example'
  end

  it 'should return not Jack Dorsey' do
    twitter_ceo = 'Jack Dorsey'
    expect(twitter_ceo).to_not eq('Elon Musk')
  end

  before(:context) do
    puts 'Before context'
  end

  after(:context) do
    puts 'After context'
  end

  describe 'with even number' do
    puts 'Before Before'

    before(:context) do
      puts 'Inner before context'
    end

    after(:context) do
      puts 'Inner after context'
    end

    before(:example) do
      @number = 4
      puts 'Inner before example'
    end

    after(:example) do
      puts 'Inner after example'
    end

    it 'should return true' do
      expect(@number.even?).to eq(true)
      puts 'After Test'
    end

    puts 'After After'
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