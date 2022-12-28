require "rails_helper"
require "byebug"

RSpec.describe Hash do
  subject(:bob) do
    {
      a: 1,
      b: 2
    }
  end

  it 'has two key value pairs' do
    expect(subject.length).to eq(2)
    expect(subject.class).to eq(Hash)
    expect(subject).to eq(bob)
  end

  context 'nested example' do
    it 'has two key value pairs' do
      expect(subject.length).to eq(2)
      expect(subject.class).to eq(Hash)
      expect(subject).to eq(bob)
    end
  end
end
