require "rails_helper"
require "byebug"

RSpec.describe Array do
  it 'try to test subject' do
    expect(subject.length).to eq(0)
    expect(subject.class).to eq(Array)
    subject.push('yakitori')
    # expect(subject.length).to eq(1)
    # expect(subject[0]).to eq('yakitori')
  end
end
