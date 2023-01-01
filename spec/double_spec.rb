require 'byebug'

RSpec.describe 'a random double' do
  it 'only allows defined methods to be invoked' do
    stuntman = double('Mr. Loid Forger')
    byebug
    allow(stuntman).to receive(:save_anya)
                   .and_return('are you okay?')

    expect(stuntman.save_anya).to eq('are you okay?')
  end
end