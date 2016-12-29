class Queue
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
    self[length-1] = element
    store
  end

  def dequeue
    check_index
    dequeued, self[0] = self[0], nil
    @start_idx = (@start_idx + 1) % capacity
    @length -= 1
    dequeued
  end

  def first
    check_index
    self[0]
  end

  def last
    check_index
    self[length-1]
  end

  def empty?
    length == 0 ? true : false
  end

  protected
    attr_accessor :store, :capacity, :start_idx
    attr_writer :length

    def check_index(idx = 0)
      raise 'index out of bounds' if length <= 0 || idx >= length
    end

    def [](idx)
      check_index(idx)
      store[(start_idx + idx) % capacity]
    end

    def []=(idx, element)
      check_index(idx)
      store[(start_idx + idx) % capacity] = element
    end

    def resize!
      @length, @start_idx = 0, 0
      old_store = store
      @store = Array.new(capacity * 2, nil)
      old_store.each { |node| @store.push(node) }
      @capacity *= 2
    end
end
