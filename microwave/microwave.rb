class Microwave
  def initialize(seconds)
    @seconds = seconds
  end

  def timer
    if @seconds < 100
      minutes = @seconds / 60
      seconds = @seconds % 60

    else
      minutes = @seconds / 100
      seconds = @seconds % 100

      # in case if input is 390, that needs to transform to 04:30
      if seconds > 59
        minutes += 1
        seconds = seconds % 60
      end
    end

    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
end