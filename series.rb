require 'pry'
class Series
  def initialize(series)
    @series = series
    @length = @series.size
  end

  def slices(length_of_chunk)
    if length_of_chunk > length
      raise ArgumentError.new('Size too long')
    end

    result = []
    series.split('').each_with_index do |_, index|
      break result if length - length_of_chunk - index < 0 # amount of iterations

      result << series[index...(index + length_of_chunk)]
    end
  end

  private

  attr_reader :series, :length
end