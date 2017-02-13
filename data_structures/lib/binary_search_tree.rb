require 'byebug'

class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end
    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node.is_a? BSTNode

    if node.value >= value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if node.value > value
      return BinarySearchTree.find!(node.left, value)
    else
      return BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] unless node
    left = BinarySearchTree.preorder!(node.left)
    right = BinarySearchTree.preorder!(node.right)

    return [node.value] + left + right
  end

  def self.inorder!(node)
    return [] unless node
    left = BinarySearchTree.inorder!(node.left)
    right = BinarySearchTree.inorder!(node.right)

    nodes = left + [node.value] + right
    return nodes.sort
  end

  def self.postorder!(node)
    return [] unless node
    left = BinarySearchTree.inorder!(node.left)
    right = BinarySearchTree.inorder!(node.right)

    return left.reverse + right.reverse + [node.value]
  end

  def self.height!(node)
    return -1 unless node

    max_height = [
      BinarySearchTree.height!(node.left),
      BinarySearchTree.height!(node.right)
    ].max

    max_height + 1
  end

  def self.max(node)
    return nil unless node.is_a? BSTNode
    return node unless node.right

    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil unless node.is_a? BSTNode
    return node unless node.left

    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if node.value > value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif node.value < value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left

      t = node
      node = BinarySearchTree.min(t.right)
      node.right = BinarySearchTree.delete_min!(t.right)
      node.left = t.left
    end
    node
  end
end


def self.find!(node, value)
  return nil unless node
  return node if node.value == value

  if node.value > value
    return BinarySearchTree.find!(node.left, value)
  else
    return BinarySearchTree.find!(node.right, value)
  end
end
