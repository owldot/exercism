class PrimeFactors
  class << self

    def of(number)
      if number < 2
        return []
      else

        factor = 2
        results = []
        number_after_division = number

        loop do
          if number_after_division % factor == 0
            number_after_division = number_after_division / factor
            results << factor
          else
            factor = factor + 1
          end

          if number_after_division <= 1
            break
          end
        end

        results
      end
    end

    def find_primes(number)
      result = (2..number).to_a
      result.each do |current|
        next_factor = 2
        loop do
          if current.nil? || current * next_factor > number
            break
          end
          result[current * next_factor - 2] = nil
          next_factor += 1
        end
      end

      result.compact.to_enum
    end
  end
end

