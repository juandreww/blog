require 'byebug'

RSpec.shared_context 'common' do
  before do
    @foods = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3]}
end

RSpec.describe 'first example group' do
  include_context 'common'

  context 'when first example' do
    let(:fifteen) { some_helper_method + 10 }
    let(:one_menu) { @foods + ['Chicken karaage'] }

    it 'can use outside instance variables' do
      one_menu
      expect(@foods.length).to eq(0)
      @foods << 'Sushi'
      expect(@foods.length).to eq(1)

      new_number = some_variable + [some_helper_method]
      expect(new_number.length).to eq(4)
      expect(fifteen).to eq(15)
      expect(one_menu).to match_array(['Chicken karaage'])
    end
  end
end
