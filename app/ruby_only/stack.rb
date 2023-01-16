def create_stack
  []
end

def push(stack, item)
  stack << item

  puts "insert #{item} to stack"
  puts stack.inspect

  stack
end

def remove(stack)
  stack.pop

  stack
end

stack = create_stack
stack = push(stack, 10)
stack = push(stack, 20)
stack = push(stack, 30)
stack = remove(stack)
puts stack.inspect
puts stack == [10, 20]
