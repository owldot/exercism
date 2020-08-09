class Integer

  def to_roman
    # digits = get_digits_place
    digits = self.to_s.chars.map(&:to_i)

    roman_thousands(digits[-4]) +
    roman_hundreds(digits[-3]) +
      roman_tens(digits[-2]) +
      roman_ones(digits[-1])
  end

  private

  def roman_thousands(number)
    if number.nil?
      ""
    else
      "M" * number
    end
  end

  def roman_hundreds(number)
    build_a_number(number, "C", "D", "M")
  end

  def roman_ones(number)
    build_a_number(number, "I", "V", "X")
  end

  def roman_tens(number)
    build_a_number(number, "X", "L", "C")
  end

  def build_a_number(number, base, base_5, base_next)
    case number
    when 0..3
      base * number
    when 4
      base + base_5
    when 5
      base_5
    when 6..8
      base_5 + base * (number % 5)
    when 9
      base + base_next
    else
      ""
    end
  end

  # def get_digits_place
  #   digits = []
  #   current_number = self.dup
  #
  #   loop do
  #     devided_by_ten = current_number / 10
  #
  #     if devided_by_ten > 0
  #       digits << current_number % 10
  #     else
  #       digits.push(current_number % 10)
  #       break
  #     end
  #
  #     current_number = devided_by_ten
  #   end
  #
  #   digits.reverse
  # end
end