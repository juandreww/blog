RSpec.describe 'matching arguments' do
  it 'can return different values depending on the argument' do
    three_element_array = double

    allow(three_element_array).to receive(:first).with(no_args).and_return(1)
    allow(three_element_array).to receive(:first).with(1).and_return([1])
    allow(three_element_array).to receive(:first).with(2).and_return([1, 2])
    allow(three_element_array).to receive(:first).with(be >= 3).and_return([1, 2, 3])

    expect(three_element_array.first).to eq(1)
    expect(three_element_array.first(1)).to eq([1])
    expect(three_element_array.first(2)).to eq([1, 2])
    expect(three_element_array.first(3)).to eq([1, 2, 3])
    expect(three_element_array.first(100)).to eq([1, 2, 3])
  end

  it 'return values depending on the condition given' do
    tissue_hash = double

    allow(tissue_hash).to receive(:brand).with(no_args).and_return({brand: 'Kodomo Baby'})
    allow(tissue_hash).to receive(:brand).with('Tessa').and_return({brand: 'Tessa'})

    expect(tissue_hash.brand).to eq(
      {brand: 'Kodomo Baby'}
    )
    expect(tissue_hash.brand('Tessa')).to eq(
      {brand: 'Tessa'}
    )
  end

  it 'return values depending on the condition given #using stub' do
    tissue_hash = double

    tissue_hash.stub(:brand).and_return({brand: 'Kodomo Baby'})
    tissue_hash.stub(:brand).with('Tessa').and_return({brand: 'Tessa'})

    allow(tissue_hash).to receive(:brand).with(no_args).and_return({brand: 'Kodomo Baby'})
    allow(tissue_hash).to receive(:brand).with('Tessa').and_return({brand: 'Tessa'})

    expect(tissue_hash.brand).to eq(
      {brand: 'Kodomo Baby'}
    )
    expect(tissue_hash.brand('Tessa')).to eq(
      {brand: 'Tessa'}
    )
  end
end