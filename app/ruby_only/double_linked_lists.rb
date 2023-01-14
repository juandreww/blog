# rubocop: disable Rails/Output
class Node
  attr_accessor :prev_val, :next_val, :day_name

  def initialize(day_name)
    @prev_val = nil
    @next_val = nil
    @day_name = day_name
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

# rubocop: enable Rails/Output
