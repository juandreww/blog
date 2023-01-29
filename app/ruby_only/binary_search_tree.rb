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

  left_max = max_value(node.left)
  right_max = max_value(node.right)

  compare_left_and_right(node, left_max, right_max, "<")
end

def min_value(node)
  return 1_000_000_000 if node.nil?

  left_max = min_value(node.left)
  right_max = min_value(node.right)

  compare_left_and_right(node, left_max, right_max, "<")
end

def compare_left_and_right(node, left_max, right_max, comparison = ">")
  compared_value = case comparison
                   when ">"
                     left_max > right_max
                   else
                     left_max < right_max
                   end

  value = case compared_value
          when true
            left_max
          else
            right_max
          end

  value = node.number if value > node.number

  value
end

# rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity
def bst?(node)
  return true if node.nil?

  return false if !node.left.nil? && max_value(node.left) > node.number

  return false if !node.right.nil? && min_value(node.right) < node.number

  return false if bst?(node.left) == false || bst?(node.right) == false

  true
end
# rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity

def insert_node(root, key)
  if root.nil?
    Node.new(key)
  elsif root.number < key
    root.right = insert_node(root.right, key)
  elsif root.number > key
    root.left = insert_node(root.left, key)
  end

  root
end

def find_node(root, key)
  if root.nil?
    nil
  elsif root.left.number == key
    root.left
  elsif root.right.number == key
    root.right
  end

  # elsif key > root.left.number && key < root.right.number
end

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(5)
root.left.left = Node.new(1)
root.left.right = Node.new(3)
root = insert_node(root, 6)
node = find_node(root, 6)
puts node.number

if bst?(root)
  puts "It is a BST"
else
  puts "It is not a BST"
end
