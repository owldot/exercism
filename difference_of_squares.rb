class Squares
  def initialize(number)
    @numbers = (1..number).map { |num| num }
  end

  def square_of_sum
    @numbers.reduce(&:+) ** 2
  end

  def sum_of_squares
    @numbers.reduce(0) { |acc, number| acc + number ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end