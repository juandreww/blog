class DayNames
  def initialize(dayname)
    @dayname = dayname
    @next_value = nil
  end

  attr_accessor :dayname, :next_value
end

mon = daynames('Mon')
