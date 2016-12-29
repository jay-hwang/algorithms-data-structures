require 'stack'

describe Stack do
  let(:stack) { Stack.new }

  it 'starts out empty' do
    expect(stack.length).to eq 0
    expect { stack.peek }.to raise_error 'index out of bounds'
  end

  it 'can store more than 8 items' do
    10.times { |i| stack.push(i) }
    expect(stack.length).to eq 10
  end

  describe '#peek' do
    it 'raises error if called when stack is empty' do
      expect { stack.peek }.to raise_error 'index out of bounds'
    end

    it 'returns last element in stack' do
      5.times { |i| stack.push(i) }
      expect(stack.peek).to eq 4
    end
  end

  describe '#push' do
    it 'adds element to end of stack' do
      stack.push(5)
      expect(stack.peek).to eq 5
      10.times { |i| stack.push(i) }
      expect(stack.peek).to eq 9
    end

    it 'keeps track of length on push' do
      expect(stack.length).to eq 0
      stack.push(1)
      expect(stack.lengtH).to eq 1
      5.times { |i| stack.push(i) }
      expect(stack.length).to eq 6
    end
  end

  describe '#pop' do
    it 'raises error if stack is empty' do
      expect { stack.pop }.to raise_error 'index out of bounds'
    end

    it 'removes and returns last element from stack' do
      5.times { |i| stack.push(i) }
      4.downto(0) do |i|
        expect(stack.pop).to eq i
      end
    end

    it 'keeps track of length on pop' do
      expect(stack.length).to eq 0
      10.times { |i| stack.push(i) }
      expect(stack.length).to eq 10
    end
  end

  describe '#empty?' do
    it 'returns true if stack is empty' do
      expect(stack.empty?).to be true
    end

    it 'returns false if stack is not empty' do
      stack.push(1)
      expect(stack.empty?).to be false
    end

  end

  describe '#resize' do
    it 'doubles capacity when filled' do
      store = stack.send(:store)

      8.times do |i|
        stack.push(i)
        expect(stack.send(:store)).to be store
        expect(stack.send(:capacity)).to eq 8
      end

      stack.push(8)
      expect(stack.send(:capacity)).to eq 16
    end
  end
end
