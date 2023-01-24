class Node
  def initialize(number)
    @number = number
    @left = left
    @right = right
  end

  attr_accessor :number, :left, :right
end

def max_value(node)
  return 0 if node.nil?
end

def min_value(node)
  return 1_000_000_000 if node.nil?
end

def bst?(node)
  return true if node.nil?
end

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(5)
root.left.left = Node.new(1)
root.left.right = Node.new(3)

if bst?(root)
  puts "It is BST"
else
  puts "It is not a BST"
end
