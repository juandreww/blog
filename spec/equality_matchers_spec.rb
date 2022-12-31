RSpec.describe 'equality matchers' do
  let(:a) { 3.0 }
  let(:b) { 3 }
  let(:a_string) { 'printer' }
  let(:b_string) { 'Printer' }
  let(:c_string) { "Printer" }

  describe 'eq matcher' do
    it 'tests for value and ignores the type' do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
      expect(a_string).to eq(b_string.downcase)
      expect(b_string).to eq(c_string)
      expect(b_string).to eql(c_string)
      expect(a_string).to eql(b_string.downcase)
    end
  end

  describe'equal and be matcher' do
    let(:first_array) { [1, 2, 3] }
    let(:second_array) { [1, 2, 3] }
    let(:third_array) { first_array }

    it 'cares about object identity' do
      expect(first_array).to eq(second_array)
      expect(first_array).to eql(second_array)
      expect(2).to be(2)
      expect([]).to be_empty
      expect(0).to be_zero
    end
  end
end