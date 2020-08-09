class Prime
  def initialize(nth)
    if nth == 0
      raise ArgumentError
    end

    @primes = [2]
    @nth = nth
  end

  def nth
    number = 3

    loop do
      if @nth == @primes.size
        break
      end

      if is_prime?(number)
        @primes << number
      end
      number += 1
    end

    @primes[@nth - 1]
  end

  def self.nth(nth)
    Prime.new(nth).nth
  end

  def is_prime?(number)
    if number == 2
      return true
    end

    # checks for primes
    @primes.each do |prime|
      if number % prime == 0
        return false
      end
    end

    factor = 2
    limit = number / 2 + 1
    loop do
      if factor == limit
        return true
      end

      if number % factor == 0
        return false
      else
        factor = factor + 1
      end
    end

  end
end