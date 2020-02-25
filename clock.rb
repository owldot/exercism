class Clock
  include Comparable

  attr_reader :minute, :hour

  def initialize(hour: 0, minute: 0)
    @hour = hour

    # minutes roll over to hours
    rolled_hours = minute / 60
    @hour += rolled_hours

    @hour = @hour % 24 # if it spills over 24 hours we need to handle that

    minutes = minute % 60
    @minute = minutes
  end

  def +(another)
    Clock.new(hour: self.hour + another.hour, minute: self.minute + another.minute)
  end

  def -(another)
    Clock.new(hour: self.hour - another.hour, minute: self.minute - another.minute)
  end

  def <=>(another)
    hour_comparison = self.hour <=> another.hour
    if hour_comparison == 0
      self.minute <=> another.minute
    else
      hour_comparison
    end
  end

  def to_s

    "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
  end
end