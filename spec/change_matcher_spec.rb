RSpec.describe 'change matcher' do
  let(:ash_pokemons) {['pikachu', 'charizard', 'kingler', 'snorlax'] }

  context 'add pokemon' do
    it 'adds pidgeot to the pokemon list' do
      expect {
        ash_pokemons.push('pidgeot')
      }.to change { ash_pokemons.size }.from(4).to(5)
      .and change { ash_pokemons.size }.by(1)
      .and change { ash_pokemons }.from(['pikachu', 'charizard', 'kingler', 'snorlax'])
                                  .to(['pikachu', 'charizard', 'kingler', 'snorlax', 'pidgeot'])
    end
  end

  context 'remove pokemon' do
    it 'deletes snorlax from the pokemon list' do
      expect {
        ash_pokemons.pop
      }.to change { ash_pokemons.size }.from(4).to(3)
      .and change { ash_pokemons.size }.by(-1)
      .and change { ash_pokemons }.from(['pikachu', 'charizard', 'kingler', 'snorlax'])
                                  .to(['pikachu', 'charizard', 'kingler'])
    end
  end
end