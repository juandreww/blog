require 'byebug'

RSpec.describe 'raise_error matcher' do
  def some_method
    x
  end

  def string_minus_integer
    '10000' - 1000
  end

  def integer_minus_integer
    '10000'.to_i - 1000
  end

  it 'can check for a specific error being raised' do
    expect { some_method }.to raise_error(NameError)
    expect { string_minus_integer }.to raise_error(NoMethodError)
    expect { 10 / 0 }.to raise_error(ZeroDivisionError)
  end

  it 'returns valid response' do
    expect(integer_minus_integer).to eq(9_000)
  end
end