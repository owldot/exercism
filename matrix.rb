require 'pry'

class Matrix
  def initialize(string)
    @matrix = [[]]
    string.lines.map(&:strip).each_with_index do |line, line_number|
      @matrix[line_number] = []
      line.split(' ').each_with_index do |element, col_number|
        @matrix[line_number][col_number] = element.to_i
      end
    end
  end

  def rows
    @rows ||= @matrix
  end

  def columns
    @columns ||= rotate
  end

  private

  def rotate
    # we can always use Array#transpose but where is fun then
    result = []

    for col in 0..(@matrix[0].length - 1) do
      result[col] = []
      for row in 0..(@matrix.length - 1) do
        result[col][row] = @matrix[row][col]
      end
    end

    result
  end
end
