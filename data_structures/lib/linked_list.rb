class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def first
    head.next
  end

  def last
    tail.prev
  end

  def [](idx)
    i = 0
    my_each do |current_node|
      return current_node.val if i == idx
      i += 1
    end
    nil
  end

  def get(key)
    current_node = first
    until current_node == tail
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    new_link.next = tail
    new_link.prev = last
    last.next = new_link
    @tail.prev = new_link

    new_link
  end

  def remove(key)
    current_node = first
    until current_node == tail
      if current_node.key == key
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
      end
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = first
    until current_node == tail
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def my_each
    current_node = first
    until current_node == tail
      yield current_node
      current_node = current_node.next
    end
  end
end
