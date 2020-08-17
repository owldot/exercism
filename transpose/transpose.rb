class Transpose
  SPECIAL_SYMBOL = "\0"

  class << self
    def transpose(input)
      transpose = Transpose.new(input)
      transpose.transpose
    end
  end

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def transpose
    if input.empty?
      return ''
    end

    array = input.split("\n")

    max_line_size = array.inject(0) do |acc, line|
      if acc < line.size
        acc = line.size
      end

      acc
    end

    array = array.map do |line|
      line.ljust(max_line_size, SPECIAL_SYMBOL).chars
    end
    
    array
      .transpose
      .map(&:join)
      .join("\n")
      .gsub(/#{SPECIAL_SYMBOL}+$/, '')
      .gsub(/#{SPECIAL_SYMBOL}/, ' ')
  end
end
