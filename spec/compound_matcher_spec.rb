require 'byebug'

RSpec.describe 'compound matcher' do
  context 'firetruck' do
    it { is_expected.to start_with('fire')
                    .and end_with('truck') }
  end

  context 20 do
    it { is_expected.to be_even
                    .and respond_to(:times) }
  end

  context [4, 8, 15, 16, 23, 42] do
    it { is_expected.to include(42)
                    .and start_with(4, 8, 15) }
  end
end