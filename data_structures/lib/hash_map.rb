require 'linked_list'

class MyHashMap
  include Enumerable

  attr_reader :count

  def initialize(size = 8)
    @store = Array.new(size) { LinkedList.new }
    @capacity = size
    @count = 0
  end

  def get(key)
    bucket = get_bucket(key)
    bucket.get(key)
  end

  def set(key, val)
    resize! if @count >= @capacity
    bucket = get_bucket(key)
    bucket.remove(key) if bucket.include?(key)
    bucket.insert(key, val)
    @count += 1
  end

  alias_method :[], :get
  alias_method :[]=, :set

  def include?(key)
    bucket = get_bucket(key)
    bucket.include?(key)
  end

  def delete(key)
    bucket = get_bucket(key)
    bucket.remove(key)
    @count -= 1
  end

  def each
    @store.each do |list|
      list.my_each { |link| yield [link.key, link.val] }
    end
  end

  protected
    attr_accessor :store, :capacity
    attr_writer :count

  private
    def get_bucket(key)
      store[key.hash % capacity]
    end

    def resize!
      old_store = store
      @capacity *= 2
      @store = Array.new(capacity) { LinkedList.new }
      @count = 0
      old_store.each do |list|
        list.my_each { |link| set(link.key, link.val) }
      end
    end
end
