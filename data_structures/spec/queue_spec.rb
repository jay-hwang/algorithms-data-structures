require 'queue'

describe Queue do
  let(:queue) { Queue.new }

  it 'starts out empty' do
    expect(queue.length).to eq 0
    expect { queue.first }.to raise_error 'index out of bounds'
  end

  it 'can store more than 8 items' do
    10.times { |i| queue.enqueue(i) }
    expect(queue.length).to eq 10
  end

  describe '#first' do
    it 'returns first item in queue' do
      queue.enqueue(1)
      expect(queue.first).to eq 1
    end

    it 'raises error if called when queue is empty' do
      expect { queue.first }.to raise_error 'index out of bounds'
    end
  end

  describe '#last' do
    it 'returns last item in queue' do
      queue.enqueue(1)
      expect(queue.last).to eq 1
      queue.enqueue(2)
      expect(queue.last).to eq 2
    end

    it 'raises error if called when queue is empty' do
      expect { queue.last }.to raise_error 'index out of bounds'
    end
  end

  describe '#empty?' do
    it 'returns true if queue is empty' do
      expect(queue.empty?).to be true
    end

    it 'returns false if queue is not empty' do
      queue.enqueue(1)
      expect(queue.empty?).to be false
    end
  end

  describe '#enqueue' do
    it 'enqueues items' do
      3.times { |i| queue.enqueue(i) }
      expect(queue.first).to eq 0
      expect(queue.last).to eq 2
    end

    it 'keeps track of length on enqueue' do
      expect(queue.length).to eq 0
      queue.enqueue(1)
      expect(queue.length).to eq 1
      queue.enqueue(2)
      expect(queue.length).to eq 2
    end
  end

  describe '#dequeue' do
    it 'dequeues items' do
      5.times { |i| queue.enqueue(i) }
      queue.dequeue
      expect(queue.first).to eq 1
      queue.dequeue
      expect(queue.first).to eq 2
    end

    it 'keeps track of length on dequeue' do
      5.times { |i| queue.enqueue(i) }
      expect(queue.length).to eq 5

      queue.dequeue
      expect(queue.length).to eq 4
      queue.dequeue
      expect(queue.length).to eq 3
    end
  end

  describe '#resize!' do
    it "doubles capacity when filled" do
      store = queue.send(:store)

      8.times do |i|
        queue.enqueue(i)
        expect(queue.send(:store)).to be(store)
        expect(queue.send(:capacity)).to eq(8)
      end

      queue.enqueue(8)
      expect(queue.send(:capacity)).to eq(16)
    end
  end
end
