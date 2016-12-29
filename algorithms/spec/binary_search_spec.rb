require 'binary_search'

describe '#binary_search' do
  let(:array) { [1, 2, 3, 4, 5] }

  it 'returns index of element if found' do
    expect(array.binary_search(1)).to eq 0
    expect(array.binary_search(2)).to eq 1
    expect(array.binary_search(3)).to eq 2
  end

  it 'returns nil if element was not found' do
    expect(array.binary_search(10)).to be nil
  end
end
