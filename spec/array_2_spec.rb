require "rails_helper"
require "byebug"

RSpec.describe Array do
  subject(:sally) do
    [100, 108]
  end


  it 'has two key value pairs' do
    expect(subject.length).to eq(2)
    subject.pop
    expect(subject.length).to eq(1)
  end

  it 'has the same element with sally' do
    expect(sally).to eq(subject)
    expect(sally).to match_array([108, 100])
  end
end
