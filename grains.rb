class Grains
  def self.square(num)
    if num <= 0 || num > 64
      raise ArgumentError
    end

    if num == 1
      return 1
    end

    sqr = 1
    (num - 1).times do
      sqr = sqr * 2
    end
    return sqr
  end

  def self.total
    sqr = 1
    sum = 1

    63.times do
      sqr = sqr * 2
      sum  = sum + sqr
    end
    return sum
    # 2 ** 64 + 1
  end
end