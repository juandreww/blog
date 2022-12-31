RSpec.describe 'all matcher' do
  it 'allows for aggregate checks' do
    expect([5, 7, 9, 13]).to all(be_odd)
    expect([4, 6, 8, 10]).to all(be_even)
    expect([1, 1, 1]).to all(be == 1)
    expect([[], [], []]).to all(be_empty)
    expect([0, 1 - 1]).to all(be_zero)
    expect([5, 7, 9]).to all(be < 10)
  end

  describe [5, 7, 9] do
    it { is_expected.to all(be_odd) }
    it { is_expected.to all(be < 10) }
  end

  describe [2, 2] do
    it { is_expected.to all(eq(2)) }
  end
end