class Node
  def initialize(number)
    @number = number
    @left = left
    @right = right
  end

  attr_accessor :number, :left, :right
end

# rubocop: disable Metrics/MethodLength
def max_value(node)
  return 0 if node.nil?

  assign_value(node, '>')
end

def min_value(node)
  return 1_000_000_000 if node.nil?

  left_max = min_value(node.left)
  right_max = min_value(node.right)

  value = case left_max < right_max
          when true
            left_max
          else
            right_max
          end

  value = node.number if value > node.number

  value
end
# rubocop: enable Metrics/MethodLength

def assign_value(node, comparison = '>')
  left_max = max_value(node.left)
  right_max = max_value(node.right)
  comparison = case comparison
               when '>'
                 left_max > right_max
               else
                 left_max < right_max
               end

  value = case comparison
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

  return false if node.left.present? && max_value(node.left) > node.number

  return false if node.right.present? && min_value(node.right) < node.number

  return false if bst?(node.left) == false || bst?(node.right) == false

  true
end
# rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(5)
root.left.left = Node.new(1)
root.left.right = Node.new(3)

if bst?(root)
  puts "It is a BST"
else
  puts "It is not a BST"
end
