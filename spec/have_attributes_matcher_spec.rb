require 'byebug'
class ProfessionalWrestler
  attr_reader :name, :finishing_move

  def initialize(name, finishing_move)
    @name = name
    @finishing_move = finishing_move
  end
end

RSpec.describe 'have_attributes matcher' do
  context ProfessionalWrestler.new('Stone World', 'Science') do
    it 'checks for object attribute and proper values' do
      expect(subject).to have_attributes(name: 'Stone World')
      expect(subject).to have_attributes(name: 'Stone World', finishing_move: 'Science')
    end

    it { is_expected.to have_attributes(name: 'Stone World') }
    it { is_expected.to have_attributes(name: 'Stone World', finishing_move: 'Science') }
  end
end

RSpec.describe 'pokemon attributes' do
  let(:pokemon_lists) {
    {
      tamer: 'Ash',
      age: 17,
      pokeballs_count: 4,
      list_pokemon: [
        'charizard',
        'snorlax',
        'pikachu',
        'bulbasaur'
      ]
    }
  }

  context 'list of pokemons' do
    it 'checks attributes and proper values' do
      expect(pokemon_lists).to include(age: 17)
    end
  end
end