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

  # def card
  #   puts 'Hey Card, I want you to play Spades!'
  #   card = Card.new('Ace', 'Spades')
  # end

  it 'has a rank' do
    byebug
    expect(card.rank).to eq('Ace')
  end

  it 'has a suit' do
    expect(card.suit).to eq('Spades')
  end
end