require 'queue'

describe MyQueue do
  let(:queue) { MyQueue.new }

  it 'starts out empty' do
    expect(queue.length).to eq 0
    expect { queue.first }.to raise_error 'index out of bounds'
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

  describe '#empty' do
    it 'returns true if queue is empty'
    it 'returns false if queue is not empty'
  end

  describe '#enqueue' do
    it 'enqueues items'
    it 'keeps track of length on enqueue'
  end

  describe '#dequeue' do
    it 'dequeues items'
    it 'keeps track of length on dequeue'
  end

  it 'correctly handles a mix of queues and dequeues'

  describe 'resize!' do
    it 'doubles capacity'
    it 'copies all elements over properly'
  end

  it 'can store more than 8 items'

  it 'correctly handles a mix of queues and dequeues after resizing'
end
