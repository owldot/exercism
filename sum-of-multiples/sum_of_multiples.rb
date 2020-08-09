class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    if @multiples.empty?
      return 0
    end

    #test_the_only_multiple_of_0_is_0

    @multiples.delete(0)
    sum_multiples_numbers = 0

    (0...limit).each do |number|
      if @multiples.any? { |multiple| number % multiple == 0 }
        sum_multiples_numbers += number
      end
    end
    sum_multiples_numbers
  end
end