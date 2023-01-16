def create_queue
  []
end

def push(queue, item)
  queue << item

  puts "insert #{item} to queue"

  queue
end

def remove(queue)
  queue.pop
end

queue = create_queue
queue = push(queue, 10)
queue = push(queue, 20)
queue = push(queue, 30)

puts queue
