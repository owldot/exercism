class Sieve
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def primes
    if @number < 2
      return []
    end

    array = (2..@number).to_a

    array.each do |number|
      next if number.nil?

      mark(number, array)
    end

    array.compact
  end

  def mark(number, array)
    multiplier = 2
    loop do
      calculated_number = multiplier * number

      break if calculated_number > @number

      array[calculated_number - 2] = nil
      multiplier += 1
    end
  end
end