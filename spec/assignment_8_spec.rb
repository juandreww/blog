RSpec.describe 'assignment 8' do
  hash = {}
  describe hash do
    it { is_expected.to be_empty }
  end

  describe [10, 20, 30] do
    it { is_expected.to all(be_even) }
  end

  describe [0, 1, 2] do
    it { is_expected.to all(be >= 0) }
  end

  context 'be matcher' do
    it 'should return truthy value' do
      expect("hello").to be_truthy
      expect(0).to be_truthy
      expect(-10).to be_truthy
      expect([]).to be_truthy
      expect(99.99).to be_truthy
      expect(:hello).to be_truthy
      expect([1, 2, 3]).to be_truthy
    end

    it 'should return falsey value' do
      expect(false).to be_falsey
      expect(nil).to be_falsey
    end
  end
end