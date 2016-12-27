class MyArray
  attr_reader :length

  def initialize(size = 8, default_val = nil)
    @store = Array.new(size, default_val)
    @capacity = size
    @length = 0
    @start_idx = 0
  end

  def [](idx)
    check_index(idx)
    store[(start_idx + idx) % capacity]
  end

  def []=(idx, element)
    check_index(idx)
    store[(start_idx + idx) % capacity] = element
  end

  def push(element)
    resize! if length >= capacity
    @length += 1
    self[length-1] = element
  end

  def pop
    check_index
    popped, self[length-1] = self[length-1], nil
    @length -= 1
    popped
  end

  def unshift(element)
    resize! if length >= capacity
    @start_idx = (start_idx - 1) % capacity
    @length += 1
    self[0] = element
  end

  def shift
    check_index
    shifted, self[0] = self[0], nil
    @start_idx = (start_idx + 1) % capacity
    @length -= 1
    shifted
  end

  protected
    attr_accessor :store, :capacity, :start_idx
    attr_writer :length

    def check_index(idx = 0)
      raise 'index out of bounds' if length <= 0 || idx >= length
    end

    def resize!
      new_store = Array.new(capacity * 2)
      length.times { |i| new_store[i] = self[i] }

      @capacity *= 2
      @start_idx = 0
      @store = new_store
    end
end
