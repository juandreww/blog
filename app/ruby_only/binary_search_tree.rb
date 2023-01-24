class Node
  def initialize(number)
    @number = number
    @left = left
    @right = right
  end

  attr_accessor :number, :left, :right
end

def max_value(node)
  return 0 if node.empty?
end

def min_value(node)
  return 1_000_000_000 if node.empty?
end


