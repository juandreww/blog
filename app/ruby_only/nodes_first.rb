class DayNames
  def initialize(dayname)
    @dayname = dayname
    @next_value = nil
  end

  attr_accessor :dayname, :next_value
end

mon = DayNames.new("Mon")
tue = DayNames.new("Tue")
wed = DayNames.new("Wed")

puts "#{mon.dayname} .. #{mon.next_value}"
mon.next_value = "arab"
puts "#{mon.dayname} .. #{mon.next_value}"
mon.next_value = tue
tue.next_value = wed

puts mon.next_value.dayname
days = mon

while days
  puts "Today is #{days.dayname}"
  days = days.next_value
end
