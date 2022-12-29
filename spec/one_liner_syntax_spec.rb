RSpec.describe 'one liner syntax' do
  subject { 5 }

  context 'with classical syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to eq(5) }
  end

  context 'with should expectation' do
    it { should eq(5) }
  end
end