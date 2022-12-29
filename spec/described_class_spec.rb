class King
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe King do
  subject { King.new('Boris') }

  it 'represents a good person' do
    expect(subject.name).to eq('Boris')
  end
end
