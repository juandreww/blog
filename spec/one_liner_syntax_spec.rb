RSpec.describe 'one liner syntax' do
  subject { [1, 2] }

  context 'with classical syntax' do
    it 'should equal to array [1, 2]' do
      expect(subject).to match_array([2, 1])
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to match_array([1, 2]) }
  end

  context 'with should expectation' do
    it { should match_array([1, 2]) }
  end
end
