class MyQueue
  attr_reader :length

  def initialize(size = 8)
    @store = Array.new(size, nil)
    @capacity = size
    @length = 0
    @start_idx = 0
  end

  def enqueue(element)
    resize! if length >= capacity
    @length += 1
    store[length-1] = element
    store
  end

  def dequeue
    check_index
    dequeued, store[0] = store[0], nil
    @start_idx = (@start_idx + 1) % capacity
    @length -= 1
    dequeued
  end

  def first
    check_index
    store[0]
  end

  def last
    check_index
    store[length-1]
  end

  def empty?
    length == 0 ? true : false
  end

  protected
    attr_accessor :store, :capacity
    attr_writer :length

    def check_index(idx = 0)
      raise 'index out of bounds' if length <= 0 || idx >= length
    end

    def []=(idx, element)
      check_index(idx)
      store[(start_idx + idx) % capacity] = element
    end

    def resize!
      new_store = Array.new(capacity * 2, nil)
      length.times { |i| new_store[i] = self[i] }

      @capacity *= 2
      @start_idx = 0
      @store = new_store
    end
end
