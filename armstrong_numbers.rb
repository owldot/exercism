class ArmstrongNumbers
  class << self
    def include?(number)
      # digits = number.to_s.chars.map(&:to_i)
      digits = number.digits

      power = digits.length
      number == digits.reduce(0) { |acc, num| acc + num ** power }
    end
  end
end