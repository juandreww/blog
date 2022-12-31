RSpec.describe 'not_to method' do
  it 'checks when value do not match' do
    expect(10).not_to eq(11)
    expect(11.0).not_to eql(11)
    expect([1, 2]).not_to eq([2, 1])
    expect([1, 2]).not_to eql([2, 1])
    expect([1, 2]).to match_array([2, 1])
    expect([1, 2, 3.0]).to eq([1, 2, 3])
    expect([1, 2, 3.0]).to eql([1, 2, 3.0])
    expect([1, 2]).to contain_exactly(2, 1)
  end
end