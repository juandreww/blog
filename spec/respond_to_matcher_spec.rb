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

  def waist_add_size(requestor, add_size = 0)
    "#{requestor} requested increase of waist from previously 52 cm will add #{add_size} cm"
  end
end

RSpec.describe Clothes do
  it 'confirms that an object can respond to a method' do
    expect(subject).to respond_to(:chest)
    expect(subject).to respond_to(:chest, :length)
    expect(subject).to respond_to(:waist_add_size).with(2).arguments
  end

  it 'confirms that an object cannot respond to a method' do
    expect(subject).not_to respond_to(:global_variables)
  end

  it { is_expected.to respond_to(:waist_add_size).with(2).arguments }
end