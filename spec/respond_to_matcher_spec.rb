require 'byebug'

class HotChocolate
  def drink
    'Delicious'
  end

  def discard
    'PLOP!'
  end

  def purchase(number)
    "Awesome, I just purchased #{number} more hot chocolate beverages!"
  end
end

RSpec.describe HotChocolate do
  it 'confirms that an object can respond to a method' do
    expect(subject).to respond_to(:drink)
    expect(subject).to respond_to(:drink, :discard)
  end
end

class Clothes
  def chest
    '52 cm'
  end

  def waist
    '52 cm'
  end

  def length
    '74 cm'
  end
end

RSpec.describe Clothes do
  it 'confirms that an object can respond to a method' do
    byebug
  end
end