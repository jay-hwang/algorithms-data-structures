class Stack
  attr_reader :length

  def initialize
    @store = []
    @capacity = 8
    @length = 0
    @start_idx = 0
  end

  def peek
    check_index
    @store[length-1]
  end

  def push(node)
    resize! if length >= @capacity
    @length += 1
    @store[length-1] = node
    @store
  end

  def pop
    check_index
    popped, @store[length-1] = @store[length-1], nil
    @length -= 1
    popped
  end

  def empty?
    length == 0 ? true : false
  end

  private
    attr_accessor :store, :capacity
    attr_writer :length

    def check_index(idx = 0)
      raise 'index out of bounds' if length <= 0 || idx >= length
    end

    def [](idx)
      store[(@start_idx + idx) % capacity]
    end

    def []=(idx, node)
      store[(@start_idx + idx) % capacity] = node
    end

    def resize!
      new_store = Array.new(capacity * 2, nil)
      length.times { |i| new_store[i] = self[i] }

      @capacity *= 2
      @start_idx = 0
      @store = new_store
    end
end
