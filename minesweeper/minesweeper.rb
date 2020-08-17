class Board
  class << self
    def transform(input)
      board = Board.new(input)
      array = board.solve


      result = array.map do |row|
        '|' + row.join.gsub('0', ' ') + '|'
      end

      border = '+' + '-' * array.first.size + '+'

      result.push(border)
      result.insert(0, border)
      result
    end
  end

  attr_reader :input

  def initialize(input)
    @input = input
    validate!
  end

  def validate!
    unless input.size > 2 &&
      input.first.size >= 3 &&
      input.all? { |row| input.first.size == row.size } &&
      input.first =~ /\A\+-+\+\z/ &&
      input.last =~ /\A\+-+\+\z/ &&
      input[1...(input.size - 1)].all? { |row| row =~ /\A\|[\* ]+\|\z/ }

      raise ArgumentError
    end
  end

  def solve
    array = to_a
    neigbours = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1], [0, 0], [0, 1],
      [1, -1], [1, 0], [1, 1],
    ]

    array.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell == '*'
          neigbours.each do |x_offset, y_offset|
            if x + x_offset < 0 || y + y_offset < 0 || x + x_offset >= row.size || y + y_offset >= array.size
              next
            end

            if array[y + y_offset][x + x_offset] != '*'
              array[y + y_offset][x + x_offset] += 1
            end
          end
        end
      end
    end

    array
  end

  def to_a
    input.shift
    input.pop
    input.map do |row|
      arr = row.chars
      arr.shift
      arr.pop
      arr.map { |el| el == ' ' ? 0 : '*' }
    end

  end
end
