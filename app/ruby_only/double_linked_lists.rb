class Node
  attr_accessor :prev, :next

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
day_names.each_with_index do |day|

end