require 'byebug'
class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

RSpec.describe Card do

  let(:card) { Card.new('Ace', 'Spades') }
  let(:x) { 10 }
  let(:y) { x + 10 }

  # y = let(:x) + 10

  it 'has a rank' do
    expect(card.rank).to eq('Ace')
    expect(y).to eq(20)
  end

  it 'has a suit' do
    expect(card.suit).to eq('Spades')
  end
end