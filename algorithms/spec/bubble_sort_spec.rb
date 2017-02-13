require 'bubble_sort'

describe '#bubble_sort' do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it 'works with an empty array' do
    expect([].bubble_sort).to eq []
  end

  it 'works with an array of one item' do
    expect([1].bubble_sort).to eq [1]
  end

  it 'sorts numbers' do
    expect(array.bubble_sort).to eq array.sort
  end

  it 'will use block if given' do
    reversed = array.bubble_sort { |num1, num2| num2 <=> num1 }
    expect(reversed).to eq [5, 4, 3, 2, 1]
  end
end
