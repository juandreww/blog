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

  let(:matrices) {
    [
      [ { name: 'ash' }, { age: 17 } ],
      [ { name: 'brock' }, { age: 19 } ]
    ]
  }

  let(:matrices_2) {
    [
      [ { text: 'name' }, { text: 'age' } ],
      [ { text: 'ash' }, { text: 17 } ],
      [ { text: 'brock' }, { text: 19 } ]
    ]
  }

  context 'list of pokemons' do
    it 'checks attributes and proper values' do
      expect(pokemon_lists).to include(age: 17)
      expect(pokemon_lists).to include(pokeballs_count: 4)
      expect(pokemon_lists).to include(list_pokemon: ['charizard',
        'snorlax',
        'pikachu',
        'bulbasaur'])
    end
  end

  context 'include matrices from array' do
    it 'checks attributes and proper values' do
      expect( matrices.map { |matrice| matrice[1][:age] } ).to all(be > 10)
      expect( matrices.map { |matrice| matrice[1][:age] } ).to eql([17, 19])
    end
  end

  context 'include matrices #2 from array' do
    it 'checks attributes and proper values' do
      expect( matrices.map { |matrice| matrice[1][:age] } ).to all(be > 10)
      expect( matrices.map { |matrice| matrice[1][:age] } ).to eql([17, 19])
    end
  end
end
