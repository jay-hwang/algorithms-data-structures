class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def push(node)
    
  end

  def peek
    store[0]
  end

  def extract
  end

  protected
    attr_accessor :store

  def self.child_indices(len, parent_idx)
    [parent_idx * 2 + 1, parent_idx * 2 + 2].select { |i| i < len}
  end

  def self.parent_index(child_idx)
    raise 'root has no parent' if child_idx == 0
    (child_idx - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    parent = array[parent_idx]
    children = []
    child_idxs = child_indices(len, parent_idx)
    child_idxs.each { |child_idx| children << array[child_idx] if child_idx }

    return array if children.all? { |child| prc.call(parent, child) != 1 }

    smaller_idx = nil
    if children.count == 1
      smaller_idx = child_idxs[0]
    else
      smaller_idx =
        prc.call(children[0], children[1]) == 1 ? child_idxs[1] : child_idxs[0]
    end

    array[parent_idx], array[smaller_idx] =
      array[smaller_idx], array[parent_idx]

    heapify_down(array, smaller_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return array if child_idx == 0

    child = array[child_idx]
    parent_idx = parent_index(child_idx)
    parent = array[parent_idx]

    return array if prc.call(parent, child) != 1

    array[child_idx], array[parent_idx] =
      array[parent_idx], array[child_idx]

    heapify_up(array, parent_idx, len, &prc)
  end
end
