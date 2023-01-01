RSpec.describe 'include matcher' do
  context 'hot chocolate' do
    it 'checks for substring inclusion' do
      expect(subject).to include('hot')
      expect(subject).to include('chocolate')
    end

    it { is_expected.to include('chocolate') }
  end

  context [10, 20, 30] do
    it 'checks for inclusion in the array, regardless of order' do
      expect(subject).to include(10)
      expect(subject).to include(10, 20)
      expect(subject).to include(30, 20)
    end

    it { is_expected.to include(20, 30, 10) }
  end

  context ({ a: 2, b: 4 }) do
    it 'can check for key existence' do
      expect(subject).to include(:a)
      expect(subject).to include(:a, :b)
      expect(subject).to include(:b, :a)
    end

    it 'can check for key-value pair' do
      expect(subject).to include(a: 2)
    end

    it { is_expected.to include(:b) }
    it { is_expected.to include(b: 4) }
  end

  context 'hash object' do
    let(:list_of_drink) { {
      sprite: 10_000,
      fanta: 9_500,
      coca_cola: 11_000,
      sell_at: [
        'vending machine',
        'offline store',
        'online store'
      ]
    } }

    it 'can check for key existence' do
      expect(list_of_drink).to include(:sprite)
      expect(list_of_drink).to include(:coca_cola, :fanta)
      expect(list_of_drink).not_to include(:aqua)
    end

    it 'can check for key-value pair' do
      expect(list_of_drink).to include(sprite: 10_000)
      expect(list_of_drink).to include(fanta: 9_500)
      expect(list_of_drink).to include(sell_at: [
        'vending machine',
        'offline store',
        'online store'
      ])
      expect(list_of_drink[:sell_at].class).to eq(Array)
      expect(list_of_drink[:sprite].class).to eq(Integer)
    end
  end
end