class MyQueue
  attr_reader :length

  def initialize(size = 8)
    @store = Array.new(size, nil)
    @capacity = size
    @length = 0
  end

  def enqueue(element)
    resize! if length >= capacity

    store << element
    length += 1
  end

  def dequeue
    dequeued = store[0]
    store[0] = nil
    
  end

  def peek
  end

  private
    attr_accessor :store, :capacity
    attr_writer :length

    def resize!

    end
end
