RSpec.describe 'start & end with' do
  context 'caterpillar' do
    it 'should check for substring at the beginning or end' do
      expect(subject).to start_with('cat')
      expect(subject).to end_with('pillar')
    end

    it { is_expected.to start_with('cat') }
    it { is_expected.to end_with('pillar') }
  end

  describe [:a, :b, :c, :d] do
    it 'should check for elements at the beginning or end of the array' do
      expect(subject).to start_with(:a)
      expect(subject).to start_with(:a, :b)
      expect(subject).to start_with(:a, :b, :c)

      expect(subject).to end_with(:d)
      expect(subject).to end_with(:c, :d)
    end
  end

  context 'kitchen utensils' do
    let(:spatula) { 'spatula' }
    let(:spoon) { 'spoon' }
    let(:kitchen_utensils) { [ 'spatula', 'spoon' ] }

    it 'should check start & end with elements' do
      expect(spatula).to start_with('spa')
      expect(spatula).to end_with('atula')

      expect(spoon).to start_with('spo')
      expect(spoon).to end_with('poon')

      expect(kitchen_utensils).to start_with('spatula')
      expect(kitchen_utensils).to start_with('spatula', 'spoon')
      expect(kitchen_utensils).to end_with('spoon')
    end
  end
end