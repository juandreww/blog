require "rails_helper"

RSpec.describe 'math calculations' do
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