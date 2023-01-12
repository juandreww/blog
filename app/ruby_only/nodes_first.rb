class DayNames
  def initialize(dayname)
    @dayname = dayname
    @next_value = nil
  end

  attr_accessor :dayname, :next_value
end

mon = DayNames.new("Mon")
puts "#{mon.dayname} .. #{mon.next_value}"
mon.next_value = 'arab'
puts "#{mon.dayname} .. #{mon.next_value}"