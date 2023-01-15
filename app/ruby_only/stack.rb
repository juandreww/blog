class Stack
  def create_stack
    []
  end

  def push(stack, item)
    stack << item
    puts "#{item} is pushed to the stack"
  end

  def remove(stack)
    stack.pop
  end
end

stack_klass = Stack.new
stack = []
stack = stack_klass.push(stack, 10)
stack = stack_klass.push(stack, 20)
stack = stack_klass.push(stack, 30)
puts stack
