# rubocop: disable Rails/Output
class Node
  attr_accessor :prev_val, :next_val, :day_name

  def initialize(day_name)
    @prev_val = nil
    @next_val = nil
    @day_name = day_name
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end
end

mon = Node.new("Monday")
tue = Node.new("Tuesday")
wed = Node.new("Wednesday")
thu = Node.new("Thursday")
fri = Node.new("Friday")
sat = Node.new("Saturday")
sun = Node.new("Sunday")

day_names = [mon, tue, wed, thu, fri, sat, sun]
day_names.each_with_index do |day, index|
  day.prev_val = day_names[index - 1]
  day.next_val = day_names[index + 1]
end

puts "After #{mon.day_name}, it will be #{mon.next_val.day_name}"
puts "Before #{mon.day_name}, it will be #{mon.prev_val.day_name}"
puts "After #{sat.day_name}, it will be #{sat.next_val.day_name}"
puts "Before #{sat.day_name}, it will be #{sat.prev_val.day_name}"

linked_list = LinkedList.new
linked_list.head = mon
linked_list.tail = sun

puts "Head is on #{linked_list.head.day_name}"
puts "Tail is on #{linked_list.tail.day_name}"

# insert front
jack = Node.new("Jack")
jack.next_val = linked_list.head
jack.prev_val = linked_list.tail

linked_list.head = jack
puts "Head is on #{linked_list.head.day_name}"
puts "Head + 1 is on #{linked_list.head.next_val.day_name}"
puts "Tail is on #{linked_list.tail.day_name}"

# rubocop: enable Rails/Output
