require "rails_helper"
require "byebug"

RSpec.describe Hash do
  it 'try to test subject' do
    expect(subject.length).to eq(0)
    expect(subject.class).to eq(Array)

    array = subject.push('yakitori')

    expect(array.length).to eq(1)
    expect(array[0]).to eq('yakitori')
  end
end
