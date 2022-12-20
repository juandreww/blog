class Card < RSpec
  def initialize
    puts 'Hey Card, I want you to play Spades!'
    @card = Card.new('Ace', 'Spades')
  end

  def it_has_a_rank
    expect(@card.rank).to eq('Ace')
  end

  def it_has_a_suit
    expect(@card.suit).to eq('Spades')
  end
end