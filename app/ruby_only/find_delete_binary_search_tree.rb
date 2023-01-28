class Node
  attr_accessor :number, :left, :right

  def initialize(number)
    @number = number
    @left = nil
    @right = nil
  end
end

def find_node(root, key)
  return 'not found' if root.nil?
  return 'found' if root.number == key

  return find_node(root.right, key) if root.number < key

  return find_node(root.left, key) if root.number > key
end

def remove_node(root, key)
  return if root.nil?
  return nil if root.number == key

  if root.left.number == key
    root.left = nil
  elsif root.right.number == key
    root.right = nil
  end

  root
end

root = Node.new(6)
root.left = Node.new(3)
root.right = Node.new(7)
root.right.right = Node.new(8)
root.left.left = Node.new(2)
root.left.right = Node.new(5)

node = find_node(root, 2)
puts node

root = remove_node(root, 7)
node = find_node(root, 7)
puts node

node = find_node(root, 8)
puts node