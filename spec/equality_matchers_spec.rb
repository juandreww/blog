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
end